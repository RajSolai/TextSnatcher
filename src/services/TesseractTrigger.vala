class TesseractTrigger {
    string imagePath = GLib.Environment.get_home_dir () + "/Pictures/temp.png" ;
    string outPath = GLib.Environment.get_home_dir () + "/Documents/textsnatcher" ;
    Gtk.Clipboard clipboard; 
    Gdk.Display display = Gdk.Display.get_default ();

    void takeScreenShot() {
        try {
            Process.spawn_command_line_sync ("scrot -s " + imagePath) ;
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    void readImage() {
        try {
            Process.spawn_command_line_sync ("tesseract "+imagePath+" "+outPath+" -l eng ") ;
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    void copyToClipBoard() {
        try {
            clipboard = Gtk.Clipboard.get_default(display);
            string textOutput;
            FileUtils.get_contents (outPath+".txt", out textOutput);
            clipboard.set_text(textOutput,textOutput.length);
            //print(textOutput.length);
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    public void startProcess(Gtk.Label labelWidget) {
        takeScreenShot () ;
        readImage();
        copyToClipBoard();
        labelWidget.label = "Checkout ClipBoard :)" ;
    }

}