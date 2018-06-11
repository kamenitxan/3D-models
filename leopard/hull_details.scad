module engineGrill() {
  width = 68.8;
  height = 8;
  //zebra
  for (a = [0:16]) {
    translate([0,0,a/2]) {
      rotate([-15,0,0]) {
        cube([width, 1, 0.2], center = true);
      }
    }
  }
  // bocni kraj
  kor = 0.25;
  translate([width/2-kor,0,height/2]) cube([0.5, 1, height+1], center = true);
  translate([-width/2+kor,0,height/2]) cube([0.5, 1, height+1], center = true);
  // spodni kraj
  translate([0,0,-0.5]) cube([width, 1, 0.5], center = true);
  //horni kraj
  translate([0,0,height+0.5]) cube([width, 1, 0.5], center = true);
}

module sideSkirt1(i) {

}

module sideSkirt2(i) {

}

module sideSkirt3(i) {

}
