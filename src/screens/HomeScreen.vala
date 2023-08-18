class HomeScreen : Gtk.Box {
    public Gtk.Label title_label;

    public HomeScreen () {
        var main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0) {
            homogeneous = true,
            margin_top = 10,
            margin_bottom = 10,
            margin_start = 10,
            margin_end = 10,
            hexpand = true
        };
        var vbox = new VerticalBox (4);
        title_label = new Gtk.Label ("TextSnatcher") {
            margin_top = 5,
            margin_bottom = 5,
            margin_start = 5,
            margin_end = 5,
            valign = Gtk.Align.FILL,
            vexpand = true
        };
        var start_button = new Gtk.Button.with_label ("Snatch Now!") {
            margin_top = 5,
            margin_bottom = 5,
            margin_start = 5,
            margin_end = 5,
            valign = Gtk.Align.FILL,
            vexpand = true
        };

        title_label.add_css_class ("h2");

        start_button.clicked.connect (() => {
            goto_select_screen ();
        });

        vbox.append (title_label);
        vbox.append (start_button);

        main_box.append (vbox);

        append (main_box);
    }

    public signal void goto_select_screen ();
}
