class TsAboutDialog : Object {
    Gtk.AboutDialog about_dialog;

    construct {
        about_dialog = new Gtk.AboutDialog ();

        about_dialog.set_destroy_with_parent (true);
        about_dialog.set_modal (true);

        about_dialog.authors = { "Solai Raj (RajSolai)", "msraj085@gmail.com" };
        about_dialog.logo_icon_name = "com.github.rajsolai.textsnatcher";

        about_dialog.program_name = "TextSnatcher";
        about_dialog.comments = "Snatch Text with a Drag";
        about_dialog.version = "2.0";

        about_dialog.license_type = Gtk.License.GPL_3_0;

        about_dialog.website = "https://github.com/RajSolai/TextSnatcher";
        about_dialog.website_label = "Star TextSnatcher on Github!";

        about_dialog.present ();
    }
}
