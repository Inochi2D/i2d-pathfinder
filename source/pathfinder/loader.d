module pathfinder.loader;
import bindbc.loader;
import pathfinder.types;
import pathfinder.funcs;

enum PFSupport {
    noLibrary,
    badLibrary,
    pf3
}

private {
    SharedLib lib;
    PFSupport loadedVersion;
}

PFSupport loadedPFVersion() {
    return loadedVersion;
}

bool isPFLoaded() {
    return lib != invalidHandle;
}

PFSupport loadPF() {
    version (Windows) {
        const(char)[][1] libNames =
            [
                "pathfinder.dll"
            ];
    } else version (OSX) {
        const(char)[][1] libNames =
            [
                "libpathfinder.dylib"
            ];
    } else version (Posix) {
        const(char)[][2] libNames =
            [
                "libpathfinder.so",
                "/usr/local/lib/libpathfinder.so",
            ];
    } else
        static assert(0, "libPF is not yet supported on this platform.");

    PFSupport ret;
    foreach (name; libNames) {
        ret = loadPF(name.ptr);
        if (ret != PFSupport.noLibrary)
            break;
    }
    return ret;
}

PFSupport loadPF(const(char)* libName) {
    lib = load(libName);
    if (lib == invalidHandle) {
        return PFSupport.noLibrary;
    }

    int loaded;
    loadedVersion = PFSupport.badLibrary;

    import std.algorithm.searching : startsWith;
    static foreach (m; __traits(allMembers, pathfinder.funcs)) {
        static if (m.startsWith("PF") && is(__traits(getMember, pathfinder.funcs, m) == function)) {
            lib.bindSymbol(
                cast(void**)&__traits(getMember, pathfinder.funcs, m),
                __traits(getMember, pathfinder.funcs, m).stringof
            );

            loaded++;
        }
    }

    loaded -= errorCount();
    if (loaded > 0)
        return PFSupport.badLibrary;

    loadedVersion = PFSupport.pf3;
    return loadedVersion;
}

void unloadPF() {
    unload(lib);
    lib = invalidHandle;
    
    import std.algorithm.searching : startsWith;
    static foreach (m; __traits(allMembers, pathfinder.funcs)) {
        static if (m.startsWith("PF") && is(__traits(getMember, pathfinder.funcs, m) == function)) {
            __traits(getMember, pathfinder.funcs, m) = null;
        }
    }
}
