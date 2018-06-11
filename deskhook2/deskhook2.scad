deskwidth = 18;
font = "Liberation Sans";
$fn=50;
sirka = 17;
vrchniSikminaUhel = -14;

module etn() {
	linear_extrude(1) import("EtnAmpersand.dxf");
}

module name() {
	color("red") linear_extrude(1) text("PKr", size = 9, font = font, halign = "center", valign = "center", $fn = 16);
}

module half() {

	dolnidelka = 100;
	// pod stolem
	hull() {
		translate([0,1,0])cube([8,dolnidelka-1,sirka]);
		translate([10,1,1]) sphere(r = 1);
		translate([10,1,sirka]) sphere(r = 1);
		translate([0,1,1]) cube([1,1,1]);
		translate([0,1,sirka]) cube([1,1,1]);

		translate([1*(deskwidth-9),dolnidelka-1,0]) cube([1,1,1]);
		translate([1*(deskwidth-9),dolnidelka-1,sirka]) cube([1,1,1]);
	}

	// zadni svisla
	difference() {
		translate([10,dolnidelka-10,0]) cube([40,10,sirka]);
		translate([30,dolnidelka-5,deskwidth-1]) rotate([90, 0, 0])  cylinder(r=5, h=20, center=true);
	}

	// dolni
	hull() {
		//translate([50,1,0]) cube([10,dolnidelka-1,sirka]);
		//vzadu
		translate([50,dolnidelka-1,0]) cube();
		translate([50,dolnidelka-1,sirka]) cube();
		translate([57,dolnidelka-1,0]) cube();
		translate([57,dolnidelka-1,sirka]) cube();
		//vpredu
		translate([50,1,1]) sphere(r = 1);
		translate([50,1,sirka]) sphere(r = 1);
		translate([54,1,1]) sphere(r = 1);
		translate([54,1,sirka]) sphere(r = 1);
	}

	// svisly kvader
	hull() {
		translate([-1*(deskwidth+9),1,1]) cube([deskwidth+18,10,sirka-1]);
		translate([-1*(deskwidth+9),1,1]) sphere(r = 1);
		translate([-1*(deskwidth+9),1,sirka]) sphere(r = 1);
		translate([-1*(deskwidth+10),10,0]) cube([1,1,1]);
		translate([-1*(deskwidth+9),10,sirka]) sphere(r = 1);

		translate([1*(deskwidth-8),1,1]) sphere(r = 1);
		translate([1*(deskwidth-8),1,sirka]) sphere(r = 1);
		translate([1*(deskwidth-10),10,0]) cube([1,1,1]);
	}

	// dolni zarazka
	hull() {
		translate([47,1,1]) cube([8,5,sirka-1]);
		translate([47,1,1]) sphere(r = 1);
		translate([47,1,sirka]) sphere(r = 1);
		translate([54,1,1]) sphere(r = 1);
		translate([54,1,sirka]) sphere(r = 1);

		translate([47,5,1]) sphere(r = 1);
		translate([47,5,sirka]) sphere(r = 1);
		translate([54,5,1]) sphere(r = 1);
		translate([54,5,sirka]) sphere(r = 1);
	}



		// horni sikmina
		difference() {
				translate([-1*(deskwidth+10),10,0])cube([10,40,sirka]);
				translate([-42,0,-5]) {
								rotate([0,0,vrchniSikminaUhel]) {
												cube([10,60,50]);
								}
				}
		}
}

module deskhook()
{

		half();
		translate([0,0,sirka*2]) mirror([0, 0, 1]) half();

		translate([-22.3,38,sirka]) scale(0.4) rotate([180, 90, vrchniSikminaUhel]) {
			etn();
		}
		translate([-18,0.4,sirka-1])  rotate([90, -90, 0]) {
			name();
		}
}
deskhook();
