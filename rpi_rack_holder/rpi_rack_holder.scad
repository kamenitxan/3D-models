

hexagon_radius = 1.8;
module hexagon(x, z) {
  translate([x, 0, z]) {
    rotate([90, 90, 0]) {
      cylinder(r=hexagon_radius, h=10, center=true, $fn=6);
    }
  }
}

space=hexagon_radius + hexagon_radius/2;
r1=0;
r2=1*space;
r3=2*space;

max_cols=6;
msp= hexagon_radius/2;

module hex_grid() {
  for (col=[0:max_cols]) {
    hexagon(col*space+col*msp,r1);
  }
  for (col=[0:max_cols]) {
    hexagon(col*space+space/2+col*msp+msp/2,r2);
  }
  for (col=[0:max_cols]) {
    hexagon(col*space+col*msp,r3);
  }
}


translate([100, 100, 100]) {
  difference() {
    translate([40, -65, -55]) import("RackMount_RPiSleeve_v2.1-left-front.stl");
    //#hex_grid();
  }
}
