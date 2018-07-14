translate([0,0,-150]) import("DartCap.stl");

//import("/home/tomaspavel/Dokumenty/3dprint/sipky_zdemak/DartHolder.stl");

difference() {
  translate([0,12.2,-2]) {
    cube([1,1.5,10], center = true);
  }
  translate([0,11.5,-7.1]) {
    rotate([45,0,0]) {
      cube([2,2,2], center = true);
    }
  }
}

difference() {
  translate([0,-12.2,-2]) {
    cube([1,1.5,10], center = true);
  }
  translate([0,-11.5,-7.1]) {
    rotate([45,0,0]) {
      cube([2,2,2], center = true);
    }
  }
}
