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

    public async void takeScreenShot (Gtk.Label label) {
        label.label = "Drag over the Text" ;
        try {
            string path = yield screenshot.captureScreen () ;
            yield readImage(label, path) ;

        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    async void readImage (Gtk.Label label, string file_path) {
        var lang_service = new LanguageService () ;
        string lang = lang_service.getPrefLanguage () ;
        label.label = "Reading Image" ;
        Idle.add (readImage.callback) ;
        yield ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if ( stat == 0 ) {
                copyToClipBoard (label) ;
            } else {
                print ("Error is " + err + " status is " + stat.to_string ()) ;
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    void copyToClipBoard (Gtk.Label label) {
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

    public async bool startProcess (Gtk.Label label_widget) {
        yield takeScreenShot (label_widget) ;

        return true ;

    }

}
