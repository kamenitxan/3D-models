size = 1;

module krouzek() {
  difference() {
    union() {
      cylinder(r=20, h=5);
      translate([-20, -20, 0]) cube([40, 20, 5]);
    }

    translate([0, 0, -1]) cylinder(r=10, h=7);
  }

}

module logo(file) {
    linear_extrude(height=5, center=true, convexity=10, twist=0) {
      import(file);
    }
}


s = 0.17;
translate([0, -35, 0]) scale([s, s, 0.6]) {
  translate([0, 0, 0]) scale([size, size, 1]) logo("Splneneprani_logo.svg");

  translate([182, 195, -2.5]) rotate([0, 0, -40]) {
    krouzek();
  }
}
