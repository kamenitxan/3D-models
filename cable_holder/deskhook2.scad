deskwidth = 18;
font = "Liberation Sans";
$fn=50;
sirka = 12.5;
vrchniSikminaUhel = -14;


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

module vyztuha() {
	hull() {
		translate([3, 90, 0]) cube(size=[5, 5, 5], center=false);
		translate([50, 70, 0]) cube(size=[5, 5, 5], center=false);
		translate([50, 90, 0]) cube(size=[5, 5, 5], center=false);
	}

}

module zarez(args) {
	cube(size=[15, 5, sirka*2], center=false);
}

module zipTie() {
	cube(size=[3, 20, sirka*3], center=true);
}

module deskhook()
{
		half();
		translate([0,0,sirka*2]) mirror([0, 0, 1]) half();
		translate([50,50,sirka*2-4]) cube(size=[8, 90, 8], center=true);
		vyztuha();

}

difference() {
	deskhook();
	for (i=[0:3]) {
		translate([45, i*18 + 10, sirka - sirka/2]) {
			zarez();
		}
	}
	translate([52, 84, sirka]) {
		zipTie();
	}

}
