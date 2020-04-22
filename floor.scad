$fn = 64;

include <dimensions.scad>;
use <sma_bulkhead.scad>;

module pi_standoff_holes() {
    for( i = [0:3] ) {
        translate([
            pi_standoff_holes[i][0],
            pi_standoff_holes[i][1],
            -panel_thickness])
            cylinder(h=panel_thickness*4, r=pi_hole_radius);
    }
}


module pi_standoffs() {
    for( i = [0:3] ) {
        translate([
            pi_standoff_holes[i][0],
            pi_standoff_holes[i][1],
            panel_thickness])
            cylinder(h=standoff_height, r=standoff_radius);
    }
}

module enclosure_floor_base() {
    cube([floor_width, floor_depth, panel_thickness], center = false);
    // Retention tabs
    color("red") {
    translate([-panel_thickness, (floor_depth/4)-(tab_width/2), 0]) 
        cube([panel_thickness, tab_width, panel_thickness], center=false);
    translate([-panel_thickness, floor_depth-((floor_depth/4)+(tab_width/2)), 0]) 
        cube([panel_thickness, tab_width, panel_thickness], center=false);
    translate([floor_width, (floor_depth/4)-(tab_width/2), 0]) 
        cube([panel_thickness, tab_width, panel_thickness], center=false);
    translate([floor_width, floor_depth-((floor_depth/4)+(tab_width/2)), 0]) 
        cube([panel_thickness, tab_width, panel_thickness], center=false);
    }
}


module enclosure_floor(pi_standoffs=true) {
    // Floor
    difference() {
        // Basic shape
        union() {
            enclosure_floor_base();
            
            if (pi_standoffs) {
                // Standoffs for the Pi
                // XXX: figure out the actual X,Y translation to place the Pi
                translate([23.5-pi_hole_dia, floor_depth-pi_depth-pi_hole_radius, 0]) pi_standoffs();
            }
        }
        
        if (pi_standoffs) {
            // Screw holes for the Pi on its standoffs
            // XXX: figure out the actual X,Y translation to place the Pi
            translate([23.5-pi_hole_dia, floor_depth-pi_depth-pi_hole_radius, 0]) pi_standoff_holes();
        } else {
            translate([floor_width/4, (floor_depth/5)*4, 0]) sma_bulkhead_profile();
            translate([(floor_width/4)*3, (floor_depth/5)*4, 0]) sma_bulkhead_profile();
        }
    }
}

enclosure_floor();
translate([0, 0, side_height-roof_height_below_top-(panel_thickness*3.25)]) enclosure_floor(pi_standoffs=false);