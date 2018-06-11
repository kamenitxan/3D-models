width = 18;
height = 65;
depth = 10;


module base() {
  polygon(points=[[0,0], [width/2,0], [width/2,-15],[width,0], [width/2, height], [0, height]]);
  mirror([1, 0, 0]) {
    polygon(points=[[0,0], [width/2,0], [width/2,-15],[width,0], [width/2, height], [0, height]]);
  }
}

linear_extrude(height=depth, center=true, convexity=10, twist=0) {
  base();
}
