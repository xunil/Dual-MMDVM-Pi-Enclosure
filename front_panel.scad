$fn = 64;

include <dimensions.scad>;

nextion_overall_width = 100.5;
nextion_overall_height = 54.94;
lcd_aa_width = 73.44;
lcd_aa_height = 48.96;
lcd_aa_x_start = 7.5 + 8.45;
lcd_aa_y_start = (nextion_overall_height - lcd_aa_height) / 2;
nextion_standoff_hole_dia = 3.2;
nextion_standoff_hole_radius = nextion_standoff_hole_dia / 2;
nextion_standoff_holes = [
    [nextion_standoff_hole_dia, nextion_standoff_hole_dia],  // bottom left
    [nextion_overall_width - nextion_standoff_hole_dia, nextion_standoff_hole_dia], // bottom right
    [nextion_standoff_hole_dia, nextion_overall_height - nextion_standoff_hole_dia], // top left
    [nextion_overall_width - nextion_standoff_hole_dia, nextion_overall_height - nextion_standoff_hole_dia]  // top right
];

module nextion_holes() {
    translate([lcd_aa_x_start, lcd_aa_y_start, -panel_thickness]) 
        cube([lcd_aa_width, lcd_aa_height, panel_thickness*4]);
    
    for( i = [0:3] ) {
        translate([
            nextion_standoff_holes[i][0],
            nextion_standoff_holes[i][1],
            -panel_thickness])
            cylinder(r=nextion_standoff_hole_radius, h=panel_thickness*4);
    }
}

module bezel_holes() {
    // screw holes
    translate([panel_thickness+(bezel_screw_hole_dia/1.5), bezel_height/2, -panel_thickness])
        cylinder(r=bezel_screw_hole_dia/2, h=panel_thickness*4);
    translate([bezel_width-panel_thickness-(bezel_screw_hole_dia/1.5), bezel_height/2, -panel_thickness])
        cylinder(r=bezel_screw_hole_dia/2, h=panel_thickness*4);
    
    // slots for tabs
    translate([panel_thickness, (bezel_height/4)-(tab_width/2), -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);
    translate([panel_thickness, ((bezel_height/4)*3)-(tab_width/2), -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);

    translate([bezel_width-(panel_thickness*2), (bezel_height/4)-(tab_width/2), -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);
    translate([bezel_width-(panel_thickness*2), ((bezel_height/4)*3)-(tab_width/2), -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);

    /*
    translate([panel_thickness/2, (bezel_height/3)-tab_width, -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);
    translate([bezel_width-(panel_thickness*1.5), bezel_height-(bezel_height/3), -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);
    translate([bezel_width-(panel_thickness*1.5), (bezel_height/3)-tab_width, -panel_thickness])
        cube([panel_thickness*tab_tolerance_coeff, tab_width, panel_thickness*4]);
    */
}

module bezel() {
    minkowski() {
        cube([bezel_width, bezel_height, panel_thickness]);
        cylinder(r=bezel_corner_radius, h=0.0001);
    }
}


module front_panel() {
    difference() {    
        bezel();
        bezel_holes();
        translate([
            ((bezel_width - nextion_overall_width - (lcd_aa_x_start/2))/2),
            ((bezel_height - nextion_overall_height)/2),
            0
        ]) 
        nextion_holes();
        
        translate([bezel_width/2, panel_thickness+(bezel_corner_radius/2), -panel_thickness])
            cylinder(r=m3_bolt_slot_dia/2, h=panel_thickness*3);
    }
}

front_panel();