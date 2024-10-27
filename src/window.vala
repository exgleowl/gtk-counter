[GtkTemplate (ui = "/io/github/exgleowl/Counter/window.ui")]
public class Counter.Window : Adw.ApplicationWindow {
    [GtkChild]
    private unowned Gtk.Label count_label;
    
    [GtkChild]
    private unowned Gtk.Button minus_button;
    
    [GtkChild]
    private unowned Gtk.Button reset_button;
    
    [GtkChild]
    private unowned Gtk.Button plus_button;

    public Window (Gtk.Application app) {
        Object (application: app);
    }
    
    construct {
        var minus_action = new SimpleAction ("minus", null);
        minus_action.activate.connect (this.minus_count);
        this.add_action (minus_action);
        
        var reset_action = new SimpleAction ("reset", null);
        reset_action.activate.connect (this.reset_count);
        this.add_action (reset_action);
        
        var plus_action = new SimpleAction ("plus", null);
        plus_action.activate.connect (this.plus_count);
        this.add_action (plus_action);
    }
    
    private int get_current_count () {
        string current_count = this.count_label.label;
        return int.parse (current_count);
    }
    
    private void minus_count () {
        int current_count = this.get_current_count ();
        this.count_label.label = @"$(current_count - 1)";
    }
    
    private void reset_count () {
        this.count_label.label = @"$(0)";
    }
    
    private void plus_count () {
        int current_count = this.get_current_count ();
        this.count_label.label = @"$(current_count + 1)";
    }
}

