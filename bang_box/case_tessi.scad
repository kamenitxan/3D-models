w_width=1.6;
hloubka=92;
vyska=60;
vyska_viko=20;

v1=78;
v2=v1+24;
v3=v2+6;
v4=v3+7;
v5=v4+6;
v6=v5+12;
v7=v6+50;
delka=v7+7*w_width;
mez=0.5;


module spodek(add) {
  translate([0, 0, -w_width]) cube(size=[delka+w_width+add+mez, hloubka+w_width*2+add+mez, w_width], center=false);
}

module bok_dlouhy(y, add, height, move) {
  translate([0, y+move, 0]) {
    cube(size=[delka+w_width+add, w_width, height], center=false);
  }
}

module bok_kratky(x, add, height, move) {
  translate([x+move, 0, 0]) {
    cube(size=[w_width, hloubka+w_width+add, height], center=false);
  }
}

module bok_spodek(x) {
  bok_kratky(x, 0, vyska, 0);
}

module kratke_boky() {
  bok_spodek(0);
  bok_spodek(v1+1*w_width);
  bok_spodek(v2+2*w_width);
  bok_spodek(v3+3*w_width);
  bok_spodek(v4+4*w_width);
  bok_spodek(v5+5*w_width);
  bok_spodek(v6+6*w_width);
  bok_spodek(v7+7*w_width);
}

module celek() {
  spodek(0);
  bok_dlouhy(0,0,vyska,0);
  bok_dlouhy(hloubka+w_width,0,vyska,0);

  difference() {
    union() {
      kratke_boky();
    }
    translate([-w_width,w_width/2+hloubka/2,vyska]) rotate([0,90,0]) cylinder(r=10, h=delka, center=false);
  }
}

module viko() {
  spodek(w_width*2);
  bok_kratky(0, w_width*2+mez, vyska_viko,0);
  bok_kratky(v7+7*w_width, w_width*2+mez, vyska_viko,w_width*2+mez);

  bok_dlouhy(0,w_width*2+mez,vyska_viko,0);
  bok_dlouhy(hloubka+w_width,w_width*2+mez,vyska_viko,w_width*2+mez);
}



//celek();
translate([-w_width-mez/2, -w_width-mez/2, +30]) color("red") viko();
