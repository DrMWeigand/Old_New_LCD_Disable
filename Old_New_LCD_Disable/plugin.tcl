package require de1_bluetooth 1.1

set plugin_name "old_lcd_disable"

namespace eval ::plugins::${plugin_name} {
    variable author "Marvin Weigand (modified from Brian K)"
    variable contact "Via Diaspora"
    variable version 1.0
    variable name "Old New Scale LCD Behavior"
    variable description "Keeps LCD of scale on after app shutdown"

    proc main {} {
        # Old New scale lcd behavior
        proc ::scale_disable_lcd {} {
            msg "Scale Disable LCD has been overwritten"
            
            ::bt::msg -NOTICE scale_disable_lcd
            if {$::settings(scale_type) == "atomaxskale"} {
                skale_enable_lcd
            } elseif {$::settings(scale_type) == "decentscale"} {
                decentscale_enable_lcd
                after 500 decentscale_enable_lcd
            }
        }
    }
}