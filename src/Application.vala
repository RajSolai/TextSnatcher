/*
 * Copyright (c) 2021 - Today Solai Raj (github.com/RajSolai)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Solai Raj <msraj085@gmail.com>
 */

public class TextSnatcher.Application : Gtk.Application {
    public MainWindow main_window;

    public Application () {
        Object (
            application_id: "com.github.rajsolai.textsnatcher",
            flags : ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        Gtk.IconTheme.get_for_display (Gdk.Display.get_default ()).add_resource_path ("/com/github/rajsolai/TextSnatcher");

        // stylesheet
        var css_provider = new Gtk.CssProvider ();
        css_provider.load_from_resource ("/com/github/rajsolai/TextSnatcher/style.css");
        Gtk.StyleContext.add_provider_for_display (
            Gdk.Display.get_default (),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );

        Environment.set_application_name (_("TextSnatcher"));

        var granite_settings = Granite.Settings.get_default ();
        var gtk_settings = Gtk.Settings.get_default ();

        if (granite_settings != null) {
            gtk_settings.gtk_application_prefer_dark_theme = (
                granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK
            );

            granite_settings.notify["prefers-color-scheme"].connect (() => {
                gtk_settings.gtk_application_prefer_dark_theme = (
                    granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK
                );
            });
        }

        main_window = new MainWindow () {
            title = _("TextSnatcher")
        };

        add_window (main_window);

        main_window.present ();

    }

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }
}
