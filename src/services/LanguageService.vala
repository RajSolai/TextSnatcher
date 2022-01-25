class LanguageService {
    static string preferred_language = "eng" ;

    public void savePrefLanguage (string language) {
        preferred_language = language ;
    }

    public string getPrefLanguage () {
        return preferred_language ;
    }

}
