class SelectPictureScreen : Gtk.Box {
    private TesseractTrigger tesseract_trigger;

    public SelectPictureScreen () {
        tesseract_trigger = new TesseractTrigger ();

        var main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10) {
            hexpand = true
        };

        var pic_dialog_title = new Gtk.Label ("Where can I find the image?");
        var take_screenshot_btn = new Gtk.Button.with_label ("Take Screenshot");
        var choose_file_btn = new Gtk.Button.with_label ("Choose File");
        var from_clipb_btn = new Gtk.Button.with_label ("Get from Clipboard");
        var cancel_btn = new Gtk.Button.with_label ("Cancel");

        main_box.add_css_class ("select-pic-box");
        pic_dialog_title.add_css_class ("dialog-title");


        choose_file_btn.clicked.connect (() => {
            perform_signal ("file") ;
        }) ;

        take_screenshot_btn.clicked.connect (() => {
            perform_signal ("shot") ;
        }) ;

        from_clipb_btn.clicked.connect (() => {
            perform_signal ("clip") ;
        }) ;

        cancel_btn.clicked.connect (() => {
            cancel_signal () ;
        }) ;

        main_box.append (pic_dialog_title);
        main_box.append (take_screenshot_btn);
        main_box.append (choose_file_btn);
        main_box.append (from_clipb_btn);
        main_box.append (cancel_btn);

        append (main_box);
    }

    public signal void cancel_signal () ;
    public signal void perform_signal (string image_source) ;
}
