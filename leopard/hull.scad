include <variables.scad>;
use <hull_details.scad>;

module wheelPin(i, h, start) {
  translate([0,start + i * 15.6,-2 + h]) {
    rotate([90,0,90]) {
      cylinder(h = 80, r = pinWidth, center = true, $fn = detail);
    }
  }
}

module bottomHull() {
    translate([0, -18, 5]) {
        difference() {
            cube(size = [42,150,11], center=true);
            translate([0,-77.7,0]) {
                rotate([30,0,0]) {
                    cube(size = [43,10,30], center=true);
                }
            }
            translate([0,-77.7,-3.5]) {
                rotate([60,0,0]) {
                    cube(size = [43,10,30], center=true);
                }
            }
            // zadni cast
            translate([0,74.7,0]) {
                rotate([-15,0,0]) {
                    cube(size = [43,10,30], center=true);
                }
            }
            translate([0,74.7,-3]) {
                rotate([-45,0,0]) {
                    cube(size = [43,10,30], center=true);
                }
            }
            // vnitri misto
            translate([0,0,3]) {
                cube(size = [38,135,11], center=true);
            }
            // wheel pins
            translate([0,-58.5,-1]) {
              rotate([90,0,90]) {
                cylinder(h = 80, r = pinWidth, center = true, $fn = detail);
              }
            }
            for (a = [0:2]) {
              wheelPin(a, 0, -42.5);
              wheelPin(a, 0, 6.5);
            }
            for (a = [0:6]) {
              wheelPin(a, 7 , -43.5);
            }
        }
    }
}

module topWheel() {
  rotate([0, 90, 0]) {
    cylinder(h = 10, r = pinWidth, center = true, $fn = detail);
    translate([0,0,3]) cylinder(h = 3, r = pinWidth + 1, center = true, $fn = detail);
  }

}

module topHull() {
  width = 68.8;
  translate([0, -18, 18.5]) {
    difference() {
      cube([width, 150, 16], center = true);
      translate([0,-11,10.1]) {
        cube([width + 1, 49, 12], center = true);
      }
      translate([0,-51,7.5]) {
        rotate([9.5,0,0]) {
          cube([width +1 , 59, 12], center = true);
        }
      }
      translate([0,-73,0.7]) {
        rotate([35,0,0]) {
          cube([width + 1, 20, 12], center = true);
        }
      }
      translate([0,-13,0]) {
        cylinder(h = 20, r = turretRingWidth, center = true, $fn = detail);
      }
      translate([0,47.8,12.2]) {
        rotate([3.4,0,0]) {
          cube([width + 1, 70, 12], center = true);
        }
      }
      translate([0,77.5,-3]) {
          rotate([-15,0,0]) {
              cube(size = [width + 1,10,30], center=true);
          }
      }
      // vnitri misto
      translate([0,10,-4]) {
          cube(size = [38,115,11], center=true);
      }
      for (a = [0:5]) {
        wheelPin(a, -4 , -33.5);
      }
    }

  }
}

module leftHullSide() {

}

module rightHullSide() {

}

module ring(r1, r2, h) {
    difference() {
        cylinder(r = r1, h = h);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2, $fn = detail);
    }
}

module details() {
  translate([ 0, 55.5, 18 ]) {
    rotate([-15,0,0]) {
      engineGrill();
    }
  }

}

module hull() {
  bottomHull();
  difference() {
    topHull();
    translate([ 28.5, 0, 12.1 ]) cube(size = [15,200,11], center=true);
    translate([ -28.5, 0, 12.1 ]) cube(size = [15,200,11], center=true);
  }
  leftHullSide();
  rightHullSide();
  details();
   translate([22,10,12]) topWheel();
}
