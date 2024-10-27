public class Counter.Application : Adw.Application {
    public Application () {
        Object (
            application_id: "io.github.exgleowl.Counter",
            flags: ApplicationFlags.DEFAULT_FLAGS
        );
    }

    construct {
        ActionEntry[] action_entries = {
            { "about", this.on_about_action },
            { "preferences", this.on_preferences_action },
            { "quit", this.quit }
        };
        this.add_action_entries (action_entries, this);
        this.set_accels_for_action ("app.quit", {"<primary>q"});
        this.set_accels_for_action ("win.minus", {"<Ctrl>m"});
        this.set_accels_for_action ("win.reset", {"<Ctrl>r"});
        this.set_accels_for_action ("win.plus", {"<Ctrl>p"});
    }

    public override void activate () {
        base.activate ();
        var win = this.active_window ?? new Counter.Window (this);
        win.present ();
    }

    private void on_about_action () {
        string[] developers = { "Pavel Nikolaev <pnikolaev822@gmail.com>" };
        var about = new Adw.AboutDialog () {
            application_name = "counter",
            application_icon = "io.github.exgleowl.Counter",
            developer_name = "Pavel Nikolaev",
            translator_credits = _("translator-credits"),
            version = "0.1.0",
            developers = developers,
            copyright = "© 2024 Pavel Nikolaev",
        };

        about.present (this.active_window);
    }

    private void on_preferences_action () {
        message ("app.preferences action activated");
    }
}
