module kachna() {
  translate([-10, -30, 100]) {
    rotate([88,4,-25]) import("duck3.stl");
  }
  translate([5, -5, -10]) cube(size=[15, 16, 10], center=true);
}

fontsize = 5.5;
module label() {
  rotate([180,0,180]) linear_extrude(height=2, center=true, convexity=10, twist=0) {
    translate([3.5, 0, 0])text("Tomáš", size=fontsize, font="Liberation Sans:style=Bold", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");
    translate([13, -fontsize - 1, 0]) text("&", size=fontsize, font="Liberation Sans:style=Bold", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");
    translate([6.7, -fontsize *2  - 2, 0]) text("Káťa", size=fontsize, font="Liberation Sans:style=Bold", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");
    translate([-1, -fontsize *3 - 3, 0]) text("23.5.2020", size=fontsize, font="Liberation Sans:style=Bold", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");

  }

}



difference() {
  difference() {
    kachna();
    translate([0, 0, -17]) cube(size=[100, 100, 10], center=true);
  }

  #translate([22, 6, -12]) label();

}
