use <Library/20x40.scad>

module demo_render(demo_length = 100)
{
    translate([demo_length/2+10,0,0])
        20x40(center=true, L=demo_length);
    translate([0,demo_length/2+10,0])
        rotate([0,0,90])
        20x40(center=true, L=demo_length);
}

module idler_corner(span_width=30)
{
    difference()
    {
        hull()
        {
            square([20,20], center=true);
            translate([span_width, 0])
            circle(r=20/2, center=true);
            translate([0, span_width])
            circle(r=20/2, center=true);
        }
        translate([span_width, 0])
        circle(r=3/2, center=true, $fn=20);
        translate([0, span_width])
        circle(r=3/2, center=true, $fn=20);
    }
}

//idler_corner(30);

module cut_outs()
{
    for(i=[-1,1])
    {
        translate([0,0,10*i])
        {
            rotate([90,0,0])
            {
                cylinder(r=4/2, h=30, center=true, $fn=20);
                cylinder(r=8/2, h=15, center=true, $fn=20);
            }
            rotate([0,90,0])
            {
                cylinder(r=4/2, h=30, center=true, $fn=20);
                cylinder(r=8/2, h=15, center=true, $fn=20);
            }
        }
    }
}

module idler()
{
    difference()
    {
        cube([20,20,40], center=true);
        cut_outs();
        rotate([0,0,45])
        translate([-10,0,0])
        cube([20,40,50], center=true);
    }
}

idler();
demo_render();

