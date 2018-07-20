vyska=4;
sirka=4;
sirka_sroub=3;
$fn=300;

difference() {
  cylinder(r=sirka, h=vyska, center=true);
  cylinder(r=sirka_sroub, h=vyska+1, center=true, $fn = 6);
}

translate([0, 0, -vyska/2]) {
  difference() {
    sphere(r=sirka);
    translate([0, 0, 5]) cube(size=[10, 10, 10], center=true);
  }

}
