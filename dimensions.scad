panel_thickness = 5;

bezel_width = 140;
bezel_height = 85;
bezel_corner_radius = 3;
bezel_screw_hole_dia = 3.5;
bezel_angle = 70; // degrees

tab_tolerance_coeff = 1.025;
tab_width = 15;

floor_width = bezel_width - (panel_thickness * 4);
floor_depth = 120;
floor_height_above_bottom = 10; 

sma_bulkhead_radius = 3.25;
sma_bulkhead_flat_radius = 3;

roof_width = 100;
roof_depth = 80;
roof_height_below_top = 5; 

side_height = 100;
side_depth  = floor_depth;
side_corner_radius = 1.5;
chin_depth = 42;


// Pi standoff holes
// All measurements taken from https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/rpi_MECH_3bplus.pdf
// Top left etc relative to drawing
// 0,0 of drawing is bottom left corner

pi_width = 85;
pi_depth = 56;
pi_hole_dia = 2.75;
pi_hole_radius = pi_hole_dia / 2;
standoff_dia = pi_hole_dia * 2;
standoff_radius = standoff_dia / 2;
standoff_height = 3;
pi_standoff_holes = [
    [3.5, 3.5],           // bottom left
    [3.5+58, 3.5],      // bottom right
    [3.5, 3.5+49],      // top left
    [3.5+58, 3.5+49], // top right
];


m3_bolt_thread_len = 8;
m3_bolt_dia = 3;
m3_bolt_clearance_coeff = 1.02;
m3_bolt_slot_dia = m3_bolt_dia * m3_bolt_clearance_coeff;
m3_bolt_slot_len = m3_bolt_thread_len + 1;
m3_nut_flats_dia = 5.5;
m3_nut_clearance_coeff = 1.025;
m3_nut_points_dia = 6;
m3_nut_depth = 2.5;
m3_nut_slot_width = ((m3_nut_flats_dia * m3_nut_clearance_coeff) - m3_bolt_slot_dia) * 2;
m3_nut_slot_depth = m3_nut_depth * m3_nut_clearance_coeff;
   
