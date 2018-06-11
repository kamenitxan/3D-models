// etn stoly 18mm
deskwidth = 16 - 18; // sirka - default
name = "MMj";
logo = false;
jmeno = false;
font = "Liberation Sans";
$fn=50;


module etn() {
	linear_extrude(1) import("EtnAmpersand.dxf");
}

module name() {
	color("red") linear_extrude(1) text(name, size = 9, font = font, halign = "center", valign = "center", $fn = 16);
}

module zarazka() {
	hull() {
		translate([-31,-59,0]) cube([7,3,40]);
		translate([-31,-59,1]) sphere(r = 1);
		translate([-31,-59,39]) sphere(r = 1);
		translate([-31,-56,1]) sphere(r = 1);
		translate([-31,-56,39]) sphere(r = 1);

		translate([-24,-59,1]) sphere(r = 1);
		translate([-24,-59,39]) sphere(r = 1);
		translate([-24,-56,1]) sphere(r = 1);
		translate([-24,-56,39]) sphere(r = 1);
	}
}

module deskhook()
{
	vrchniSikminaUhel = -14;
	// pod stolem
	translate([deskwidth,0,0]) difference() {
		hull() {
			translate([0,1,0]) cube([10,23,40]);
			translate([1,1,39]) sphere(r = 1);
			translate([1,1,1]) sphere(r = 1);
			translate([9,1,39]) sphere(r = 1);
			translate([9,1,1]) sphere(r = 1);
		}

		translate([10,3,-1]) rotate([0,0,20]) cube([15,30,42]);
	}
	// zarazka na konci
	zarazka();
	translate([-50,0,0]) mirror([1, 0, 0]) {
		zarazka();
	}


	// svisly kvader
	difference() {
		hull() {
			translate([-1*(deskwidth+10),0,1]) cube([deskwidth+12,10,38]);
			translate([5,1,39]) sphere(r = 1);
			translate([5,1,1]) sphere(r = 1);
			translate([5,10,39]) cube([1,1,1]);
			translate([5,10,0]) cube([1,1,1]);

			translate([-27,1,39]) sphere(r = 1);
			translate([-27,1,1]) sphere(r = 1);
			translate([-27,10,39]) cube([1,1,1]);
			translate([-27,10,1]) cube([1,1,1]);
			translate([-27,10,39]) sphere(r = 1);
			translate([-27,10,1]) sphere(r = 1);
		}
		translate([deskwidth+3, 0, -1]) cube(size=[20, 50, 50], center=false);
	}



		// hlavni horni plocha
    translate([-28,-58,0]) {
					delka = 60;
					hull() {
						translate([1,0,1]) cube([8,60,38]);
						translate([1,60,1]) rotate([90, 0, 0]) cylinder(r=1,h=delka);
						translate([1,60,39]) rotate([90, 0, 0]) cylinder(r=1,h=delka);
						translate([9,60,1]) rotate([90, 0, 0]) cylinder(r=1,h=delka);
						translate([9,60,39]) rotate([90, 0, 0]) cylinder(r=1,h=delka);
					}

    }
		// horni sikmina
    difference() {
        translate([-1*(28),10,0])cube([10,40,40]);
        translate([-42,0,-5]) {
                rotate([0,0,vrchniSikminaUhel]) {
                        cube([10,60,50]);
                }
        }
    }
    /* spodni doraz
		difference() {
        translate([3,19,]) {
                rotate([0,0,-55]) {
                        cube([10,25,40]);
                }
        }
        translate([10,24,-5]) {
            cube([30,10,50]);
        }
    }*/
		if (logo) {
			translate([-22.3,38,20]) scale(0.4) rotate([180, 90, vrchniSikminaUhel]) {
				etn();
			}
		}
		if (jmeno) {
			translate([-24.9,-59.5,20])  rotate([90, -90, 0]) {
				name();
			}
		}

}
deskhook();
