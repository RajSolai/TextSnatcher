public class LanguageButton : Gtk.MenuButton {
    public LanguageButton () {
        Object (
            image: new Gtk.Image.from_icon_name ("preferences-desktop-locale", Gtk.IconSize.SMALL_TOOLBAR)
        ) ;
        var menu_list = new Gtk.Box (Gtk.Orientation.VERTICAL, 5) ;
        var scroll_view = new Gtk.ScrolledWindow (null, null) ;
        scroll_view.height_request = 190 ;
        scroll_view.width_request = 150 ;
        var lang = new LanguageService () ;
        var spa = new Gtk.ModelButton () ;
        var eng = new Gtk.ModelButton () ;
        var chi_sim = new Gtk.ModelButton () ;
        var jpn = new Gtk.ModelButton () ;
        var rus = new Gtk.ModelButton () ;
        var fra = new Gtk.ModelButton () ;
        var ara = new Gtk.ModelButton () ;
        var nld = new Gtk.ModelButton () ; // Dutch Language is represented as nld
        var tur = new Gtk.ModelButton () ;
        var deu = new Gtk.ModelButton () ;
        var ind = new Gtk.ModelButton () ;

        deu.text = "German" ;
        nld.text = "Dutch" ;
        tur.text = "Turkish" ;
        eng.text = "English" ;
        spa.text = "Spanish" ;
        chi_sim.text = "Chinese (Simplified)" ;
        jpn.text = "Japanese" ;
        rus.text = "Russian" ;
        fra.text = "French" ;
        ara.text = "Arabic" ;
        ind.text = "Indonesian" ;

        deu.clicked.connect (() => { lang.save_pref_language ("deu") ; }) ;
        eng.clicked.connect (() => { lang.save_pref_language ("eng") ; }) ;
        chi_sim.clicked.connect (() => { lang.save_pref_language ("chi_sim") ; }) ;
        jpn.clicked.connect (() => { lang.save_pref_language ("jpn") ; }) ;
        fra.clicked.connect (() => { lang.save_pref_language ("fra") ; }) ;
        rus.clicked.connect (() => { lang.save_pref_language ("rus") ; }) ;
        ara.clicked.connect (() => { lang.save_pref_language ("ara") ; }) ;
        spa.clicked.connect (() => { lang.save_pref_language ("spa") ; }) ;
        nld.clicked.connect (() => { lang.save_pref_language ("nld") ; }) ;
        tur.clicked.connect (() => { lang.save_pref_language ("tur") ; }) ;
        ind.clicked.connect (() => { lang.save_pref_language ("ind") ; }) ;

        menu_list.add (eng) ;
        menu_list.add (chi_sim) ;
        menu_list.add (jpn) ;
        menu_list.add (nld) ;
        menu_list.add (deu) ;
        menu_list.add (fra) ;
        menu_list.add (ara) ;
        menu_list.add (tur) ;
        menu_list.add (rus) ;
        menu_list.add (ind) ;

        scroll_view.add (menu_list) ;
        scroll_view.show_all () ;
        var popover = new Gtk.Popover (null) ;
        popover.add (scroll_view) ;
        this.popover = popover ;
    }
}
