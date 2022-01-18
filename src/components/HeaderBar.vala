public class CustomHeaderBar : Gtk.HeaderBar {

    public CustomHeaderBar () {
        var languageButton = new LanguageButton () ;
        var aboutButton = new AboutButton () ;
        get_style_context ().add_class ("default-decoration") ;
        get_style_context ().add_class ("flat") ;
        get_style_context ().add_class ("header") ;
        pack_start (languageButton) ;
        pack_end (aboutButton) ;
        title = "Text Snatcher" ;
        set_show_close_button (true) ;
    }

}