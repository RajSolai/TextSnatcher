public class LanguageButtonPopover : Gtk.Popover {
    construct {
        var menu_list = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        var scroll_view = new Gtk.ScrolledWindow () {
            width_request = 150,
            height_request = 190
        };

        var lang = new LanguageService ();

        var spa = new Gtk.Button ();
        var eng = new Gtk.Button ();
        var chi_sim = new Gtk.Button ();
        var jpn = new Gtk.Button ();
        var rus = new Gtk.Button ();
        var fra = new Gtk.Button ();
        var ara = new Gtk.Button ();
        var nld = new Gtk.Button (); // Dutch Language is represented as nld
        var tur = new Gtk.Button ();
        var deu = new Gtk.Button ();
        var ind = new Gtk.Button ();

        deu.label = "German";
        nld.label = "Dutch";
        tur.label = "Turkish";
        eng.label = "English";
        spa.label = "Spanish";
        chi_sim.label = "Chinese (Simplified)";
        jpn.label = "Japanese";
        rus.label = "Russian";
        fra.label = "French";
        ara.label = "Arabic";
        ind.label = "Indonesian";

        deu.clicked.connect (() => { lang.save_pref_language ("deu"); });
        eng.clicked.connect (() => { lang.save_pref_language ("eng"); });
        chi_sim.clicked.connect (() => { lang.save_pref_language ("chi_sim"); });
        jpn.clicked.connect (() => { lang.save_pref_language ("jpn"); });
        fra.clicked.connect (() => { lang.save_pref_language ("fra"); });
        rus.clicked.connect (() => { lang.save_pref_language ("rus"); });
        ara.clicked.connect (() => { lang.save_pref_language ("ara"); });
        spa.clicked.connect (() => { lang.save_pref_language ("spa"); });
        nld.clicked.connect (() => { lang.save_pref_language ("nld"); });
        tur.clicked.connect (() => { lang.save_pref_language ("tur"); });
        ind.clicked.connect (() => { lang.save_pref_language ("ind"); });

        menu_list.append (eng);
        menu_list.append (chi_sim);
        menu_list.append (jpn);
        menu_list.append (nld);
        menu_list.append (deu);
        menu_list.append (fra);
        menu_list.append (ara);
        menu_list.append (tur);
        menu_list.append (rus);
        menu_list.append (ind);

        scroll_view.set_child (menu_list);
        set_child (scroll_view);
    }
}
