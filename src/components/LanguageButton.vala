public class LanguageButton : Gtk.MenuButton {
    public LanguageButton () {
        Object (
            image: new Gtk.Image.from_icon_name ("dialog-information-symbolic", Gtk.IconSize.SMALL_TOOLBAR)
            ) ;
        var lang = new LanguageService () ;
        var tam = new Gtk.ModelButton () ;
        var eng = new Gtk.ModelButton () ;
        var chi_sim = new Gtk.ModelButton () ;
        var jpn = new Gtk.ModelButton () ;
        var rus = new Gtk.ModelButton () ;
        var tha = new Gtk.ModelButton () ;
        var fra = new Gtk.ModelButton () ;
        var ara = new Gtk.ModelButton () ;

        tam.text = "Tamil" ;
        eng.text = "English" ;
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

        var menu_list = new Gtk.Grid () ;
        menu_list.orientation = Gtk.Orientation.VERTICAL ;
        menu_list.add (eng) ;
        menu_list.add (chi_sim) ;
        menu_list.add (jpn) ;
        menu_list.add (tam) ;
        menu_list.add (fra) ;
        menu_list.add (ara) ;
        menu_list.add (tha) ;
        menu_list.add (rus) ;

        menu_list.show_all () ;
        var popover = new Gtk.Popover (null) ;
        popover.add (menu_list) ;
        this.popover = popover ;
    }

}