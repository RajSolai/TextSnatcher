class LanguageService {
    static string preferred_language = "eng";

    public void save_pref_language (string language) {
        preferred_language = language;
    }

    public string get_pref_language () {
        return preferred_language;
    }
}
