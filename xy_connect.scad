use <Library/20x40.scad>

smoothrod_seperation = 40;

module demo_render(demo_length = 100, smoothrod_seperation = 40)
{
    translate([0,10,0])
        20x40(center=true, L=demo_length);

    color("gray")
        translate([0,-10,0])
        rotate([0,90,0])
        cylinder(r=8/2, h=demo_length, center=true);

    for(j=[-1,1])
        color("gray")
            translate([j*(smoothrod_seperation/2),0,10])
            rotate([90,0,0])
            cylinder(r=8/2, h=demo_length/2);
}

module xy_connect(smoothrod_seperation = 40)
{
    // TODO: Mount bearings and stuff
    difference()
    {
        hull()
        {
            translate([0,-10,0])
                rotate([0,90,0])
                cylinder(r=16/2, h=smoothrod_seperation+16, center=true);

            for(j=[-1,1])
                translate([j*(smoothrod_seperation/2),0,10])
                    rotate([90,0,0])
                    cylinder(r=16/2, h=20);
        }
        translate([0,-10,0])
            rotate([0,90,0])
            cylinder(r=8/2, h=smoothrod_seperation+16, center=true);

        for(j=[-1,1])
            translate([j*(smoothrod_seperation/2),0,10])
                rotate([90,0,0])
                cylinder(r=8/2, h=20);

    }

}

demo_render(100, smoothrod_seperation);
xy_connect(smoothrod_seperation);
