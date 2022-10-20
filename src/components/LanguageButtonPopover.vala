public class LanguageButtonPopover : Gtk.Popover { 
    private class LanguageOption : Gtk.Button {
        public string lang;
        //private string[] css_class = {"flat"}; // This throws segfaults
    
        public LanguageOption (string lang, string label) {
            Object (
                label: label
            );
            this.lang = lang;
            add_css_class ("flat");
        }
    }

    construct {
        var menu_list = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        var scroll_view = new Gtk.ScrolledWindow () {
            width_request = 170,
            height_request = 190
        };

        var lang = new LanguageService ();

        string[,] lang_names = {{"spa", "Spanish"},
                                {"eng", "English"},
                                {"chi_sim", "Chinese (Simplified)"},
                                {"jpn", "Japanese"},
                                {"rus", "Russian"},
                                {"fra", "French"},
                                {"ara", "Arabic"},
                                {"nld", "Dutch"},
                                {"tur", "Turkish"},
                                {"deu", "German"},
                                {"ind", "Indonesian"}};

        for (int i = 0; i <= lang_names.length[0] - 1; i++) {
            var option = new LanguageOption (lang_names[i,0], lang_names[i,1]);
            //debug ("%s\n", option.lang);
            option.clicked.connect (() => {
                lang.save_pref_language (option.lang);
                popdown ();
            });
            menu_list.append (option);
        }

        scroll_view.set_child (menu_list);
        set_child (scroll_view);
    }
}
