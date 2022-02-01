public class ScreenShot : Object {
    private ScreenshotProxy proxy ;
    private FilePathService file_path_service ;
    private Xdp.Portal portal ;

    construct {
        try {
            proxy = Bus.get_proxy_sync<ScreenshotProxy> (BusType.SESSION,
                                                        "org.gnome.Shell.Screenshot",
                                                        "/org/gnome/Shell/Screenshot") ;
            portal = new Xdp.Portal () ;
        } catch ( Error e ) {
            error (e.message) ;
        }
    }

    public async string capture_screen () throws Error {
        Gdk.Rectangle ? rect = {} ;
        bool success = false ;
        string filename_used = "" ;
        yield proxy.select_area (out rect.x, out rect.y, out rect.width, out rect.height) ;

        yield proxy.screenshot_area (
            rect.x,
            rect.y,
            rect.width,
            rect.height,
            true,
            "com.github.rajsolai.textsnatcher.png",
            out success,
            out filename_used
        ) ;

        return filename_used ;

    }

}
