public class MainScreen : Gtk.EventBox {
    SelectPictureDialog select_picture_dialog ;
    public MainScreen () {
        var is_select_dialog_opened = false ;
        var tesseract_trigger = new TesseractTrigger () ;
        var main_box = new Gtk.Grid () ;
        var vbox = new VerticalBox (4) ;
        var title_label = new Gtk.Label ("TextSnatcher") ;
        main_box.column_homogeneous = true ;
        main_box.row_homogeneous = true ;
        main_box.margin = 10 ;
        title_label.get_style_context ().add_class ("h2") ;
        var start_button = new Gtk.Button.with_label ("Snatch Now !") ;
        start_button.get_style_context ().add_class ("start-button") ;
        select_picture_dialog = new SelectPictureDialog (title_label) ;

        select_picture_dialog.cancel_signal.connect (() => {
            is_select_dialog_opened = false ;
            select_picture_dialog.hide () ;
        }) ;

        select_picture_dialog.perform_signal.connect ((image_source) => {
            print ("Using " + image_source) ;
            tesseract_trigger.start_tess_process.begin (title_label, image_source, (obj, res) => {
                select_picture_dialog.hide () ;
                is_select_dialog_opened = false ;
                return ;
            }) ;
        }) ;

        start_button.clicked.connect (() => {
            // title_label.label = "Select Area to Grab !" ;
            // trigger.start_tess_process.begin (title_label, (obj, res) => {
            // print ("Process Done") ;
            // }) ;
            if (!is_select_dialog_opened) {
                select_picture_dialog.show_all () ;
                is_select_dialog_opened = true ;
            }
            string arg = Environment.get_variable ("XDG_SESSION_TYPE") ;
            print (arg) ;
        }) ;
        main_box.orientation = Gtk.Orientation.VERTICAL ;
        vbox.pack_start (title_label, true, true, 5) ;
        vbox.pack_start (start_button, true, true, 5) ;
        main_box.add (vbox) ;
        main_box.show_all () ;
        add (main_box) ;
    }
}
