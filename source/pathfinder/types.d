module pathfinder.types;

nothrow @nogc
extern (C):

enum PFLineCap {
    PF_LINE_CAP_BUTT = 0,
    PF_LINE_CAP_SQUARE = 1,
    PF_LINE_CAP_ROUND = 2,
}

enum PFLineJoin {
    PF_LINE_JOIN_MITER = 0,
    PF_LINE_JOIN_BEVEL = 1,
    PF_LINE_JOIN_ROUND = 2,
}

enum PFTextAlign {
    PF_TEXT_ALIGN_LEFT = 0,
    PF_TEXT_ALIGN_CENTER = 1,
    PF_TEXT_ALIGN_RIGHT = 2,
}

enum PFTextBaseline {
    PF_TEXT_BASELINE_ALPHABETIC = 0,
    PF_TEXT_BASELINE_TOP = 1,
    PF_TEXT_BASELINE_HANGING = 2,
    PF_TEXT_BASELINE_MIDDLE = 3,
    PF_TEXT_BASELINE_IDEOGRAPHIC = 4,
    PF_TEXT_BASELINE_BOTTOM = 5,
}

// `content`

enum PFArcDirection {
    PF_ARC_DIRECTION_CW = 0,
    PF_ARC_DIRECTION_CCW = 1,
}

// `gl`

enum PFGLVersion {
    PF_GL_VERSION_GL3 = 0,
    PF_GL_VERSION_GLES3 = 1,
    PF_GL_VERSION_GL4 = 2,
}

// `renderer`

enum PFRenderOptionsFlags {
    PF_RENDERER_OPTIONS_FLAGS_HAS_BACKGROUND_COLOR = 0x1,
    PF_RENDERER_OPTIONS_FLAGS_SHOW_DEBUG_UI = 0x2,
}

enum PFRendererLevel {
    PF_RENDERER_LEVEL_D3D9 = 0x1,
    PF_RENDERER_LEVEL_D3D11 = 0x2,
}

// External: `font-kit`
alias FKHandleRef = void*;

// `canvas`
struct PFCanvas;
alias PFCanvasRef = PFCanvas*;

struct PFPath;
alias PFPathRef = PFPath*;

struct PFCanvasFontContext;
alias PFCanvasFontContextRef = PFCanvasFontContext*;

struct PFFillStyle;
alias PFFillStyleRef = PFFillStyle*;

struct PFTextMetrics {
    float width;
}

// `content`

struct PFColorF {
    float r;
    float g;
    float b;
    float a;
}

struct PFColorU {
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

// `geometry`

struct PFVector2F {
    float x;
    float y;
}

struct PFVector2I {
    int x;
    int y;
}

struct PFRectF {
    PFVector2F origin;
    PFVector2F lower_right;
}

struct PFRectI {
    PFVector2I origin;
    PFVector2I lower_right;
}

/// Row-major order.
struct PFMatrix2x2F {
    float m00, m01, m10, m11;
}

/// Row-major order.
struct PFTransform2F {
    PFMatrix2x2F matrix;
    PFVector2F vector;
}

/// Row-major order.
struct PFTransform4F {
    float   m00, m01, m02, m03,
            m10, m11, m12, m13,
            m20, m21, m22, m23,
            m30, m31, m32, m33;
}

struct PFPerspective {
    PFTransform4F transform;
    PFVector2I window_size;
}

struct PFGLDevice;
alias PFGLDeviceRef = PFGLDevice*;

alias PFGLFunctionLoader = extern(C) void* function(const(char)* name, void* user_data);

struct PFGLDestFramebuffer;
alias PFGLDestFramebufferRef = PFGLDestFramebuffer*;

struct PFGLRenderer;
alias PFGLRendererRef = PFGLRenderer*;

struct PFMetalDestFramebuffer;
alias PFMetalDestFramebufferRef = void*;

struct PFMetalRenderer;
alias PFMetalRendererRef = void*;

struct PFResourceLoader;
alias PFResourceLoaderRef = PFResourceLoader*;

struct PFMetalDevice;
alias PFMetalDeviceRef = PFMetalDevice*;

struct PFScene;
alias PFSceneRef = PFScene*;

struct PFSceneProxy;
alias PFSceneProxyRef = PFSceneProxy*;

struct PFRendererMode {
    PFRendererLevel level;
}

alias PFDestFramebufferRef = void*;
struct PFRendererOptions {
    PFDestFramebufferRef dest;
    PFColorF background_color;
    PFRenderOptionsFlags flags;
}

struct PFBuildOptions;
alias PFBuildOptionsRef = PFBuildOptions*;

struct PFRenderTransform;
alias PFRenderTransformRef = PFRenderTransform*;