public class MainScreen : Gtk.EventBox {
    public MainScreen () {
        var trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var vbox = new VerticalBox (4) ;
        var language_button = new LanguageButton () ;
        var title_label = new Gtk.Label ("Drag anywhere !") ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        title_label.get_style_context ().add_class ("h2") ;
        var start_button = new Gtk.Button.with_label ("Snatch Now !") ;
        start_button.get_style_context ().add_class ("start-button") ;
        start_button.clicked.connect (() => {
            trigger.start_tess_process.begin (title_label, (obj, res) => {
                print ("Process Done") ;
            }) ;
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        vbox.pack_start (title_label, false, true, 60) ;
        vbox.pack_start (start_button, false, true, 5) ;
        vbox.pack_start (language_button, false, true, 5) ;
        main_box.add (vbox) ;
        main_box.show_all () ;
        add (main_box) ;
    }
}
