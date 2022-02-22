class TsAboutDialog : Gtk.AboutDialog {
    construct {
        set_destroy_with_parent (true) ;
        set_modal (true) ;

        artists = null ;
        authors = { "Solai Raj (RajSolai)", "msraj085@gmail.com" } ;
        documenters = null ;
        translator_credits = null ;
        logo_icon_name = "com.github.rajsolai.textsnatcher" ;

        program_name = "TextSnatcher" ;
        comments = "Snatch Text with a Drag" ;
        copyright = null ;
        version = "1.0.1" ;

        license = null ;
        wrap_license = true ;

        website = "https://github.com/RajSolai/TextSnatcher" ;
        website_label = "Star TextSnatcher on Github !" ;

        response.connect ((response_id) => {
            if (response_id == Gtk.ResponseType.CANCEL || response_id == Gtk.ResponseType.DELETE_EVENT) {
                hide () ;
            }
        }) ;

        present () ;
    }
}
