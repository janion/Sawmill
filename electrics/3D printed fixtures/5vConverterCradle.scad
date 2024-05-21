baseThickness = 6.0;
bezelWidth = 4.0;
bezelHeight = 4.0;

boardWidth = 20.7;
boardLength = 31.0;

cableTieWidth = 3.0;
cableTieCentreOffset = 0.0;

screwRadius = 3.5 / 2;
screwTabRadius = 8 / 2;


echo(str("Screw separation: ", boardLength + 2 * (bezelHeight + screwTabRadius)));


// Board cradle
difference() {
  union() {
    // Main body
    translate([-(boardWidth / 2 + bezelWidth), -(boardLength / 2 + bezelWidth), 0]) {
      cube([boardWidth + bezelWidth * 2, boardLength + bezelWidth * 2, baseThickness + bezelHeight]);
    }
    
    // Discorectangle for tab bodies
    hull() {
      translate([0, boardLength / 2 + bezelHeight + screwTabRadius, 0]) {
        cylinder(baseThickness, screwTabRadius, screwTabRadius, $fn = 50);
      }
      translate([0, -(boardLength / 2 + bezelHeight + screwTabRadius), 0]) {
        cylinder(baseThickness, screwTabRadius, screwTabRadius, $fn = 50);
      }
    }
  }
  
  // Board cutout
  translate([-boardWidth / 2, -boardLength / 2, baseThickness]) {
    cube([boardWidth, boardLength, bezelHeight]);
  }
  
  // Cable tie hole
  translate([0, cableTieCentreOffset, baseThickness / 2]) {
    rotate([0, 90, 0]) {
      cylinder(boardWidth + bezelWidth * 2, cableTieWidth / 2, cableTieWidth / 2, center = true, $fn = 25);
    }
  }
  
  // Tab screw holes for tapping
  translate([0, boardLength / 2 + bezelHeight + screwTabRadius, 0]) {
    cylinder(baseThickness, screwRadius, screwRadius, $fn = 50);
  }
  translate([0, -(boardLength / 2 + bezelHeight + screwTabRadius), 0]) {
    cylinder(baseThickness, screwRadius, screwRadius, $fn = 50);
  }
}
