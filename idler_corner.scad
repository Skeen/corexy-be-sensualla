use <Library/20x40.scad>
$fn = 20;

module demo_render(demo_length = 100)
{
    translate([0,0,-20])
    {
        translate([demo_length/2+10,0,0])
            20x40(center=true, L=demo_length);
        translate([0,demo_length/2-10,0])
            rotate([0,0,90])
            20x40(center=true, L=demo_length);
    }
}

module idler_corner(span_width=30)
{
    difference()
    {
        hull()
        {
            square([20,20], center=true);
            translate([span_width, 0])
                square([20,20], center=true);
            translate([0, span_width])
                square([20,20], center=true);
        }
        circle(r=3/2, center=true);
        translate([span_width, 0])
            circle(r=3/2, center=true);
        translate([0, span_width])
            circle(r=3/2, center=true);
    }
}

idler_corner(30);

demo_render();

