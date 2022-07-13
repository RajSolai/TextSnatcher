class TesseractTrigger : Object {
    string out_path = GLib.Environment.get_home_dir () + "/.textsnatcher" ;
    string scrot_path = GLib.Environment.get_tmp_dir () + "/textshot.png" ;
    Gtk.Clipboard clipboard ;
    string res ;
    string err ;
    int stat ;
    Gdk.Display display = Gdk.Display.get_default () ;
    Gtk.Label label ;

    construct {
        clipboard = Gtk.Clipboard.get_default (display) ;
    }

    async void save_shot_mac () {
        try {
            Process.spawn_command_line_sync ("screencapture -i " + scrot_path) ;
            yield read_image (scrot_path) ;
        } catch (Error e) {
            print (e.message) ;
        }
    }

    async void read_image (string file_path) {
        var lang_service = new LanguageService () ;
        string lang = lang_service.get_pref_language () ;
        label.label = "Reading Image" ;
        Idle.add (read_image.callback) ;
        yield ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if (stat == 0) {
                copy_to_clipboard () ;
            } else {
                print ("Error is " + err + " status is " + stat.to_string ()) ;
                label.label = "Error Reading Image" ;
            }
        } catch (Error e) {
            critical (e.message) ;
            if (e.code == 8) {
                label.label = "Dependencies Not Found" ;
            }
        }
    }

    void copy_to_clipboard () {
        try {
            string text_output ;
            FileUtils.get_contents (out_path + ".txt", out text_output) ;
            if (text_output.length > 0) {
                clipboard.set_text (text_output, text_output.length) ;
                label.label = "Checkout Clipboard :)" ;
            } else {
                label.label = "Error Reading Image" ;
            }
        } catch (Error e) {
            print (e.message) ;
        }
    }

    void clipboard_callback (Gtk.Clipboard _, Gdk.Pixbuf pixbuf) {
        try {

            File file = File.new_for_path (Path.build_filename (scrot_path)) ;
            if (file.query_exists (null)) {
                file.delete (null) ;
            }
            DataOutputStream fos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION)) ;
            pixbuf.save_to_stream_async.begin (fos, "png", null, () => {
                read_image.begin (scrot_path, (obj, res) => {
                    print ("Reading File") ;
                }) ;
            }) ;
        } catch (Error err) {
            critical (err.message) ;
        }
    }

    public async bool start_tess_process (Gtk.Label label_widget) {
        label = label_widget ;
        yield save_shot_mac () ;

        return true ;
    }
}
