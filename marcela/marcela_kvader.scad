vyska=35;
sirka=20;
hloubka=18;

color("orange") {
  cube(size=[sirka, hloubka, vyska], center=false);
  translate([0, 0, vyska]) {
    cube([sirka, 1.5, 2]);
  }
}
