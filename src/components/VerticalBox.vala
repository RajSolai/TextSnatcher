class VerticalBox : Gtk.Box {
    public VerticalBox (int space) {
        Object (
            orientation: Gtk.Orientation.VERTICAL,
            spacing: space
        );
    }
}
