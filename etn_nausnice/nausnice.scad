module etn() {
	linear_extrude(2) import("EtnAmpersand.dxf");
}

module kolo(velikost) {
	translate([velikost, velikost * 76, 0.5]) {
		color("black") {
			linear_extrude(1) circle(r=velikost * 200);
		}
	}
}

module logo(velikost) {
	translate([0, 0, 1]) difference() {
		kolo(velikost);
		etn();
	}
}

module nausnice(i, velikost) {
	translate([20 * i, 0, 0]) scale([velikost, velikost, 1]) {
		logo(velikost);
		color("red") translate([0, 0, -0.0]) kolo(velikost);
	}
}

//nausnice(-1, 0.15);
nausnice(0, 0.20);
//nausnice(1, 0.25);
//nausnice(2, 0.30);
