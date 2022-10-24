class HomeScreen : Gtk.EventBox {
    public Gtk.Label title_label ;
    public HomeScreen () {
        var is_select_dialog_opened = false ;
        var tesseract_trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var vbox = new VerticalBox (4) ;
        title_label = new Gtk.Label ("TextSnatcher") ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        title_label.get_style_context ().add_class ("h2") ;
        var start_button = new Gtk.Button.with_label ("Snatch Now!") ;
        start_button.get_style_context ().add_class ("start-button") ;

        start_button.clicked.connect (() => {
            string arg = Environment.get_variable ("XDG_SESSION_TYPE") ;
            goto_select_screen () ;
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        vbox.pack_start (title_label, true, true, 5) ;
        vbox.pack_start (start_button, true, true, 5) ;
        main_box.add (vbox) ;
        // main_box.show_all () ;
        add (main_box) ;
    }

    public signal void goto_select_screen () ;
}
