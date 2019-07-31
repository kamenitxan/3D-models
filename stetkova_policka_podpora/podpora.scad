
module podpora() {
   triangle_points =[
   [0,0],   [20, 0],[50,100],[0, 100],
   [5,5],  [12,5],[42, 95],[10,95]
   ];
   triangle_paths =[[0,1,2,3],[4,5,6,7]];
   polygon(triangle_points,triangle_paths);

}


linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
  podpora()
;
