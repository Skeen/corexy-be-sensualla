$fn = 25;

module endstop_switch()
{
    difference()
    {
        union()
        {
            // Switch body
            cube([20, 6.2, 10.4], center=true);
            // Switch button
            translate([20/2-2.4/2-11.6,0,10.4/2+1.4/2])
                cube([2.4, 3.5, 1.4], center=true);
        }
        // Mount holes
        for(i=[-1,1])
        translate([9.6/2*i,0,10.4/2-7])
        rotate([90,0,0])
        cylinder(r=2.1/2, h=7, center=true);

    }
}

endstop_switch();
