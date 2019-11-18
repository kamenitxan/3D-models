font = "Liberation Sans";
$fn=50;
fs=4.5;

module podstavec() {
  difference() {
    cube(size=[30, 30, 3], center=true);
    translate([5,0,-1.1]) linear_extrude(height=1, center=true, convexity=10, twist=0) {
      rotate([0, 180, 0]) {
        translate([-5,8,0])text("Tomáš", size=fs, font=font);
        translate([-5,2,0])text("&", size=fs, font=font);
        translate([-5,-6,0])text("Káťa", size=fs, font=font);
        translate([-9,-12,0]) text("23.5.2020", size=fs, font=font);
      }
    }
  }


};

module cele() {
  translate([0,0,12]) import("duck.stl");
  podstavec();
};

cele();
