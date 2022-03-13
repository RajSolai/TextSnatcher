class SelectPictureScreen : Gtk.EventBox {
    TesseractTrigger tesseract_trigger ;
    public SelectPictureScreen () {
        tesseract_trigger = new TesseractTrigger () ;
        var pic_dialog_title = new Gtk.Label ("Where can I find the Image ?") ;
        var main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10) ;
        var cancel_btn = new Gtk.Button.with_label ("Cancel") ;
        var take_screenshot_btn = new Gtk.Button.with_label ("Take Screenshot") ;
        var choose_file_btn = new Gtk.Button.with_label ("Choose File") ;
        var from_clipb_btn = new Gtk.Button.with_label ("Get from Clipboard") ;


        main_box.get_style_context ().add_class ("select-pic-box") ;
        pic_dialog_title.get_style_context ().add_class ("dialog-title") ;


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

        main_box.add (pic_dialog_title) ;
        main_box.add (take_screenshot_btn) ;
        main_box.add (choose_file_btn) ;
        main_box.add (from_clipb_btn) ;
        main_box.add (cancel_btn) ;
        add (main_box) ;
    }

    public signal void cancel_signal () ;
    public signal void perform_signal (string image_source) ;
}
