public class MainWindow : Gtk.Window {
    public MainWindow (Gtk.Application app) {
        var main_screen = new MainScreen () ;
        var header_bar = new CustomHeaderBar () ;
        default_height = 150 ;
        default_width = 300 ;
        get_style_context ().add_class ("rounded") ;
        get_style_context ().add_class ("main-window") ;
        set_titlebar (header_bar) ;
        add (main_screen) ;
        show_all () ;
    }

}
