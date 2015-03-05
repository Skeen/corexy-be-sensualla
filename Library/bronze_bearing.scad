use <cylinder_poly.scad>

module bronze_bearing() {
	translate ([0, 0, -11.5]) difference() { 
		color ("DarkSlateGray") union () { 
			hull() {
				translate ([0,0,8]) cylinder_poly (h = 2, r = 16/2, center = false);
				translate ([0, 0, 0]) cylinder_poly (h = 2, r = 15.6/2, center = false);
			}
			translate ([0, 0, 0]) cylinder_poly (h = 11.5, r = 15.6/2, center = false);
			translate ([0, 0, 10.5]) cylinder_poly (h = 1, r = 16.8/2, center = false);
		}
		color ("grey") union () { 
			%translate ([0, 0, -0.1])  cylinder (h = 11.7, r = 8/2, center = false);
		}
	}
}

bronze_bearing();
