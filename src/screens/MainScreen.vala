public class MainScreen : Gtk.EventBox {
    public MainScreen () {
        var trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var vbox = new VerticalBox (4) ;
        var title_label = new Gtk.Label ("TextSnatcher") ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        title_label.get_style_context ().add_class ("h2") ;
        var start_button = new Gtk.Button.with_label ("Snatch Now !") ;
        start_button.clicked.connect (() => {
            title_label.label = "Drag anywhere !" ;
            trigger.startProcess.begin (title_label, (obj, res) => {
                print ("Process Done") ;
            }) ;
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        vbox.pack_start (title_label, true, true, 5) ;
        vbox.pack_start (start_button, true, true, 5) ;
        main_box.add (vbox) ;
        main_box.show_all () ;
        add (main_box) ;
    }

}
