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
            file_path_service = new FilePathService () ;
        } catch ( Error e ) {
            error (e.message) ;
        }
    }

    public void take_screenshot () throws Error {
         //Xdp.Parent parent = Xdp.parent_new_gtk (get_native () as Gtk.Window);

           portal.take_screenshot.begin (
                null,
                Xdp.ScreenshotFlags.NONE,
                null,
                save_shot
            );
    }

      public void save_shot (GLib.Object? obj, GLib.AsyncResult res) {
            string uri;
            try {
                uri = portal.take_screenshot.end (res);
                string path = GLib.Filename.from_uri (uri, null);
                print (path);
                file_path_service.set_file_path (path);
            }
            catch (Error e) {
                critical (e.message);
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
