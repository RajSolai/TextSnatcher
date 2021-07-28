class TesseractTrigger {
    string imagePath = GLib.Environment.get_home_dir () + "/Pictures/temp.png" ;
    string outPath = GLib.Environment.get_home_dir () + "/Documents/textsnatcher" ;
    Gtk.Clipboard clipboard; 
    string res;
    string err;
    int stat;
    Gdk.Display display = Gdk.Display.get_default ();

    public async void takeScreenShot(Gtk.Label label) {
	label.label = "Drag over the Text";	
	Idle.add( takeScreenShot.callback);
	yield;
        try {
            Process.spawn_command_line_sync ("scrot -s " + imagePath,out res,out err,out stat) ;
	    print(res);
	    print(err);
	    print(stat.to_string());
	    if (stat == 0) readImage(label);
        } catch ( Error e ){
            critical (e.message) ;
        }
    }

    async void readImage(Gtk.Label label) {
	label.label = "Reading Image";
	Idle.add(readImage.callback);
	yield;
        try {
            Process.spawn_command_line_sync ("tesseract "+imagePath+" "+outPath+" -l eng ",out res,out err,out stat) ;
	    if (stat ==0) copyToClipBoard(label);
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    void copyToClipBoard(Gtk.Label label) {
        try {
            clipboard = Gtk.Clipboard.get_default(display);
            string textOutput;
            FileUtils.get_contents (outPath+".txt", out textOutput);
            clipboard.set_text(textOutput,textOutput.length);
            //print(textOutput.length);
	    label.label = "Checkout Clipboard :)";
        } catch ( Error e ){
            print (e.message) ;
        }
    }

    public void startProcess(Gtk.Label labelWidget) {
        takeScreenShot (labelWidget) ;
        //readImage(labelWidget);
        //copyToClipBoard();
        //labelWidget.label = "Checkout ClipBoard :)" ;
    }

}
