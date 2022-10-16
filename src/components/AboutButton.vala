class AboutButton : Gtk.Button {
    private TsAboutDialog about_dialog;

    construct {
        icon_name = "dialog-information-symbolic";
        tooltip_text = "About TextSnatcher";

        clicked.connect (() => {
            about_dialog = new TsAboutDialog ();
        });
    }
}
