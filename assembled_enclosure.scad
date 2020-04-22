$fn = 64;

include <dimensions.scad>;
use <side.scad>;
use <front_panel.scad>;
use <floor.scad>;
use <chin_plate.scad>;
use <back_panel.scad>;
use <raspberrypi.scad>;


translate([46-pi_hole_dia, floor_depth-(pi_depth/2)-(pi_hole_radius), panel_thickness+standoff_height])
    rotate([0,0,180]) 
        color("blue") 
            pi3();

enclosure_floor();
translate([0, 0, side_height-roof_height_below_top-(panel_thickness*2)]) 
    enclosure_floor(pi_standoffs=false);

translate([-panel_thickness, 0, side_height-floor_height_above_bottom+panel_thickness]) 
    rotate([0, 90, 0]) 
        color("green") 
            enclosure_side();

translate([floor_width, 0, side_height-floor_height_above_bottom+panel_thickness]) 
    rotate([0, 90, 0]) 
        color("green") 
            enclosure_side(pi_cutouts=false);

translate([-(panel_thickness*2), -29, 15.0]) 
    rotate([bezel_angle, 0, 0]) 
        color("darkgray") 
            front_panel();
            
rotate([bezel_angle-90, 0, 0]) translate([0, -32.5, 9.25]) color("red") chin_plate();

translate([-panel_thickness, floor_depth+panel_thickness, -(floor_height_above_bottom/2)]) 
    rotate([90, 0, 0])
        back_panel();