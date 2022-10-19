public class LanguageService {
    static string preferred_language = "eng";

    public void save_pref_language (string language) {
        //debug ("lang: %s\n", language);
        preferred_language = language;
    }

    public string get_pref_language () {
        return preferred_language;
    }
}
