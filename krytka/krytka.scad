vyska=5;
sirka=7.9/2;
sirka_sroub=6.9/2;
$fn=300;

difference() {
  cylinder(r=sirka, h=vyska, center=true);
  cylinder(r=sirka_sroub, h=vyska+1, center=true, $fn = 6);
}

translate([0, 0, -vyska/2]) {
  difference() {
    sphere(r=sirka);
    translate([0, 0, 5]) cube(size=[20, 20, 10], center=true);
  }

}
