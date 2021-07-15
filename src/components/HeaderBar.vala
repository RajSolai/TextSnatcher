public class CustomHeaderBar : Gtk.HeaderBar {

    public CustomHeaderBar () {
        get_style_context ().add_class ("default-decoration") ;
        get_style_context ().add_class ("flat") ;
        get_style_context ().add_class ("header") ;
        title = "Text Snatcher" ;
        set_show_close_button (true) ;
    }

}