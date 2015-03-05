use <Library/20x40.scad>
use <idler_corner.scad>
use <motor_corner.scad>
use <Library/nema_17.scad>
use <smooth_holder.scad>
use <xy_connect.scad>
use <x_carriage.scad>

// TODO: Corner bend / Strengthening t-slot sliders

// Footprint size, determines work_area
// Not including motors (i.e. alu frame center area)
footprint_x = 230;
footprint_y = 220;

// Alu extrusion frame width
alu_frame_width = 20;
// Calculated values
// Half the width of the alu frame
alu_frame_half_w = alu_frame_width/2;
// Length of alu frames
alu_frame_length_x = footprint_x;
alu_frame_length_y = footprint_y - (alu_frame_width*2);
// The calculated work inner of the machine
inner_area_x = footprint_x - alu_frame_width*2;
inner_area_y = footprint_y - alu_frame_width*2;
// The calculated actual work area of the machine
work_area_x = inner_area_x - alu_frame_width*2 - 40 - 10;
work_area_y = inner_area_y - alu_frame_width*2 - 40;

echo("Inner area (x,y) = (", inner_area_x, ", ", inner_area_y, ")");
echo("Work area (x,y) = (", work_area_x, ", ", work_area_y, ")");

//%square([work_area_x, work_area_y], center=true);
//%square([inner_area_x, inner_area_y], center=true);
//%square([footprint_x, footprint_y], center=true);

// Render the x alu frames
translate([0,0,-20])
{
for(i=[-1,1])
translate([0,i * ((footprint_y / 2) - alu_frame_half_w), 0])
    20x40(center=true, L=alu_frame_length_x);

for(i=[-1,1])
translate([i * ((footprint_x / 2) - alu_frame_half_w), 0, 0])
    rotate([0,0,90])
        20x40(center=true, L=alu_frame_length_y);
}

// y-end idlers
for(i=[-1,1])
    translate([i*((footprint_x/2) - alu_frame_half_w),0,0])
    translate([0, -((footprint_y/2) - alu_frame_half_w),0])
    rotate([0,0,45+45*i])
        idler_corner(21);

// y-end motors
for(i=[-1,1])
    translate([i*((footprint_x/2) - alu_frame_half_w),0,0])
    translate([0, ((footprint_y/2) - alu_frame_half_w),0])
    rotate([0,0,-90])
    mirror([0,1+i,0])
    {
        motor_corner(21);

        translate([42/4-42,42/4,0])
        nema_17();
    }

// y-smoothrods
color("gray")
for(i=[-1,1])
    translate([i*((footprint_x/2) - alu_frame_half_w * 3),0,-20])
    rotate([90,0,0])
    cylinder(r=8/2, h=alu_frame_length_y, center=true);

// y-smoothrod holders
for(i=[-1,1])
for(j=[-1,1])
translate([i*((footprint_x/2) - alu_frame_half_w * 3),0,-20])
translate([0, -j*((footprint_y/2) - alu_frame_width),0])
rotate([0,0,90*j])
smooth_holder();

x_smoothrod_seperation = 40;
translate([0,-47+(47*2*$t),0])
{
// x-smooth rods
color("gray")
for(i=[-1,1])
    translate([0, i*(x_smoothrod_seperation/2),-10])
    rotate([0,90,0])
    cylinder(r=8/2, h=inner_area_x, center=true);

// xy-connect
for(i=[-1,1])
translate([i*((footprint_x/2) - alu_frame_width * 2),0,-20])
    rotate([0,0,90*i])
    xy_connect(x_smoothrod_seperation);

// x-carriage
//translate([0,0,-10+8/2+3/2])
translate([-49+(49*2*$t),0,0])
translate([0,0,-10])
rotate([0,0,90])
x_carriage(x_smoothrod_seperation);
}

echo("---------------------------------------------------------------");
echo("BOM:");
echo("Vitamins:");
echo("2xAluminium Extrusion 20x40, length=", alu_frame_length_x);
echo("2xAluminium Extrusion 20x40, length=", alu_frame_length_y);
echo("2xSmooth rod 8mm, length=", alu_frame_length_y);
echo("2xSmooth rod 8mm, length=", inner_area_x);
echo("Plastics:");
echo("2xIdler corner");
echo("2xMotor corner");
echo("4xSmooth holder");
echo("2xXY connect");
echo("1xX carriage");
