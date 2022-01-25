public class MainWindow : Hdy.ApplicationWindow {
    public MainWindow (Gtk.Application app) {
        var window_handle = new Hdy.WindowHandle () ;
        var window_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0) ;
        var main_screen = new MainScreen () ;
        var header_bar = new CustomHeaderBar () ;
        default_height = 150 ;
        default_width = 300 ;
        get_style_context ().add_class ("rounded") ;
        get_style_context ().add_class ("main-window") ;
        window_box.add (header_bar) ;
        window_box.add (main_screen) ;
        window_handle.add (window_box) ;
        add (window_handle) ;
        show_all () ;
    }

    construct {
        Hdy.init () ;
    }

}
