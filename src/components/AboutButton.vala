class AboutButton : Gtk.Button {
    TsAboutDialog about_dialog;
    public AboutButton () {
        Object (
            image: new Gtk.Image.from_icon_name ("dialog-information-symbolic", Gtk.IconSize.SMALL_TOOLBAR)
            ) ;
        clicked.connect (() => {
            about_dialog = new TsAboutDialog () ;
        }) ;
    }

}
