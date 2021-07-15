public class MainScreen : Gtk.EventBox {
    public MainScreen () {
        var trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var cbox = new VerticalBox (4) ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        var titleLabel = new Gtk.Label ("Text Snatcher") ;
        titleLabel.get_style_context ().add_class ("h2") ;
        var useImageButton = new Gtk.Button.with_label ("Snatch Now !") ;
        useImageButton.clicked.connect (() => {
            titleLabel.label = "Drag anywhere !";
            trigger.startProcess(titleLabel);
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        cbox.pack_start (titleLabel, true, true, 5) ;
        cbox.pack_start (useImageButton, true, true, 5) ;
        main_box.add (cbox) ;
        main_box.show_all () ;
        add (main_box) ;
    }

}