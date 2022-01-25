[DBus (name = "org.freedesktop.DBus.Introspectable")]
public interface IntrospectableProxy : Object {
    public abstract string introspect () throws Error ;

}

[DBus (name = "org.gnome.Shell.Screenshot")]
public interface ScreenshotProxy : Object {
    public abstract async void conceal_text () throws GLib.Error ;
    public abstract async void screenshot (
        bool include_cursor,
        bool flash,
        string filename,
        out bool success,
        out string filename_used
    ) throws GLib.Error ;
    public abstract async void screenshot_window (
        bool include_frame,
        bool include_cursor,
        bool flash,
        string filename,
        out bool success,
        out string filename_used
    ) throws GLib.Error ;
    public abstract async void screenshot_area (
        int x,
        int y,
        int width,
        int height,
        bool flash,
        string filename,
        out bool success,
        out string filename_used
    ) throws GLib.Error ;
    public abstract async void screenshot_area_with_cursor (
        int x,
        int y,
        int width,
        int height,
        bool include_cursor,
        bool flash,
        string filename,
        out bool success,
        out string filename_used
    ) throws GLib.Error ;
    public abstract async void select_area (
        out int x,
        out int y,
        out int width,
        out int height
    ) throws GLib.Error ;

}
