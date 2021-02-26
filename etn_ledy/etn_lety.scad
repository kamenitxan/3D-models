

//difference() {
//  cube(size=[30, 40, 10], center=true);
//  translate([-1.5, -7, 0]) {
//    scale([0.5, 0.5, 1]) linear_extrude(10) import("EtnAmpersand.dxf");
//  }
//}

sirka = 59.3;
vyska = 80.6;
pocet_sirka = 3;
pocet_vyska = 2;

module single() {


  ps = 3.9;
  pv = 14.6;


  linear_extrude(height = 15) {
     difference() {
       offset(r = 5) {
        import("EtnAmpersand.dxf");
       }
       offset(r = 0) {
         import("EtnAmpersand.dxf");
       }
     }
   }
  color("red") translate([ps, pv, 0]) cube(size=[sirka, vyska, 3], center=true);
}



scale([1.1, 1.1, 1]) {
  for (e=[0:pocet_vyska]) {
    for (i=[0:pocet_sirka]) {
      translate([i * sirka, e * vyska, 0]) {
        single();
      }
    }
  }
}
