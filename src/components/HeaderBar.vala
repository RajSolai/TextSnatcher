public class CustomHeaderBar : Gtk.HeaderBar {

    public CustomHeaderBar () {
        var language_button = new LanguageButton () ;
        var about_button = new AboutButton () ;
        get_style_context ().add_class ("default-decoration") ;
        get_style_context ().add_class ("flat") ;
        get_style_context ().add_class ("header") ;
        pack_start (language_button) ;
        pack_end (about_button) ;
        title = "Text Snatcher" ;
        set_show_close_button (true) ;
    }

}
