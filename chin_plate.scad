include <dimensions.scad>;
use <m3_captive_nut_slot.scad>;

module chin_plate() {
    difference() {
        union() {
            cube([floor_width, chin_depth, panel_thickness]);
            translate([-panel_thickness, panel_thickness, 0])
                cube([panel_thickness, tab_width, panel_thickness]);
            translate([floor_width, panel_thickness, 0])
                cube([panel_thickness, tab_width, panel_thickness]);
        }
        translate([(floor_width/2)-(m3_bolt_slot_dia/2),0,0]) m3_captive_nut_slot();
    }
}

chin_plate();
