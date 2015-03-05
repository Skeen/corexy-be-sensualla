use <Library/20x40.scad>
$fn=20;

module demo_render(demo_length = 50)
{
    translate([-10,-20,0])
    {
        translate([demo_length/2+10,0,0])
            20x40(center=true, L=demo_length);
        translate([0,demo_length/2-10,0])
            rotate([0,0,90])
            20x40(center=true, L=demo_length);
        color("gray")
        translate([10,20,0])
            rotate([0,90,0])
            cylinder(r=8/2, h=demo_length);
    }
}

module smooth_holder()
{
    translate([3/2,0,0])
    difference()
    {
        hull()
        {
            rotate([0,90,0])
                cylinder(r=12/2, h=10);
            cube([3, 20, 40], center=true);
        }
        rotate([0,90,0])
            cylinder(r=8/2, h=22, center=true);
        for(i=[-1,1])
        for(j=[-1,1])
            translate([3/2,0,0])
            translate([0,6*i,0])
            translate([0,0,10*j])
            rotate([0,90,0])
            {
                cylinder(r=6/2, h=10);
                cylinder(r=4/2, h=22, center=true);

            }
    }
}

smooth_holder();
demo_render();
