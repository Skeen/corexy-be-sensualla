module 20x40(L = 50, center = false, massive = false) {
color("silver")
if (center == true)
{
	if (massive == true) {
		cube (size = [L, 20, 40], center = true);
	} else { 
		rotate([90, 0, 90]) {
			linear_extrude(height = L, center = center, convexity = 10)
			import (file = "HFSB5-2040-50_view1_AUTOCAD_VERSION_2013.dxf");
		}
	}
} else {
	if (massive == true) {
		translate ([0, -10, 0]) cube (size = [L, 20, 40], center = false);
	} else {
		translate([0,0,20]) rotate([90, 0, 90]) {
			linear_extrude(height = L, center = center, convexity = 10)
			import (file = "HFSB5-2040-50_view1_AUTOCAD_VERSION_2013.dxf");
		}
	}
}
}

20x40(center = true, massive = false);
