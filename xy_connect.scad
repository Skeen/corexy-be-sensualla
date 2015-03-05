use <Library/20x40.scad>

module demo_render(demo_length = 100)
{
    translate([0,10,0])
        20x40(center=true, L=demo_length);

    color("gray")
        translate([0,-10,0])
        rotate([0,90,0])
        cylinder(r=8/2, h=demo_length, center=true);

    for(j=[-1,1])
        color("gray")
            translate([0,0,10*j])
            rotate([90,0,0])
            cylinder(r=8/2, h=demo_length/2);
}

module xy_connect()
{
    // TODO: Mount bearings and stuff
    difference()
    {
        hull()
        {
            translate([0,-10,0])
                rotate([0,90,0])
                cylinder(r=16/2, h=16*2, center=true);

            for(j=[-1,1])
                translate([0,0,10*j])
                    rotate([90,0,0])
                    cylinder(r=16/2, h=20);
        }
        translate([0,-10,0])
            rotate([0,90,0])
            cylinder(r=8/2, h=16*2, center=true);

        for(j=[-1,1])
            translate([0,0,10*j])
                rotate([90,0,0])
                cylinder(r=8/2, h=20);

    }

}

demo_render(100);
xy_connect();
