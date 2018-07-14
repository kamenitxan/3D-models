
import("DartHolder.stl");

font = "Liberation Sans";
letter_size = 11;
letter_height = 1;


translate([0,11.5,95]) rotate([-90, 0, 0]) {
  linear_extrude(1) text("Mikeintosh", size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
}
