include <variables.scad>;

spl = 11.5;

module suspensionPart() {
  cylinder(r=pinWidth, h=5, center=false, $fn = detail);
  translate([-1,0,0]) {
    cube([2,spl, 1.8]);
  }
  translate([2,spl-1,1]) {
    rotate([0, 90, 0]) {
      cylinder(r=0.5, h=2, center=true, $fn = detail);
    }
  }
  translate([0,spl-1,-1]) {
    rotate([0, 0, 0]) {
      cylinder(r=pinWidth, h=4, center=true, $fn = detail);
    }
  }
}

module topPart() {

}

module suspension() {
  translate([23, 4, 3]) {
    rotate([90, -110, -90]) {
      suspensionPart();
    }
  }


  topPart();
}
