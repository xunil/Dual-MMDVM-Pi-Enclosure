$fn = 64;

include <dimensions.scad>;
include <m3_captive_nut_slot.scad>;

module pi_usb_and_ethernet() {
    // Ethernet
    translate([0,11.5-16/2,0]) scale([1.05, 1.05, 1.05]) cube([21,16,13.8]);

    // USB
    translate([0, 29-13/2,0]) scale([1.05, 1.05, 1.05]) cube([17,13,15.5]);
    translate([0, 47-13/2,0]) scale([1.05, 1.05, 1.05]) cube([17,13,15.5]);
}

module enclosure_side(pi_cutouts=true) {
    difference() {
        union() {
            cube([side_height, side_depth, panel_thickness]);
            rotate([0, 0, -(90-bezel_angle)]) {
                difference() {
                    union() {
                        // Angled part for front panel
                        cube([bezel_height, chin_depth, panel_thickness]);
                        // Retention tabs
                        translate([(bezel_height/4)-(tab_width/2), -panel_thickness, 0]) 
                            cube([tab_width, panel_thickness, panel_thickness]);
                        translate([((bezel_height/4)*3)-(tab_width/2), -panel_thickness, 0]) 
                            cube([tab_width, panel_thickness, panel_thickness]);
                    }
                    
                    // Front panel captive nut slot
                    translate([(bezel_height/2)-(m3_bolt_slot_dia/2), 0, 0]) m3_captive_nut_slot();
                    
                    // Tab slot for "chin" panel
                    translate([bezel_height-(panel_thickness*2), panel_thickness, -panel_thickness]) 
                        cube([panel_thickness, tab_width, panel_thickness*3]);
                }
            }
            
            // Rear panel retention tabs
            translate([(side_height/4)-(tab_width/2), side_depth, 0]) 
                cube([tab_width, panel_thickness, panel_thickness]);
            translate([((side_height/4)*3)-(tab_width/2), side_depth, 0]) 
                cube([tab_width, panel_thickness, panel_thickness]);

        }
        
        // Captive nut slot
        translate([(side_height/2)+(m3_bolt_slot_dia/2), side_depth, 0])
            rotate([0, 0, 180])
                m3_captive_nut_slot();
        
        // Floor retention slots
        translate([(side_height-floor_height_above_bottom), (side_depth/4)-(tab_width/2), -panel_thickness])
            cube([panel_thickness, tab_width, panel_thickness*3]);
        translate([(side_height-floor_height_above_bottom), ((side_depth/4)*3)-(tab_width/2), -panel_thickness])
            cube([panel_thickness, tab_width, panel_thickness*3]);

        // Roof retention slots
        translate([(roof_height_below_top), (side_depth/4)-(tab_width/2), -panel_thickness])
            cube([panel_thickness, tab_width, panel_thickness*3]);
        translate([(roof_height_below_top), ((side_depth/4)*3)-(tab_width/2), -panel_thickness])
            cube([panel_thickness, tab_width, panel_thickness*3]);

        if (pi_cutouts) {
            // XXX: Do a better job than magic numbers here
            translate([86, 118.75, panel_thickness*3]) 
                rotate([180, 90, 0]) 
                    pi_usb_and_ethernet();
        }
    }
}

enclosure_side(true);

