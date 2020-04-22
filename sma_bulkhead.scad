$fn = 64;

include <dimensions.scad>;

module sma_bulkhead_profile() {
    difference() {
        translate([0, 0, -panel_thickness*2]) 
            cylinder(r=sma_bulkhead_radius, h=panel_thickness*4);
        translate([-(sma_bulkhead_flat_radius+1.5), -5, -11]) 
            cube([2, 10, panel_thickness*5]);
    }
}

sma_bulkhead_profile();