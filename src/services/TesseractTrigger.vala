class TesseractTrigger : Object {
    private Gdk.Display display = Gdk.Display.get_default ();
    private Gdk.Clipboard clipboard;
    private Gtk.Label status_label;
    private Xdp.Portal portal;

    string out_path = Environment.get_home_dir () + "/.textsnatcher";
    string scrot_path = Environment.get_tmp_dir () + "/textshot.png";
    string res;
    string err;
    int stat;

    construct {
        portal = new Xdp.Portal ();
        clipboard = display.get_clipboard ();
    }

    public void accept_files_fromchooser () {
        portal.open_file.begin (
            null,
            "Select an image to perform OCR",
            null,
            null,
            null,
            Xdp.OpenFileFlags.NONE,
            null,
            filechooser_callback
        ) ;
    }

    async void save_shot_scrot () {
        try {
            Process.spawn_command_line_sync ("scrot -s -o " + scrot_path) ;
            yield read_image (scrot_path) ;
        } catch (Error e) {
            print ("%s\n", e.message);
        }
    }

    void filechooser_callback (Object? obj, AsyncResult res) {
        Variant info;
        try {
            info = portal.open_file.end (res) ;
            Variant uris = info.lookup_value ("uris", VariantType.STRING_ARRAY) ;
            string[] files = uris as string[] ;
            string lead_file = "\'" + files[0].substring (7).replace ("%20", " ") + "\'" ;
            read_image.begin (lead_file, (obj, res) => {
                print ("Reading file from chooser\n");
            }) ;
        } catch (Error e) {
            critical (e.message) ;
        }
    }

    async void read_image (string file_path) {
        var lang_service = new LanguageService () ;
        string lang = lang_service.get_pref_language () ;
        status_label.label = "Reading Image";
        Idle.add (read_image.callback) ;
        yield ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if (stat == 0) {
                copy_to_clipboard () ;
            } else {
                print ("Error is: %s, status is: %s\n", err, stat.to_string ());
                status_label.label = "Error Reading Image";
            }
        } catch (Error e) {
            critical (e.message) ;
            if (e.code == 8) {
                status_label.label = "Dependencies Not Found";
            }
        }
    }

    void read_image_and_return (string file_path) {
        string text_output = "";
        var lang_service = new LanguageService () ;
        string lang = lang_service.get_pref_language () ;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang" ;
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat) ;
            if (stat == 0) {
                FileUtils.get_contents (out_path + ".txt", out text_output) ;
                //  clipboard.set_text (text_output);
                stdout.printf ("OUTPUT : %s",text_output);
            } else {
                stdout.printf ("Error is: %s, status is: %s\n", err, stat.to_string ());
            }
        } catch (Error e) {
            critical (e.message) ;
        }
    }

    void copy_to_clipboard () {
        try {
            string text_output ;
            FileUtils.get_contents (out_path + ".txt", out text_output) ;
            //  OpenAI
            if (text_output.length > 0) {
                clipboard.set_text (text_output);
                status_label.label = "Checkout Clipboard :)";
            } else {
                status_label.label = "Error Reading Image";
            }
        } catch (Error e) {
            print ("%s\n", e.message);
        }
    }

    public async void get_screenshot (Gtk.Label label_widget, string type) {
        string session = Environment.get_variable ("XDG_SESSION_TYPE");
        if (type == "file") {
            accept_files_fromchooser () ;
        } else if (type == "clip") {
            /*if (clipboard.wait_is_image_available ()) {
                clipboard.request_image (clipboard_callback); // FIXME: Check if there is a implementation for this in GTK4
            } else {*/
                print ("No image found in clipboard\n");
                status_label.label = "No Image found in Clipboard";
            //}
        } else {
            if (session == "x11") {
                yield save_shot_scrot () ;
            } else {
                portal.take_screenshot.begin (
                    null,
                    Xdp.ScreenshotFlags.INTERACTIVE,
                    null,
                    save_shot
                ) ;
            }
        }
    }

    public async void take_plain_screenshot () {
        //  string session = Environment.get_variable ("XDG_SESSION_TYPE");
        try{
            Process.spawn_command_line_sync ("scrot -s -o " + scrot_path) ;
            read_image_and_return (scrot_path) ;
        }catch (Error e) {
            critical (e.message);
        }

        //  if (session == "x11") {
        //  } else {
        //      portal.take_screenshot.begin (
        //          null,
        //          Xdp.ScreenshotFlags.INTERACTIVE,
        //          null,
        //          save_shot
        //      ) ;
        //  }
    }

    void clipboard_callback (Gdk.Clipboard _, Gdk.Pixbuf pixbuf) {
        try {

            File file = File.new_for_path (Path.build_filename (scrot_path)) ;
            if (file.query_exists (null)) {
                file.delete (null) ;
            }
            DataOutputStream fos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION)) ;
            pixbuf.save_to_stream_async.begin (fos, "png", null, () => {
                read_image.begin (scrot_path, (obj, res) => {
                    print ("Reading File\n");
                }) ;
            }) ;
        } catch (Error err) {
            critical (err.message) ;
        }
    }

    public void save_shot (Object? obj, AsyncResult res) {
        string uri ;
        try {
            uri = portal.take_screenshot.end (res) ;
            string path = Filename.from_uri (uri, null);
            read_image.begin (path, (obj, res) => {
                print ("Taking Screenshot\n");
            }) ;
        } catch (Error e) {
            critical (e.message) ;
        }
    }

    public async bool start_tess_process (Gtk.Label label_widget, string type) {
        status_label = label_widget;
        yield get_screenshot (label_widget, type) ;

        return true ;
    }
}
