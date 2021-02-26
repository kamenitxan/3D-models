include <variables.scad>;
use <suspension.scad>;
use <hull.scad>;
use <turret.scad>;


module wheel() {
    translate([27.5,13.8,-1.2]) {
      rotate([0,90,0]) {
        difference() {
          cylinder(h = 9, r = 6.8, center = true, $fn = detail);
          translate([0,0,3]) {
            cylinder(h = 6, r = 5, center = true, $fn = detail);
          }
          translate([0,0,-0.8]) {
            ring(7, 5.5, 2);
          }
          // osa
          translate([0,0,-2]) {
            cylinder(h = 6, r = pinWidth, center = true, $fn = detail);
          }
        }
    }
  }
}

hull();
wheel();
suspension();
translate([0, -31, 19.5]) turret();

*scale([2,2,2]) {
translate([-18.5, 30, -5]) {
rotate([90,0,0]) {
    import("outline_leopard_2A6.STL");
}}}
*scale([2,2,2]) {
translate([-15.8, 20.5, 6.0]) {
rotate([90,0,0]) {
    import("outline_leopard_2A6_turret.STL");
}}}
