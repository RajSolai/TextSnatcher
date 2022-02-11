class SelectPictureDialog : Hdy.Window {
    public SelectPictureDialog () {
        var dialog_handle = new Hdy.WindowHandle();
        var pic_dialog_title = new Gtk.Label("Where can I find Screenshot ?");
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