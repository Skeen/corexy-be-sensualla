smoothrod_seperation = 40;

module demo_render(demo_length = 100, smoothrod_seperation = 40)
{
    for(j=[-1,1])
        color("gray")
            translate([j*(smoothrod_seperation/2),0,0])
            rotate([90,0,0])
            cylinder(r=8/2, h=demo_length, center=true);
}

module x_carriage(smoothrod_seperation = 40)
{
    // TODO: Mount bearings and stuff
    difference()
    {
        union()
        {
            for(i=[-1,1])
            translate([0,i*(smoothrod_seperation/2),0])
            hull()
            {
                for(j=[-1,1])
                    translate([j*(smoothrod_seperation/2),0,0])
                        rotate([90,0,0])
                        cylinder(r=16/2, h=10, center=true);
            }
            for(j=[-1,1])
                translate([j*(smoothrod_seperation/2),0,0])
                rotate([90,0,0])
                    cylinder(r=16/2, h=smoothrod_seperation, center=true);
        }
        for(j=[-1,1])
            translate([j*(smoothrod_seperation/2),0,0])
                rotate([90,0,0])
                cylinder(r=8/2, h=smoothrod_seperation+15, center=true);

    }

}

%square([24,30], center=true);

demo_render(100, smoothrod_seperation);
x_carriage(smoothrod_seperation);
