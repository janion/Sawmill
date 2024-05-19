displayLength = 50.7;
displayHeight = 19.4;
displayDepth = 8.0;

boardLength = 66.7;
boardHeight = 27.3;

bezelWidth = 10.0;
bezelRevealDepth = 1.0;
bezelFlatWidth = 2.0;
bezelFlatDepth = 4.0;

screwRadius = 2.5 / 2;
screwLength = 4.0;
screwLengthSeparation = 60.0;
screwHeightSeparation = 21.5;
screwLengthOffset = 1.5;
screwHeightOffset = 0.0;

mountThickness = 3.0;


bezelLength = displayLength + bezelWidth * 2;
bezelHeight = displayHeight + bezelWidth * 2;
bezelTopLength = bezelLength - 2 * (bezelWidth - bezelFlatWidth);
bezelTopHeight = bezelHeight - 2 * (bezelWidth - bezelFlatWidth);
bezelDepth = displayDepth + bezelRevealDepth - mountThickness;


difference() {
  // Main bezel body
  hull() {
    translate([-bezelLength / 2, -bezelHeight / 2, 0]) {
      cube([bezelLength, bezelHeight, bezelFlatDepth]);
    }
    translate([-bezelTopLength / 2, -bezelTopHeight / 2, 0]) {
      cube([bezelTopLength, bezelTopHeight, bezelDepth]);
    }
  }
  
  // Display cutout
  translate([-displayLength / 2, -displayHeight / 2, 0]) {
    cube([displayLength, displayHeight, bezelDepth]);
  }
  
  // Screw holes
  for (x = [-0.5, 0.5]) {
    for (y = [-0.5, 0.5]) {
      translate([screwLengthOffset + x * screwLengthSeparation, screwHeightOffset + y * screwHeightSeparation, 0]) {
        cylinder(screwLength, screwRadius, screwRadius, $fn = 25);
      }
    }
  }
}
