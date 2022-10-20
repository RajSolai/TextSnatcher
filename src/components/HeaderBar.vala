public class CustomHeaderBar : Gtk.Box {
    private LanguageButtonPopover language_button_popover;
    private Gtk.MenuButton language_button;
    private AboutButton about_button;
    private Adw.HeaderBar headerbar;

    construct {
        language_button_popover = new LanguageButtonPopover ();
        language_button = new Gtk.MenuButton () {
            icon_name = "preferences-desktop-locale",
            tooltip_text = "Languages",
            popover = language_button_popover
        };

        about_button = new AboutButton ();

        headerbar = new Adw.HeaderBar () {
            hexpand = true
        };
        headerbar.set_centering_policy (Adw.CenteringPolicy.LOOSE);
        if (!Application.IS_ON_PANTHEON) {
            headerbar.decoration_layout = "close:";
        }

        //headerbar.add_css_class (Granite.STYLE_CLASS_DEFAULT_DECORATION);
        //headerbar.add_css_class (Granite.STYLE_CLASS_FLAT);
        headerbar.add_css_class ("header");

        headerbar.pack_start (language_button);
        headerbar.pack_end (about_button);

        append (headerbar);
    }
}
