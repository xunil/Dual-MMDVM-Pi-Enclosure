$fn = 64;

include <dimensions.scad>;

module m3_captive_nut_slot() {
    translate([0, -0.1, -panel_thickness]) {
        cube([
            m3_bolt_slot_dia,
            m3_bolt_slot_len,
            panel_thickness * 3
        ]);
    }
    translate([-1, m3_bolt_slot_len / 3, -panel_thickness])
        cube([
            m3_nut_slot_width,
            m3_nut_slot_depth, 
            panel_thickness * 3
        ]);
}


m3_captive_nut_slot();