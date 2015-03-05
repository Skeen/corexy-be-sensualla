use <cylinder_poly.scad>

// Printable PLA Bushing

layer_h = 0.35;
layer_w = 0.5;

akse = 8;
fit_factor = 1; // fit factor *

blade_angel = 45;
blade_count = 7;


fn = blade_count*20;

module LM8UU(ud = 15.1, id = akse, h = 24) {
	
	difference() {
		union() {
			hull() {
				cylinder(h = layer_h, r = ud/2-layer_w);
				translate([0,0,layer_h]) cylinder(h = h-(2*layer_h), r = ud/2);
				translate([0,0,h-layer_h]) cylinder(h = layer_h, r = ud/2-layer_w);
			}
		}
		union() {
			translate([0,0,-0.5]) cylinder(h = h + 1, r = ud/2 - layer_w * 2, $fn = fn);
		}
	}
	for ( i = [0 : blade_count - 1] ) {
				hull() {
					rotate( i * 360 / blade_count, [0, 0, 1]) {
						translate([ud/2 - layer_w*2, 0, 0])cylinder(h = layer_h, r = layer_w/2);
						translate([ud/2 - layer_w*2, 0, layer_h])cylinder(h = h-(2*layer_h), r = layer_w);
						translate([ud/2 - layer_w*2, 0, h-layer_h])cylinder(h = layer_h, r = layer_w/2);
					}
					rotate( i * 360 / blade_count + blade_angel, [0, 0, 1]) {
						translate([((ud-id)/2 + layer_w * 2) * fit_factor, 0, 0]) cylinder(h = layer_h, r = layer_w/2);
						translate([((ud-id)/2 + layer_w * 2) * fit_factor, 0, layer_h]) cylinder(h = h-(2*layer_h), r = layer_w);
						translate([((ud-id)/2 + layer_w * 2) * fit_factor, 0, h-layer_h]) cylinder(h = layer_h, r = layer_w/2);
					}
				}
			}
			
			% translate([0,0,-h/2]) cylinder(h = h*2, r = id/2);
}

module bushing(ud = 15.6, ud_1 = 15.6, ud_2=16.2, id = akse, h = 11.2, krans = 16.8) {
	difference() {
		union() {
			cylinder(h = layer_h*2, r = krans/2, $fn = fn);
			cylinder(h = h-(layer_h*2), r = ud_1/2, $fn = fn);
			hull() {				
				translate([0,0,layer_h*4]) cylinder(h = 2*layer_h, r = ud_2/2, $fn = fn);
				translate([0,0,h-(layer_h*4)])cylinder(h = layer_h*2, r = ud_1/2, $fn = fn);
				translate([0,0,h-(layer_h*2)])cylinder(h = layer_h*2, r = (ud_1-layer_w)/2, $fn = fn);
			}			
		}
		union() {
			translate([0,0,-0.5]) cylinder(h = h + 1, r = ud_1/2 - layer_w * 2, $fn = fn);
		}
	}
	for ( i = [0 : blade_count - 1] ) {
				hull() {
					rotate( i * 360 / blade_count, [0, 0, 1]) {
						translate([ud_1/2 - layer_w*1.5, 0, 0])cylinder(h = layer_h, r = layer_w/1.8, $fn = fn/3);
						translate([ud_1/2 - layer_w*1.5, 0, layer_h])cylinder(h = h-(2*layer_h), r = layer_w, $fn = fn/3);
						translate([ud_1/2 - layer_w*1.5, 0, h-layer_h])cylinder(h = layer_h, r = layer_w/1.8, $fn = fn/3);
					}
					rotate( i * 360 / blade_count + blade_angel, [0, 0, 1]) {
						translate([((id)/2 + layer_w) * fit_factor, 0, 0]) cylinder(h = layer_h, r = layer_w/1.8, $fn = fn/3);
						translate([((id)/2 + layer_w) * fit_factor, 0, layer_h]) cylinder(h = h-(2*layer_h), r = layer_w, $fn = fn/3);
						translate([((id)/2 + layer_w) * fit_factor, 0, h-layer_h]) cylinder(h = layer_h, r = layer_w/1.8, $fn = fn/3);
					}
				}
			}
			
			% translate([0,0,-h/2]) cylinder(h = h*2, r = id/2, $fn = fn*3);
}

// Based on nophead research
module circle_poly(r) {
    n = max(round(2 * (r*2)),3);
    rotate([0,0,180])
        circle(r = r / cos (180 / n), $fn = n);
}

bushing();
//LM8UU();
