$fn = 64;

include <dimensions.scad>;

module av_power_connectors() {
    // micro USB
    translate([10.6-11/2,-1.5,-1]) scale([1.25, 1.25, 1.25]) cube([10,10,5]);

    // HDMI
    translate([32-16/2,-1.5,0]) scale([1.1, 1.1, 1.1]) cube([15,11.5,6.6]);

    color("darkgrey") {
        // Audio
        translate([53.5-7/2,-2,0]) {
            translate([0,2,0]) scale([1.05, 1.05, 1.05]) cube([7,13,5.6]);
            translate([7/2,0,5.6/2]) rotate([-90,0,0]) scale([1.05, 1.05, 1.05]) cylinder(d=5.6,h=2);
        }
    }
}

module back_panel() {
    difference() {
        cube([floor_width+(panel_thickness*2), side_height, panel_thickness]);
        translate([-0.1, (side_height/4)-(tab_width/2), -panel_thickness])
            cube([panel_thickness+0.1, tab_width, panel_thickness*3]);
        translate([-0.1, ((side_height/4)*3)-(tab_width/2), -panel_thickness])
            cube([panel_thickness+0.1, tab_width, panel_thickness*3]);
        translate([panel_thickness*0.75, (side_height/2), -panel_thickness])
            cylinder(r=m3_bolt_slot_dia/2, h=panel_thickness*3);
        
        translate([floor_width+panel_thickness+0.1, (side_height/4)-(tab_width/2), -panel_thickness])
            cube([panel_thickness+0.1, tab_width, panel_thickness*3]);
        translate([floor_width+panel_thickness+0.1, ((side_height/4)*3)-(tab_width/2), -panel_thickness])
            cube([panel_thickness+0.1, tab_width, panel_thickness*3]);
        translate([floor_width+(panel_thickness*1.25), (side_height/2), -panel_thickness])
            cylinder(r=m3_bolt_slot_dia/2, h=panel_thickness*3);

        translate([91, 14.25, -(panel_thickness/2)]) 
            rotate([270, 180, 0]) 
                av_power_connectors();

    }
}

back_panel();
