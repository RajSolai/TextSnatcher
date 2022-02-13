class SelectPictureDialog : Hdy.Window {
    public SelectPictureDialog (Gtk.Label title_label) {
        var tesseract_trigger = new TesseractTrigger();
        var dialog_handle = new Hdy.WindowHandle();
        var pic_dialog_title = new Gtk.Label("Where can I find the Image ?");
        var main_box = new Gtk.Box(Gtk.Orientation.VERTICAL,10);
        var cancel_btn = new Gtk.Button.with_label("Cancel");
        var take_screenshot_btn = new Gtk.Button.with_label("Take Screenshot");
        var choose_file_btn = new Gtk.Button.with_label("Choose File");
        var from_clipb_btn = new Gtk.Button.with_label("Get from Clipboard");

        default_height = 200;
        default_width = 200;
        set_position(Gtk.WindowPosition.MOUSE);

        main_box.get_style_context().add_class("select-pic-box");
        pic_dialog_title.get_style_context().add_class("dialog-title");

        choose_file_btn.clicked.connect (()=>{
             tesseract_trigger.start_tess_process.begin (title_label, "file", (obj, res) => {
                  print ("Process Done") ;
            }) ;
        });

        take_screenshot_btn.clicked.connect(()=>{
            tesseract_trigger.start_tess_process.begin (title_label, "shot", (obj, res) => {
                  print ("Process Done") ;
            }) ;
        });

        cancel_btn.clicked.connect(()=>{
            close();
        });

        main_box.add(pic_dialog_title);
        main_box.add(take_screenshot_btn);
        main_box.add(choose_file_btn);
        main_box.add(from_clipb_btn);
        main_box.add(cancel_btn);
        dialog_handle.add (main_box);
        add (dialog_handle);
        show_all();
    }

    construct {
        Hdy.init();
    }
}
