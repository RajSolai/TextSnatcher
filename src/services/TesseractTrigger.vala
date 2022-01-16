class TesseractTrigger : Object {
    //  string imagePath = GLib.Environment.get_home_dir () + "/Pictures/temp.png" ;
    string outPath = GLib.Environment.get_home_dir () + "/Documents/textsnatcher" ;
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
        //  Idle.add (takeScreenShot.callback) ;
        try {
            string path = yield screenshot.captureScreen();
            //  Process.spawn_command_line_sync ("gnome -s " + imagePath, out res, out err, out stat) ;
            print(path);
            // print(err);
            // print(stat.to_string());
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
            print ("RESULT : " + res) ;
            print ("ERROR : " + err) ;
            print ("Tesseract status" + stat.to_string ()) ;
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
            clipboard.set_text (textOutput, textOutput.length) ;
            // print(textOutput.length);
            label.label = "Checkout Clipboard :)" ;
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    public async void startProcess(Gtk.Label labelWidget) {
        yield takeScreenShot (labelWidget) ;
    }

}
