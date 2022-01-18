class AboutButton : Gtk.Button {
    public AboutButton () {
        var about_dialog = new TsAboutDialog () ;
        Object (
            image: new Gtk.Image.from_icon_name ("dialog-information-symbolic", Gtk.IconSize.SMALL_TOOLBAR)
            ) ;
        clicked.connect (() => {
            about_dialog.present () ;
        }) ;
    }

}