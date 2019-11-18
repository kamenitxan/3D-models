module kachna() {
  translate([-10, 0, 0]) {
    import("RubberDuck_body--03_withoutBallast.stl");
  }
}

fontsize = 3;
module label() {
  rotate([180,0,180]) linear_extrude(height=2, center=true, convexity=10, twist=0) {
    text("Tomáš & Káťa", size=fontsize, font="Liberation Sans", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");
    translate([0, -fontsize - 1, 0]) {
      text("21.5.2020", size=fontsize, font="Liberation Sans", halign="left", valign="baseline",spacing=1.0, direction="ltr", language="en", script="latin");
    }
  }

}



difference() {
  kachna();

  label();

}
