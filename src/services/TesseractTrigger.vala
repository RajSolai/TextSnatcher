class TesseractTrigger : Object {
    string out_path = GLib.Environment.get_home_dir () + "/.textsnatcher";
    string scrot_path = GLib.Environment.get_tmp_dir () + "/textshot.png";
    Gtk.Clipboard clipboard;
    string res;
    string err;
    int stat;
    Gdk.Display display = Gdk.Display.get_default ();
    Gtk.Label label;
    Xdp.Portal portal;

    construct {
        portal = new Xdp.Portal ();
        clipboard = Gtk.Clipboard.get_default (display);
    }

    public void accept_files_fromchooser () {
        portal.open_file.begin (
            null,
            "Select an Image to perform OCR !",
            null,
            null,
            null,
            Xdp.OpenFileFlags.NONE,
            null,
            filechooser_callback
        );
    }

    async void save_shot_scrot () {
        try {
            Process.spawn_command_line_sync ("scrot -s " + scrot_path);
            yield read_image (scrot_path);
        } catch (Error e) {
            print (e.message);
        }
    }

    void filechooser_callback (GLib.Object ? obj, GLib.AsyncResult res) {
        GLib.Variant info;
        try {
            info = portal.open_file.end (res);
            Variant uris = info.lookup_value ("uris", VariantType.STRING_ARRAY);
            string[] files = uris as string[];
            string lead_file = files[0];
            read_image.begin (lead_file, (obj, res) => {
                print ("Reading file from chooser");
            });
        } catch (Error e) {
            critical (e.message);
        }
    }

    async void read_image (string file_path) {
        var lang_service = new LanguageService ();
        string lang = lang_service.get_pref_language ();
        label.label = "Reading Image";
        Idle.add (read_image.callback);
        yield;
        try {
            string tess_command = "tesseract " + file_path + " " + out_path + @" -l $lang";
            Process.spawn_command_line_sync (tess_command, out res, out err, out stat);
            if (stat == 0) {
                copy_to_clipboard ();
            } else {
                print ("Error is " + err + " status is " + stat.to_string ());
                label.label = "Error Reading Image";
            }
        } catch (Error e) {
            critical (e.message);
            if (e.code == 8) {
                label.label = "Dependencies Not Found";
            }
        }
    }

    void copy_to_clipboard () {
        try {
            string text_output;
            FileUtils.get_contents (out_path + ".txt", out text_output);
            if (text_output.length > 0) {
                clipboard.set_text (text_output, text_output.length);
                label.label = "Checkout Clipboard :)";
            } else {
                label.label = "Error Reading Image";
            }
        } catch (Error e) {
            print (e.message);
        }
    }

    public async void get_screenshot (Gtk.Label label_widget, string type) {
        string session = GLib.Environment.get_variable ("XDG_SESSION_TYPE");
        if (type == "file") {
            accept_files_fromchooser ();
        } else if (type == "clip") {
            print ("to implement");
            if (clipboard.wait_is_image_available ()) {
                clipboard.request_image (clipboard_callback);
            } else {
                print ("no image found");
            }
        } else {
            if (session == "x11") {
                yield save_shot_scrot ();
            } else {
                portal.take_screenshot.begin (
                    null,
                    Xdp.ScreenshotFlags.INTERACTIVE,
                    null,
                    save_shot
                );
            }
        }
    }

    void clipboard_callback (Gtk.Clipboard _, Gdk.Pixbuf pixbuf) {
        try {

            File file = File.new_for_path (Path.build_filename (scrot_path));
            if (file.query_exists (null)) {
                file.delete (null);
            }
            DataOutputStream fos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
            pixbuf.save_to_stream_async.begin (fos, "png", null, () => {
                read_image.begin (scrot_path, (obj, res) => {
                    print ("Reading shit");
                });
            });
        } catch (Error err) {
            critical (err.message);
        }
    }

    public void save_shot (GLib.Object ? obj, GLib.AsyncResult res) {
        string uri;
        try {
            uri = portal.take_screenshot.end (res);
            string path = GLib.Filename.from_uri (uri, null);
            print (path);
            read_image.begin (path, (obj, res) => {
                print ("Taking Screenshot");
            });
        } catch (Error e) {
            critical (e.message);
        }
    }

    public async bool start_tess_process (Gtk.Label label_widget, string type) {
        label = label_widget;
        yield get_screenshot (label_widget, type);

        return true;
    }
}
