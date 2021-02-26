
module podpora() {
   triangle_points =[
   [0,0],   [12, 0],[80,95],[0, 95],
   [5,5],  [8,5],[60, 87],[10,87]
   ];
   triangle_paths =[[0,1,2,3],[4,5,6,7]];
   polygon(triangle_points,triangle_paths);

}


linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
  podpora()
;
