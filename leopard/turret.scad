include <variables.scad>;

lenght = 150;

module top() {
  difference() {
    translate([0,11.5,14.7]) cube(size = [60,120,10], center=true);
    // zadni bok
    translate([-28,53,15]) rotate([0,0,-5]) cube(size = [10,60,15], center=true);
    translate([28,53,15]) rotate([0,0,5]) cube(size = [10,60,15], center=true);

    translate([-26.8,53,15]) rotate([0,0,-30]) cube(size = [10,60,15], center=true);
    translate([26.8,53,15]) rotate([0,0,30]) cube(size = [10,60,15], center=true);
    // zadni vrch
    translate([0,60,21]) rotate([-7,0,0]) cube(size = [62,30,5], center=true);
    // predni vrch
    translate([0,-20,22.2]) rotate([6,0,0]) cube(size = [62,60,10], center=true);
    // stred bok
    translate([-30.5,15,15])  cube(size = [10,19,15], center=true);
    translate([30.5,15,15])  cube(size = [10,19,15], center=true);
    // sp1
    translate([-18,-40,19]) rotate([35,0,-31]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-18,-40,19]) rotate([35,0,-31]) cube(size = [40,40,15], center=true);
    // sp2
    translate([-30.3,-30,19]) rotate([11,-66,0]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-30.3,-30,19]) rotate([11,-66,0]) cube(size = [40,40,15], center=true);
    // sp3
    translate([-33.7,-14.5,19]) rotate([0,-71,0]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-33.7,-14.5,19]) rotate([0,-71,0]) cube(size = [40,40,15], center=true);
    // sp4
    translate([-36.1,2,19]) rotate([0,0,45]) cube(size = [20,10,20], center=true);
    mirror([1,0,0]) translate([-36.1,2,19]) rotate([0,0,45]) cube(size = [20,10,20], center=true);
    //barrel
    translate([0,-37,9])  cube(size = [11,50,20], center=true);
    //vnitrek
    translate([0,15,10])  cube(size = [40,90,10], center=true);
    //konec
    translate([0,73.7,13]) rotate([-10,0,0]) cube(size = [60,10,15], center=true);
    }
}

module turrerRing() {
  difference() {
    union() {
      cylinder(h = 8, r = turretRingWidth, center = true, $fn = detail);
      translate([0,0,3.5]) cylinder(h = 1, r = turretRingWidth+1, center = true, $fn = detail);
    }
    cylinder(h = 10, r = turretRingWidth-2, center = true, $fn = detail);
  }
}

module bottom() {
  turrerRing();
  difference() {
    translate([0,11.5,6.7]) cube(size = [60,120,6], center=true);
    // zadni spodek
    translate([0,63,4.7]) cube(size = [62,40,6], center=true);
    // zadni bok
    translate([-28,53,8]) rotate([0,0,-5]) cube(size = [10,60,15], center=true);
    translate([28,53,8]) rotate([0,0,5]) cube(size = [10,60,15], center=true);

    translate([-26.8,53,15]) rotate([0,0,-30]) cube(size = [10,60,15], center=true);
    translate([26.8,53,15]) rotate([0,0,30]) cube(size = [10,60,15], center=true);
    // stred bok
    translate([-30.5,15,8])  cube(size = [10,19,15], center=true);
    translate([30.5,15,8])  cube(size = [10,19,15], center=true);
    // sp1
    translate([-18,-40,1.4]) rotate([-25,0,-31]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-18,-40,1.4]) rotate([-25,0,-31]) cube(size = [40,40,15], center=true);
    // sp2
    translate([-30.3,-30,2.1]) rotate([-11,59,0]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-30.3,-30,2.1]) rotate([-11,59,0]) cube(size = [40,40,15], center=true);
    // sp3
    translate([-37.4,-14.5,9]) rotate([0,58,0]) cube(size = [40,40,15], center=true);
    mirror([1,0,0]) translate([-37.4,-14.5,9]) rotate([0,58,0]) cube(size = [40,40,15], center=true);
    // sp4
    translate([-36.1,2,9]) rotate([0,0,45]) cube(size = [20,10,20], center=true);
    mirror([1,0,0])translate([-36.1,2,9]) rotate([0,0,45]) cube(size = [20,10,20], center=true);
    //sikmy spodek
    translate([0,24.4,-0.1]) rotate([14.2,0,0]) cube(size = [62,40,6], center=true);
    //barrel
    translate([0,-37,9])  cube(size = [11,50,20], center=true);
    //vnitrek
    translate([0,0,10])  cube(size = [40,45,10], center=true);
    cylinder(h = 12, r = turretRingWidth-2, center = true, $fn = detail);
    //konec
    translate([0,73.7,13]) rotate([-10,0,0]) cube(size = [60,10,15], center=true);
  }
}

module barrel() {
  difference() {
    translate([0,-80,9.7]) rotate([90,0,0]) cylinder(h = 100, r = 3.2, center = true, $fn = detail);
    translate([0,-80,9.7]) rotate([90,0,0]) cylinder(h = 110, r = 2.4, center = true, $fn = detail);
  }

}

module turret() {
  translate([0,0,0]) top();
  bottom();
  barrel();
}
