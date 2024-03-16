module pathfinder.funcs;
import pathfinder.types;

nothrow @nogc:
extern (C):

__gshared {

    /**
        Creates a new canvas from a font context and size.

        This function adds a reference to font_context, which must be released by you.
    */
    PFCanvasRef function(PFCanvasFontContextRef font_context, const(PFVector2F)* size) PFCanvasCreate;

    /**
        Destroys the canvas
    */
    void function(PFCanvasRef canvas) PFCanvasDestroy;

    /**
        Creates a canvas font context with the system source.
    */
    PFCanvasFontContextRef function() PFCanvasFontContextCreateWithSystemSource;

    /**
        Creates a Pathfinder font context from a set of `font-kit` fonts.
        
        Note that `font-kit` itself has a C API. You can use this to load fonts from memory with e.g.
        `FKHandleCreateWithMemory()`.
    */
    PFCanvasFontContextRef function(FKHandleRef fonts, size_t fontCount) PFCanvasFontContextCreateWithFonts;

    /**
        Adds a reference to the font context
    */
    PFCanvasFontContextRef function(PFCanvasFontContextRef fontContext) PFCanvasFontContextAddRef;

    /**
        Releases a reference from the font context
    */
    void function() PFCanvasFontContextAddRelease;

    /**
        Creates a new scene from the canvas

        This function takes ownership of the supplied canvas and will automatically destroy it when
        the scene is destroyed.
    */
    PFSceneRef function(PFCanvasRef canvas) PFCanvasCreateScene;

    /**
        Destroys the scene
    */
    void function(PFSceneRef scene) PFSceneDestroy;

    /**
        Draws a filled rectangle
    */
    void function(PFCanvasRef canvas, PFRectF* rect) PFCanvasFillRect;
    
    /**
        Draws the outline of a rectangle
    */
    void function(PFCanvasRef canvas, PFRectF* rect) PFCanvasStrokeRect;
    
    /**
        Draws a filled string of text
    */
    void function(PFCanvasRef canvas, const(char)* text, size_t length, const(PFVector2F)* position) PFCanvasFillText;
    
    /**
        Draws the outline of a string of text
    */
    void function(PFCanvasRef canvas, const(char)* text, size_t length, const(PFVector2F)* position) PFCanvasStrokeText;
    
    /**
        Measures the text
    */
    void function(PFCanvasRef canvas, const(char)* text, size_t length, PFTextMetrics* outMetrics) PFCanvasMeasureText;
    
    /**
        Sets the stroke line width
    */
    void function(PFCanvasRef canvas, float newWidth) PFCanvasSetLineWidth;
    
    /**
        Sets the stroke line cap style
    */
    void function(PFCanvasRef canvas, PFLineCap capStyle) PFCanvasSetLineCap;
    
    /**
        Sets the stroke line join style
    */
    void function(PFCanvasRef canvas, PFLineJoin joinStyle) PFCanvasSetLineJoin;
    
    /**
        Sets the stroke miter limit
    */
    void function(PFCanvasRef canvas, float newLimit) PFCanvasSetMiterLimit;
    
    /**
        Sets the stroke miter limit
    */
    void function(PFCanvasRef canvas, const(float)* dashArr, size_t length) PFCanvasSetLineDash;
    
    /**
        Sets the transform to apply to the drawing routines.

        Use `PFCanvasResetTransform` to reset to defaults.
    */
    void function(PFCanvasRef canvas, const(PFTransform2F)* transform) PFCanvasSetTransform;
    
    /**
        Resets the transform to its defaults.
    */
    void function(PFCanvasRef canvas) PFCanvasResetTransform;

    /**
        Saves the state of the canvas
    */
    void function(PFCanvasRef canvas) PFCanvasSave;

    /**
        Restores the state of the canvas from a saved state.
    */
    void function(PFCanvasRef canvas) PFCanvasRestore;
    
    /**
        Sets the offset of line dashes
    */
    void function(PFCanvasRef canvas, float newOffset) PFCanvasSetLineDashOffset;
    
    /**
        Sets the active font using its Postscript name
    */
    void function(PFCanvasRef canvas, const(char)* str, size_t length) PFCanvasSetFontByPostScriptName;
    
    /**
        Sets the size of the current active font
    */
    void function(PFCanvasRef canvas, float newSize) PFCanvasSetFontSize;
    
    /**
        Sets the text alignment for the current active font
    */
    void function(PFCanvasRef canvas, PFTextAlign alignment) PFCanvasSetTextAlign;
    
    /**
        Sets the text baseline for the current active font
    */
    void function(PFCanvasRef canvas, PFTextBaseline baseline) PFCanvasSetTextBaseline;
    
    /**
        Sets the fill style for the canvas
    */
    void function(PFCanvasRef canvas, PFFillStyleRef fillStyle) PFCanvasSetFillStyle;
    
    /**
        Sets the stroke style for the canvas
    */
    void function(PFCanvasRef canvas, PFFillStyleRef strokeStyle) PFCanvasSetStrokeStyle;
    
    /**
        Fills the current active path

        This function automatically destroys the path. If you wish to use the path again, clone it
        first.
    */
    void function(PFCanvasRef canvas, PFPathRef path) PFCanvasFillPath;
    
    /**
        Strokes the current active path

        This function automatically destroys the path. If you wish to use the path again, clone it
        first.
    */
    void function(PFCanvasRef canvas, PFPathRef path) PFCanvasStrokePath;
    
    /**
        Creates a new path for rendering
    */
    PFPathRef function() PFPathCreate;
    
    /**
        Destroys the specified path
    */
    void function(PFPathRef path) PFPathDestroy;
    
    /**
        Clones the specified path
    */
    PFPathRef function(PFPathRef path) PFPathClone;

    /**
        Moves the path cursor to the specified coordinates
    */
    void function(PFPathRef path, const(PFVector2F)* to) PFPathMoveTo;

    /**
        Draws a line from the current coordinates to the specified coordinates

        The path cursor will be moved to the destination coordinates.
    */
    void function(PFPathRef path, const(PFVector2F)* to) PFPathLineTo;

    /**
        Draws a quadratic curve from the current coordinates to the specified coordinates

        The path cursor will be moved to the destination coordinates.
    */
    void function(PFPathRef path, const(PFVector2F)* ctrl, const(PFVector2F)* to) PFPathQuadraticCurveTo;
    

    /**
        Draws a bezier curve from the current coordinates to the specified coordinates

        The path cursor will be moved to the destination coordinates.
    */
    void function(PFPathRef path, const(PFVector2F)* ctrl0, const(PFVector2F)* ctrl1, const(PFVector2F)* to) PFPathBezierCurveTo;
    

    /**
        Draws an arc
    */
    void function(PFPathRef path, const(PFVector2F)* center, float radius, float startAngle, float endAngle, PFArcDirection direction) PFPathArc;

    /**
        Draws an arc from the current coordinates to the specified coordinates

        The path cursor will be moved to the destination coordinates.
    */
    void function(PFPathRef path, const(PFVector2F)* ctrl, const(PFVector2F)* to, float radius) PFPathArcTo;

    
    /**
        Draws a rectangle
    */
    void function(PFPathRef path, const(PFRectF)* rect) PFPathRect;
    
    /**
        Draws an ellipse
    */
    void function(PFPathRef path, const(PFVector2F)* center, const(PFVector2F)* axes, float rotation, float startAngle, float endAngle) PFPathEllipse;
    
    /**
        Closes the path.
    */
    void function(PFPathRef path) PFPathClosePath;

    /**
        Creates a fill style with the specified color
    */
    PFFillStyleRef function(const(PFColorU)* color) PFFillStyleCreateColor;

    /**
        Destroys the fill style
    */
    void function(PFFillStyleRef fillStyle) PFFillStyleDestroy;

    /**
        Creates an embedded resource loader
    */
    PFResourceLoaderRef function() PFEmbeddedResourceLoaderCreate;

    /**
        Locates the file system resource loader.
    */
    PFResourceLoaderRef function() PFFilesystemResourceLoaderLocate;

    /**
        Creates an embedded resource loader from a file path.

        Note: This function takes C null terminated strings.
    */
    PFResourceLoaderRef function(const(char)* path) PFFilesystemResourceLoaderFromPath;

    /**
        Locates the file system resource loader.
    */
    void function(PFResourceLoaderRef loader) PFResourceLoaderDestroy;

    /**
        Loads OpenGL context with the specified callback
    */
    void function(PFGLFunctionLoader callback, void* userdata) PFGLLoadWith;

    /**
        Creates a GLDevice with the specified GL version and framebuffer binding.
    */
    PFGLDeviceRef function(PFGLVersion version_, uint defaultFramebuffer) PFGLDeviceCreate;

    /**
        Creates a GLDevice with the specified GL version and framebuffer binding.
    */
    void function(PFGLDeviceRef device) PFGLDeviceDestroy;

    /**
        Creates a framebuffer with the specified window size.
    */
    PFGLDestFramebufferRef function(const(PFVector2I)* windowSize) PFGLDestFramebufferCreateFullWindow;

    /**
        Creates a framebuffer with the specified window size.
    */
    void function(PFGLDestFramebufferRef fb) PFGLDestFramebufferDestroy;

    /**
        Creates a new renderer

        This function takes ownership of and automatically takes responsibility for destroying `device`
        and `dest_framebuffer`. However, it does not take ownership of `resources`; therefore, if you
        created the resource loader, you must destroy it yourself to avoid a memory leak.
    */
    PFGLRendererRef function(PFGLDeviceRef device, PFResourceLoaderRef res, const(PFRendererMode)* mode, const(PFRendererOptions)* options) PFGLRendererCreate;

    /**
        Destroys the renderer
    */
    PFGLDeviceRef function(PFGLRendererRef renderer) PFGLRendererGetDevice;

    /**
        Gets the device associated with the renderer

        This reference remains valid as long as the device is alive.
    */
    void function(PFGLRendererRef renderer) PFGLRendererDestroy;
    
    /**
        Builds and renders a GL scene proxy.

        This function does not take ownership of `renderer` or `build_options`. Therefore, if you
        created the renderer and/or options, you must destroy them yourself to avoid a leak.
    */
    void function(PFSceneProxyRef sceneProxy, PFGLRendererRef renderer, PFBuildOptionsRef buildOptions) PFSceneProxyBuildAndRenderGL;

    // These functions only exist on macOS
    version(OSX) {

        /**
            Creates a metal destination framebuffer
        */
        PFMetalDestFramebufferRef function(const(PFVector2I)* windowSize) PFMetalDestFramebufferCreateFullWindow;

        /**
            Destroys the metal destination framebuffer
        */
        void function(PFMetalDestFramebufferRef fb) PFMetalDestFramebufferDestroy;

        /**
            Creates a new renderer

            This function takes ownership of and automatically takes responsibility for destroying `device`
            and `dest_framebuffer`. However, it does not take ownership of `resources`; therefore, if you
            created the resource loader, you must destroy it yourself to avoid a memory leak.
        */
        PFMetalRendererRef function(PFMetalDeviceRef device, PFResourceLoaderRef res, const(PFRendererMode)* mode, const(PFRendererOptions)* options) PFMetalRendererCreate;

        /**
            Destroys the renderer
        */
        void function(PFMetalRendererRef renderer) PFMetalRendererDestroy;
        
        /**
            Returns a reference to the Metal device in the renderer.

            This reference remains valid as long as the device is alive.
        */
        PFMetalDeviceRef function(PFGLRendererRef renderer) PFMetalRendererGetDevice;

        /**
            Builds and renders a metal scene proxy.

            This function does not take ownership of `renderer` or `build_options`. Therefore, if you
            created the renderer and/or options, you must destroy them yourself to avoid a leak.
        */
        void function(PFSceneProxyRef sceneProxy, PFMetalRendererRef renderer, PFBuildOptionsRef buildOptions) PFSceneProxyBuildAndRenderMetal;

        /**
            Creates a new device with the specified IO surface and native metal device
        */
        PFMetalDeviceRef function(void* metalDevice, void* ioSurface) PFMetalDeviceCreateWithIOSurface;

        /**
            Creates a new device with the specified drawable and native metal device
        */
        PFMetalDeviceRef function(void* metalDevice, void* caDrawable) PFMetalDeviceCreateWithDrawable;

        /**
            Swaps the IO surface texture
        */
        void function(PFMetalDeviceRef device, void* newIOSurface) PFMetalDeviceSwapIOSurface;

        /**
            Swaps the CA drawable texture
        */
        void function(PFMetalDeviceRef device, void* newCADrawable) PFMetalDeviceSwapDrawable;

        /**
            Presents the CA drawable texture
        */
        void function(PFMetalDeviceRef device, void* caDrawable) PFMetalDevicePresentDrawable;

        /**
            Destroys the Metal device
        */
        void function(PFMetalDeviceRef device) PFMetalDeviceDestroy;
    }

    /**
        Creates a 2D render transform
    */
    PFRenderTransformRef function(const(PFTransform2F)* transform) PFRenderTransformCreate2D;

    /**
        Creates a perspective render transform
    */
    PFRenderTransformRef function(const(PFPerspective)* transform) PFRenderTransformCreatePerspective;

    /**
        Destroys the transform
    */
    void function(PFRenderTransformRef transform) PFRenderTransformDestroy;

    /**
        Creates a new build options instance
    */
    PFBuildOptionsRef function() PFBuildOptionsCreate;

    /**
        Destroys the build options instance
    */
    void function(PFBuildOptionsRef options) PFBuildOptionsDestroy;

    /**
        Sets the transform for the build options
    */
    void function(PFBuildOptionsRef options, PFRenderTransformRef transform) PFBuildOptionsSetTransform;

    /**
        Sets the dilation for the build options
    */
    void function(PFBuildOptionsRef options, const(PFVector2F)* dilation) PFBuildOptionsSetDilation;

    /**
        Sets whether subpixel anti-aliasing is enabled for the build options
    */
    void function(PFBuildOptionsRef options, bool enabled) PFBuildOptionsSetSubpixelAAEnabled;

    /**
        Creates a new scene proxy from a scene and a renderer level
    */
    PFSceneProxyRef function(PFSceneRef scene, PFRendererLevel level) PFSceneProxyCreateFromSceneAndRayonExecutor;

    /**
        Destroys the scene proxy
    */
    void function(PFSceneProxyRef proxy) PFSceneProxyDestroy;
}
