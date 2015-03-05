include <../config/config.scad>
module t_slot_slider(length=10)
{
    difference()
    {
        // Extrusion
        translate([-0.3,0,0]) linear_extrude(length)
        {
        	/*
            translate([1.5/2+0.3,0,0])
            {
                square([1.5,6], center=true);
            }
            */
            hull()
            {
                translate([1.25/2+1.5+0.3,0,0])
                    square([1.25, 10.8], center=true);

                translate([4/2+1.5+0.3,0,0])
                    square([4, 5.8], center=true);
            }
        }
        // Flanged edge
        for(i=[-1,1])
        translate([6/2,i*4,-4/2])
        rotate([-60*i,0,0])
        cube([6,4,10], center=true);
        for(i=[-1,1])
        translate([6/2,i*4,4/2+length])
        rotate([60*i,0,0])
        cube([6,4,10], center=true);
    }
}

use <20x40.scad>

translate([-0.5,0,10])
rotate([0,90,0])
20x40(10);

t_slot_slider(30);
