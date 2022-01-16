class TesseractTrigger : Object {
    string outPath = GLib.Environment.get_home_dir () + "/.textsnatcher" ;
    Gtk.Clipboard clipboard ;
    string res ;
    string err ;
    int stat ;
    Gdk.Display display = Gdk.Display.get_default () ;
    ScreenShot screenshot ;

    construct {
        screenshot = new ScreenShot () ;
    }

    public async void takeScreenShot(Gtk.Label label) {
        label.label = "Drag over the Text" ;
        try {
            string path = yield screenshot.captureScreen() ;
            yield readImage(label, path) ;

        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    async void readImage(Gtk.Label label, string filePath) {
        var langService = new LanguageService () ;
        string lang = langService.getPrefLanguage () ;
        label.label = "Reading Image" ;
        Idle.add (readImage.callback) ;
        yield ;
        try {
            string tessCommand = "tesseract " + filePath + " " + outPath + @" -l $lang" ;
            // print("\n tesscommand is "+tessCommand);
            Process.spawn_command_line_sync (tessCommand, out res, out err, out stat) ;
            if( stat == 0 ){
                copyToClipBoard (label) ;
            } else {
                print ("Error is " + err + " status is " + stat.to_string ()) ;
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ) {
            critical (e.message) ;
        }
    }

    void copyToClipBoard(Gtk.Label label) {
        try {
            clipboard = Gtk.Clipboard.get_default (display) ;
            string textOutput ;
            FileUtils.get_contents (outPath + ".txt", out textOutput) ;
            if( textOutput.length > 0 ){
                clipboard.set_text (textOutput, textOutput.length) ;
                label.label = "Checkout Clipboard :)" ;
            } else {
                label.label = "Error Reading Image" ;
            }
            print ("\n the output is " + textOutput) ;
        } catch ( Error e ) {
            print (e.message) ;
        }
    }

    public async void startProcess(Gtk.Label labelWidget) {
        yield takeScreenShot(labelWidget) ;

    }

}
