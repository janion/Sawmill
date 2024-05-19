boardWidth = 39.5;
boardLength = 51.5;

baseThickness = 1.0;

bezelWidth = 4.0;
bezelHeight = 3.0;

holeSeparationX = 33.5;
holeSeparationY = 45.5;
holeRadius = 4.0 / 2;


cradleWidth = boardWidth + 2 * bezelWidth;
cradleLength = boardLength + 2 * bezelWidth;


difference() {
  // Main body
  translate([-cradleWidth / 2, -cradleLength / 2, 0]) {
    cube([cradleWidth, cradleLength, baseThickness + bezelHeight]);
  }
  
  // Board cutout
  translate([-boardWidth / 2, -boardLength / 2, baseThickness]) {
    cube([boardWidth, boardLength, bezelHeight]);
  }
  
  // Holes
  for (x = [-0.5, 0.5]) {
    for (y = [-0.5, 0.5]) {
      translate([x * holeSeparationX, y * holeSeparationY, 0]) {
        cylinder(baseThickness, holeRadius, holeRadius, $fn = 25);
      }
    }
  }
}