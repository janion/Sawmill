baseThickness = 4.0;
bezelWidth = 4.0;
bezelHeight = 4.0;

boardWidth = 41.5;
boardLength = 39.0;

cableTieWidth = 3.5;
cableTieHeight = 2.0;
cableTieCentreOffset = 0.0;

screwRadius = 3.5 / 2;
screwTabRadius = 8 / 2;

screwSeparation = 47.0;

// Board cradle
difference() {
  // Main body
  translate([-(boardWidth / 2 + bezelWidth), -(boardLength / 2 + bezelWidth), 0]) {
    cube([boardWidth + bezelWidth * 2, boardLength + bezelWidth * 2, baseThickness + bezelHeight]);
  }
  
  // Cable tie hole
  translate([-(boardWidth / 2 + bezelWidth), cableTieCentreOffset - cableTieWidth / 2, 0]) {
    cube([boardWidth + bezelWidth * 2, cableTieWidth, cableTieHeight]);
  }
  
  // Board cutout
  translate([-boardWidth / 2, -boardLength / 2, baseThickness]) {
    cube([boardWidth, boardLength, bezelHeight]);
  }
}

// Right ange support
translate([0, boardLength / 2 + bezelWidth, screwTabRadius + baseThickness + bezelHeight])
rotate([90, 0, 0])
difference() {
  union() {
    // Discorectangle for tab bodies
    hull() {
      translate([screwSeparation / 2, 0, 0]) {
        cylinder(baseThickness, screwTabRadius, screwTabRadius, $fn = 50);
      }
      translate([-screwSeparation / 2, 0, 0]) {
        cylinder(baseThickness, screwTabRadius, screwTabRadius, $fn = 50);
      }
      translate([0, -(bezelWidth + 3 * screwTabRadius), 0]) {
        cylinder(baseThickness, screwTabRadius, screwTabRadius, $fn = 50);
      }
    }
  }
  
  // Screw holes for tapping
  translate([screwSeparation / 2, 0, 0]) {
    cylinder(baseThickness, screwRadius, screwRadius, $fn = 25);
  }
  translate([-screwSeparation / 2, 0, 0]) {
    cylinder(baseThickness, screwRadius, screwRadius, $fn = 25);
  }
  translate([0, -(bezelWidth + 3 * screwTabRadius), 0]) {
    cylinder(baseThickness, screwRadius, screwRadius, $fn = 25);
  }
}
