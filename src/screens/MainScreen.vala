public class MainScreen : Gtk.EventBox {
    public Gtk.Label titleLabel ;
    public MainScreen () {
        var trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var vbox = new VerticalBox (4) ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        titleLabel = new Gtk.Label ("Text Snatcher") ;
        titleLabel.get_style_context ().add_class ("h2") ;
        var useImageButton = new Gtk.Button.with_label ("Snatch Now !") ;
        useImageButton.clicked.connect (() => {
            titleLabel.label = "Drag anywhere !" ;
            trigger.startProcess.begin (titleLabel, (obj, res) => {
                print ("Process Done") ;
            }) ;
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        vbox.pack_start (titleLabel, true, true, 5) ;
        vbox.pack_start (useImageButton, true, true, 5) ;
        main_box.add (vbox) ;
        main_box.show_all () ;
        add (main_box) ;
    }

}