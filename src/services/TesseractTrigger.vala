class TesseractTrigger : Object {
    string out_path = GLib.Environment.get_home_dir () + "/.textsnatcher" ;
    Gtk.Clipboard clipboard ;
    string res ;
    string err ;
    int stat ;
    Gdk.Display display = Gdk.Display.get_default () ;
    ScreenShot screenshot ;

    construct {
        screenshot = new ScreenShot () ;
    }

    public async void take_screenshot (Gtk.Label label) {
        label.label = "Drag over the Text" ;
        try {
            string path = yield screenshot.capture_screen () ;
            yield read_image (label, path) ;

        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    async void read_image (Gtk.Label label, string file_path) {
        var lang_service = new LanguageService () ;
        string lang = lang_service.get_pref_language () ;
        label.label = "Reading Image" ;
        Idle.add (read_image.callback) ;
        yield ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if ( stat == 0 ) {
                copy_to_clipBoard (label) ;
            } else {
                print ("Error is " + err + " status is " + stat.to_string ()) ;
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    void copy_to_clipBoard (Gtk.Label label) {
        try {
            clipboard = Gtk.Clipboard.get_default (display) ;
            string text_output ;
            FileUtils.get_contents (out_path + ".txt", out text_output) ;
            if ( text_output.length > 0 ) {
                clipboard.set_text (text_output, text_output.length) ;
                label.label = "Checkout Clipboard :)" ;
            } else {
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            print (e.message) ;
        }
    }

    public async bool start_tess_process (Gtk.Label label_widget) {
        yield take_screenshot (label_widget) ;

        return true ;

    }

}
