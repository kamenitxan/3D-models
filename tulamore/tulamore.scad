/*scale([0.1, 0.1, 0.1])
color("red") {
  surface(file = "logo2.png", center = true, invert = false);
}*/




    scale([10, 10, 10]) {
      color("green") {
        import("tlogr.stl");
      }
    }
    translate([0, 2.5, -15.05]) {
      import("Whisky_Barrel_Top_ver2.stl");
    }


//cube(size=[10, 10, 10], center=true);
