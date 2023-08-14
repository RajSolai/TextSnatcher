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

public class Application : Gtk.Application {
    public MainWindow main_window;

    public static bool IS_ON_PANTHEON {
        get {
            return Environment.get_variable ("XDG_CURRENT_DESKTOP") == "Pantheon";
        }
    }

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
        var tesseract_trigger = new TesseractTrigger ();
        bool takeScreenshot = processArguments (args);
        var app = new Application ();
        if (!takeScreenshot) {
            // Run the UI
            return app.run ();
        }
        // Run the screenshot
        tesseract_trigger.take_plain_screenshot ();
        return 0;
    }

    private static bool processArguments (string[] args) {
        bool takeScreenshot = false;
        foreach (string arg in args) {
            if (arg == "--screenshot") {
                takeScreenshot = true;
            }
        }
        return takeScreenshot;
    }
}
