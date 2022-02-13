class TesseractTrigger : Object {
    string out_path = GLib.Environment.get_home_dir () + "/.textsnatcher" ;
    Gtk.Clipboard clipboard ;
    string res ;
    string err ;
    int stat ;
    Gdk.Display display = Gdk.Display.get_default () ;
    Gtk.Label label ;
    Xdp.Portal portal ;

    construct {
        portal = new Xdp.Portal () ;
    }

    async void read_image(string file_path) {
        var lang_service = new LanguageService () ;
        string lang = lang_service.get_pref_language () ;
        label.label = "Reading Image" ;
        Idle.add (read_image.callback) ;
        yield ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + "/out.txt " + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if( stat == 0 ) {
                copy_to_clipboard () ;
            } else {
                print ("Error is " + err + " status is " + stat.to_string ()) ;
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            critical (e.message) ;
            if( e.code == 8 ) {
                label.label = "Dependencies Not Found" ;
            }
        }
    }

    void copy_to_clipboard() {
        try {
            clipboard = Gtk.Clipboard.get_default (display) ;
            string text_output ;
            FileUtils.get_contents (out_path + "/out.txt", out text_output) ;
            if( text_output.length > 0 ) {
                clipboard.set_text (text_output, text_output.length) ;
                label.label = "Checkout Clipboard :)" ;
            } else {
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            print (e.message) ;
        }
    }

    public async void save_shot_scrot () {
        try {
             Process.spawn_command_line_sync ("scrot -s " + out_path + "/shot.png") ;

         } catch ( Error e ){
             print (e.message) ;
         }
    }

    public async void take_screenshot(Gtk.Label label_widget) {
        string session = Environment.get_variable ("XDG_SESSION_TYPE");
        if (session == "x11") {
            save_shot_scrot();
        }else {
            portal.take_screenshot.begin (
            null,
            Xdp.ScreenshotFlags.INTERACTIVE,
            null,
            save_shot
            ) ;
        }
        
    }

    public void save_shot(GLib.Object ? obj, GLib.AsyncResult res) {
        string uri ;
        try {
            uri = portal.take_screenshot.end (res) ;
            string path = GLib.Filename.from_uri (uri, null) ;
            print (path) ;
            read_image.begin (path, (obj, res) => {
                print ("Taking Screenshot");
            }) ;
        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    public async bool start_tess_process(Gtk.Label label_widget) {
        label = label_widget ;
        yield take_screenshot(label_widget) ;

        return true ;
    }

}
