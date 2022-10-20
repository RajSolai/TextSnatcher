public class MainWindow : Gtk.ApplicationWindow {
    construct {
        set_default_size (300, 150);

        var main_screen = new MainScreen ();
        var window_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        var headerbar = new CustomHeaderBar ();

        //window_box.append (headerbar);
        window_box.append (main_screen);

        //add_css_class ("rounded"); // Doesn't work

        set_titlebar (headerbar);
        //set_content (window_box);
        set_child (window_box);
    }
}
