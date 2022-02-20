public class CustomHeaderBar : Hdy.HeaderBar {

    public CustomHeaderBar () {
        var language_button = new LanguageButton ();
        var about_button = new AboutButton ();
        var distro_name = GLib.Environment.get_os_info ("ID");
        print (distro_name);
        get_style_context ().add_class ("default-decoration");
        get_style_context ().add_class ("flat");
        get_style_context ().add_class ("header");
        pack_start (language_button);
        pack_end (about_button);
        if (distro_name == "elementary") {
            decoration_layout = "close:";
        } else {
            decoration_layout = ":close";
        }
        title = "TextSnatcher";
        set_show_close_button (true);
    }
}
