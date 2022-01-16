class TesseractTrigger : Object {
    string outPath = GLib.Environment.get_home_dir() + "/.textsnatcher";
    Gtk.Clipboard clipboard ;
    string res ;
    string err ;
    int stat ;
    Gdk.Display display = Gdk.Display.get_default () ;
    ScreenShot screenshot;

    construct {
        screenshot = new ScreenShot();
    }

    public async void takeScreenShot(Gtk.Label label) {
        label.label = "Drag over the Text" ;
        try {
            string path = yield screenshot.captureScreen();
            yield readImage (label,path) ;
        } catch ( Error e ){
            critical (e.message) ;
        }
    }

    async void readImage(Gtk.Label label,string filePath) {
        label.label = "Reading Image" ;
        Idle.add (readImage.callback) ;
        yield ;
        try {
            Process.spawn_command_line_sync ("tesseract " + filePath + " " + outPath + " -l eng ", out res, out err, out stat) ;
            if (stat ==0){
            copyToClipBoard(label);
            }else{
                label.label = "Error Reading Image";
            }
        } catch ( Error e ){
            critical (e.message) ;
        }
    }

    void copyToClipBoard(Gtk.Label label) {
        try {
            clipboard = Gtk.Clipboard.get_default (display) ;
            string textOutput ;
            FileUtils.get_contents (outPath + ".txt", out textOutput) ;
            if (textOutput.length > 0) {
                clipboard.set_text (textOutput, textOutput.length) ;
                label.label = "Checkout Clipboard :)" ;
            }else{
                label.label = "Error Reading Image" ;
            }
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    public async void startProcess(Gtk.Label labelWidget) {
        yield takeScreenShot (labelWidget) ;
    }

}
