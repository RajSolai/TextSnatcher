public class LanguageButton : Gtk.MenuButton {
    public LanguageButton () {
        Object (
            image: new Gtk.Image.from_icon_name ("preferences-desktop-locale", Gtk.IconSize.SMALL_TOOLBAR)
            ) ;
        var menu_grid = new Gtk.Grid () ;
        var menu_list_one = new Gtk.Box (Gtk.Orientation.VERTICAL, 2) ;
        var menu_list_two = new Gtk.Box (Gtk.Orientation.VERTICAL, 2) ;
        menu_grid.orientation = Gtk.Orientation.HORIZONTAL ;
        var lang = new LanguageService () ;
        var tam = new Gtk.ModelButton () ;
        var hin = new Gtk.ModelButton () ;
        var spa = new Gtk.ModelButton () ;
        var eng = new Gtk.ModelButton () ;
        var chi_sim = new Gtk.ModelButton () ;
        var jpn = new Gtk.ModelButton () ;
        var rus = new Gtk.ModelButton () ;
        var tha = new Gtk.ModelButton () ;
        var fra = new Gtk.ModelButton () ;
        var ara = new Gtk.ModelButton () ;

        tam.text = "Tamil" ;
        eng.text = "English" ;
        hin.text = "Hindi" ;
        spa.text = "Spanish" ;
        chi_sim.text = "Chinese (Simplified)" ;
        jpn.text = "Japanese" ;
        rus.text = "Russian" ;
        fra.text = "French" ;
        tha.text = "Thai" ;
        ara.text = "Arabic" ;

        tam.clicked.connect (() => { lang.savePrefLanguage ("tam") ; }) ;
        tha.clicked.connect (() => { lang.savePrefLanguage ("tha") ; }) ;
        eng.clicked.connect (() => { lang.savePrefLanguage ("eng") ; }) ;
        chi_sim.clicked.connect (() => { lang.savePrefLanguage ("chi_sim") ; }) ;
        jpn.clicked.connect (() => { lang.savePrefLanguage ("jpn") ; }) ;
        fra.clicked.connect (() => { lang.savePrefLanguage ("fra") ; }) ;
        rus.clicked.connect (() => { lang.savePrefLanguage ("rus") ; }) ;
        ara.clicked.connect (() => { lang.savePrefLanguage ("ara") ; }) ;
        spa.clicked.connect (() => { lang.savePrefLanguage ("spa") ; }) ;
        hin.clicked.connect (() => { lang.savePrefLanguage ("hin") ; }) ;

        menu_list_one.add (eng) ;
        menu_list_one.add (chi_sim) ;
        menu_list_one.add (jpn) ;
        menu_list_one.add (tam) ;
        menu_list_one.add (spa) ;
        menu_list_two.add (fra) ;
        menu_list_two.add (ara) ;
        menu_list_two.add (tha) ;
        menu_list_two.add (rus) ;
        menu_list_two.add (hin) ;

        menu_grid.add (menu_list_one) ;
        menu_grid.add (menu_list_two) ;
        menu_grid.show_all () ;
        var popover = new Gtk.Popover (null) ;
        popover.add (menu_grid) ;
        this.popover = popover ;
    }

}
