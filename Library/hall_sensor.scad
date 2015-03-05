use <Write/Write.scad>

module hall_sensor(sensor_height = 3.00, sensor_width = 4.10, sensor_depth = 0.74, sensor_trapz_width = 2.62, sensor_trapz_depth = 1.50, sensor_leg_diameter = 0.38, sensor_leg_height = 14.5, sensor_leg_distance = 1.27, include_legs = true)
{
difference()
{
    // Hull of the sensor
    hull()
    {
        cube([sensor_width, sensor_depth, sensor_height], center=true);
        translate([0,sensor_depth/2,0])
            cube([sensor_trapz_width, sensor_trapz_depth, sensor_height], center=true);
    }

    // Angular cuts
    for(i=[-1,1])
    translate([(sensor_width/2)*i,0,0])
    rotate([0,0,-3*i])
    cube([0.05,1,sensor_height+0.1],center=true);

    for(i=[-1,1])
    translate([0,0,(sensor_height/2)*i])
    rotate([5*i,0,0])
    cube([sensor_width,sensor_depth+0.1,0.1],center=true);

    for(i=[-1,1])
    translate([0,sensor_depth,(sensor_height/2)*i])
    rotate([-5*i,0,0])
    cube([sensor_width, sensor_trapz_depth/2+0.1,0.1],center=true);

    translate([0,-sensor_depth/2,0.5])
    rotate([90,0,0])
    write("Hall", center=true, t=0.25, h=1, font="orbitron.dxf");

    translate([0,-sensor_depth/2,-0.5])
    rotate([90,0,0])
    write("Sensor", center=true, t=0.25, h=0.5, font="orbitron.dxf");
}
if(include_legs == true)
{
        for(i=[-1:1])
        translate([sensor_leg_distance*i,sensor_depth/2+sensor_leg_diameter/2,-sensor_leg_height/2-sensor_height/2+0.1])
        cylinder(r=sensor_leg_diameter/2, h=sensor_leg_height, center=true);
}
}

hall_sensor();
