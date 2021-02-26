
Spinbox_sc = 0.015;
Spinbox_x = -20.7;
Spinbox_y = -34.8;

color("pink") {
  size = 0.16;


  difference() {
    union() {
      import("Base-v2.stl");
      translate([-21.8, -36, 2.5]) scale([size, size, 1]) logo("Splneneprani_logo_plne.svg");
    }


    translate([Spinbox_x, Spinbox_y, 2.5]) scale([size - Spinbox_sc, size - Spinbox_sc, 3]) logo("Splneneprani_logo_plne.svg");
  }
}

module logo(file) {

  difference() {
    linear_extrude(height=5, center=true, convexity=10, twist=0) {
      import(file);
    }
    translate([220, 190, 0]) cube(size=[30, 30, 30], center=true);
  }

}
