sirka = 100;




difference() {
  cube(size=[sirka, sirka, 6], center=true);
  translate([0,0,1]) cube(size=[sirka-1, sirka-1, 6], center=true);
}

translate([sirka + 2 ,0,-2.5]) difference() {
  cube(size=[sirka, sirka, 1], center=true);
  s = 2.2;
  translate([-46,-65,0])  linear_extrude(height=5, center=true, convexity=10, twist=0) scale([s, s, 0]) import("unicorn2.svg");
}
