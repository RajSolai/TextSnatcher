class LanguageService {
    static string preferredLanguage = "eng" ;

    public void savePrefLanguage(string language) {
        preferredLanguage = language ;
    }

    public string getPrefLanguage() {
        return preferredLanguage ;
    }

}