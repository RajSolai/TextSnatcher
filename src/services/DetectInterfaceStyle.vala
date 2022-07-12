public class DetectInterface : Object{
    public string getInterface() {
        string res;
        string err;
        int stat;
        try {
            string mode_cmd = "defaults read -g AppleInterfaceStyle" ;
            Process.spawn_command_line_sync (mode_cmd, out res, out err, out stat) ;
            if (stat == 0) {
                return res;
            }
        } catch (Error e) {
            critical (e.message) ;
        }
        return "";
    }
}