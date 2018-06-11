w_width=1.6;
hloubka=92;
vyska=62;

v1=58;
v2=v1+24;
v3=v2+6;
v4=v3+7;
v5=v4+6;
v6=v5+12;
v7=v6+30;
delka=v7+7*w_width;


module spodek(args) {
  translate([0, 0, -w_width]) cube(size=[delka+w_width, hloubka+w_width*2, w_width], center=false);
}

module bok_dlouhy(y) {
  translate([0, y, 0]) {
    cube(size=[delka+w_width, w_width, vyska], center=false);
  }
}

module bok_kratky(x) {
  translate([x, 0, 0]) {
    cube(size=[w_width, hloubka+w_width, vyska], center=false);
  }
}

module kratke_boky() {
  bok_kratky(0);
  bok_kratky(v1+1*w_width);
  bok_kratky(v2+2*w_width);
  bok_kratky(v3+3*w_width);
  bok_kratky(v4+4*w_width);
  bok_kratky(v5+5*w_width);
  bok_kratky(v6+6*w_width);
  bok_kratky(v7+7*w_width);
}

module celek() {
  spodek();
  bok_dlouhy();
  bok_dlouhy(hloubka+w_width);

  difference() {
    union() {
      kratke_boky();
    }
    translate([-w_width,w_width/2+hloubka/2,vyska]) rotate([0,90,0]) cylinder(r=10, h=delka, center=false);
  }
}
celek();
