module demo_render(demo_length = 100)
{
    for(j=[-1,1])
        color("gray")
            translate([0,0,j*10])
            rotate([90,0,0])
            cylinder(r=8/2, h=demo_length, center=true);
}

module x_carriage(length = 20)
{
    // TODO: Mount bearings and stuff
    difference()
    {
        union()
        {
            hull()
            {
                for(i=[-1,1])
                for(j=[-1,1])
                    translate([0,i*(length/2),0])
                    translate([0,0,10*j])
                        rotate([90,0,0])
                        cylinder(r=16/2, h=10, center=true);
            }
        }
        for(j=[-1,1])
            translate([j*(smoothrod_seperation/2),0,0])
                rotate([90,0,0])
                cylinder(r=8/2, h=smoothrod_seperation+15, center=true);

    }

}

demo_render(100);
x_carriage();
