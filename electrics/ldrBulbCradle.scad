bulbFixtureBaseRadius = 30.0 / 2;
bulbFixtureBaseDepth = 5.0;
bulbFixtureStemRadius = 14.5 / 2;
bulbFixtureStemDepth = 11.5;

bulbFixtureContactScrewHeadRadius = 6.0 / 2;
bulbFixtureContactScrewHeadDepth = 4.0 / 2;
bulbFixtureContactScrewHeadSeparation = 21.5;

bulbFixtuireMountingHoleRadius = 2.5 / 2;
bulbFixtuireMountingHoleSeparation = 21.5;

bulbHeight = 14.0;
bulbRadius = 11.5 / 2;

ldrDepth = 1.0;
ldrRadius = 6.0 / 2;
ldrLegSeparation = 4.0;
ldrLegRadius = 0.5 / 2;

bulbLdrSeparation = 4.0;

wallWidthOffset = 5.0;

wallNotchWidth = 1.0;
wallNotchDepth = 1.5;
wallNotchWidthClearance = 0.2;
wallNotchDepthClearance = 0.2;

lidNotchDepth = 1.0;
lidNotchClearance = 0.2;
lidScrewRadius = 2.5 / 2;
lidScrewLength = 10.0;
lidScrewClearanceRadius = 3.5 / 2;
lidScrewPostRadius = 5.0 / 2;

circuitryPocketDepth = 8.0;
circuitryPocketWireHoleRadius = 4.0 / 2;

wallThickness = 3.5;


cavityWidth = bulbFixtureBaseRadius * 2 + (wallWidthOffset + wallNotchDepth + wallNotchDepthClearance) * 2;
cavityLength = bulbFixtureStemDepth + bulbHeight + ldrDepth + bulbLdrSeparation - wallThickness;


//translate([0, -(cavityLength / 2 + wallThickness), cavityWidth / 2 + wallThickness]) {
//  rotate([-90, 0, 0]) {
//    translate([0, 0, -bulbFixtureBaseDepth]) {
//      BulbFixture(true);
//    }
//  }
//}


difference() {
  union() {
    Chassis();
    CircuitryPocket();
    BulbWall();
    LdrWall();
    Lid();
  }
  
//  translate([0, -50, 0]) {
//    cube([100, 100, 100]);
//  }
}

module CircuitryPocket() {
  translate([cavityWidth / 2 + wallThickness, -(cavityLength / 2 + wallThickness), 0]) {
    difference() {
      // Body
      cube([circuitryPocketDepth + wallThickness, cavityLength + 2 * wallThickness, cavityWidth + wallThickness]);
      
      // Circuity cutout
      translate([0, wallThickness, wallThickness]) {
        cube([circuitryPocketDepth, cavityLength, cavityWidth]);
      }
      
      // Wire hole
      translate([circuitryPocketDepth / 2, 0, wallThickness + circuitryPocketWireHoleRadius]) {
        rotate([-90, 0, 0]) {
          #cylinder(wallThickness, circuitryPocketWireHoleRadius, circuitryPocketWireHoleRadius, $fn = 25);
        }
      }
    }
  }
}


module Lid() {
  translate([0, 0, cavityWidth + wallThickness + lidNotchClearance]) {
    difference() {
      union() {
        // Main plate
        translate([-(cavityWidth / 2 + wallThickness), -(cavityLength / 2 + wallThickness), 0]) {
          cube([cavityWidth + wallThickness * 2, cavityLength + wallThickness * 2, wallThickness]);
        }
        // Notch tab
        translate([-(cavityWidth / 2 - lidNotchClearance), -(cavityLength / 2 - lidNotchClearance), -lidNotchDepth]) {
          cube([cavityWidth - lidNotchClearance * 2, cavityLength - lidNotchClearance * 2, wallThickness]);
        }
      }
      
      // Lid screw holes
      for (x = [-1, 1]) {
        translate([x * (cavityWidth / 2 - lidScrewClearanceRadius), 0, -lidNotchDepth]) {
          cylinder(wallThickness + lidNotchDepth, lidScrewClearanceRadius, lidScrewClearanceRadius, $fn = 25);
        }
      }
    }
  }
}

module LdrWall() {
  translate([-(cavityWidth / 2 - wallNotchDepthClearance), cavityLength / 2, wallThickness + wallNotchDepthClearance]) {
    difference() {
      union() {
        // Main wall
        cube([cavityWidth - wallNotchDepthClearance * 2, wallThickness, cavityWidth - wallNotchDepthClearance]);
        
        // Notch tab
        translate([-(wallNotchDepth + wallNotchDepthClearance), (wallThickness - wallNotchWidth) / 2, -wallNotchDepth]) {
          cube([cavityWidth + 2 * wallNotchDepth, wallNotchWidth, cavityWidth + wallNotchDepth - wallNotchDepthClearance]);
        }
      }
      
      // LDR leg holes
      translate([cavityWidth / 2 - wallNotchDepthClearance, 0, (cavityWidth - wallNotchDepthClearance) / 2]) {
        rotate([-90, 0, 0]) {
          for (i = [-0.5, 0.5]) {
            translate([0, i * ldrLegSeparation, 0]) {
              cylinder(wallThickness, ldrLegRadius, ldrLegRadius, $fn=20);
            }
          }
        }
      }
    }
  }
}

module BulbWall() {
  translate([0, -(cavityLength / 2 + wallThickness), wallThickness + wallNotchDepthClearance]) {
    difference() {
      translate([-(cavityWidth / 2 - wallNotchDepthClearance), 0, 0]) {
        union() {
          // Main wall
          cube([cavityWidth - wallNotchDepthClearance * 2, wallThickness, cavityWidth - wallNotchDepthClearance]);
          
          // Notch tab
          translate([-(wallNotchDepth + wallNotchDepthClearance), (wallThickness - wallNotchWidth) / 2, -wallNotchDepth]) {
            cube([cavityWidth + 2 * wallNotchDepth, wallNotchWidth, cavityWidth + wallNotchDepth - wallNotchDepthClearance]);
          }
        }
      }
      // Bulb fixture hole
      rotate([-90, 0, 0]) {
        translate([0, -(cavityWidth / 2 - wallNotchDepthClearance), 0]) {
          cylinder(wallThickness, bulbFixtureStemRadius, bulbFixtureStemRadius, $fn = 25);
        }
      }
      // Contact screw head cutouts
      translate([0, 0, cavityWidth / 2 - wallNotchDepthClearance]) {
        rotate([-90, 0, 0]) {
          hull() {
            for (i = [-1, 1]) {
              translate([i * bulbFixtureContactScrewHeadSeparation / 2, 0, 0]) {
                cylinder(bulbFixtureContactScrewHeadDepth, bulbFixtureContactScrewHeadRadius, bulbFixtureContactScrewHeadRadius, $fn = 50);
              }
            }
          }
        }
      }
      // Mounting screw holes
      translate([0, 0, cavityWidth / 2 - wallNotchDepthClearance]) {
        rotate([-90, 0, 0]) {
          for (i = [-1, 1]) {
            translate([0, i * bulbFixtuireMountingHoleSeparation / 2, 0]) {
              cylinder(wallThickness, bulbFixtuireMountingHoleRadius, bulbFixtuireMountingHoleRadius, $fn = 25);
            }
          }
        }
      }
    }
  }
}

module Chassis() {
  difference() {
    // Main body
    translate([-(cavityWidth / 2 + wallThickness), -(cavityLength / 2 + wallThickness), 0]) {
      cube([cavityWidth + 2 * wallThickness, cavityLength + 2 * wallThickness, cavityWidth + wallThickness]);
    }
    
    // Cavity cutout
    translate([-cavityWidth / 2, -(cavityLength / 2 + wallThickness), wallThickness]) {
      cube([cavityWidth, cavityLength + 2 * wallThickness, cavityWidth]);
    }
    
    // Bulb wall notch
    translate([-(cavityWidth / 2 + wallNotchDepth + wallNotchDepthClearance), -((cavityLength + wallThickness) / 2 + wallNotchWidth / 2 + wallNotchWidthClearance), wallThickness - wallNotchDepth]) {
      cube([cavityWidth + 2 * (wallNotchDepth + wallNotchDepthClearance), wallNotchWidth + 2 * wallNotchWidthClearance, cavityWidth + wallNotchDepth]);
    }
    
    // LDR wall notch
    translate([-(cavityWidth / 2 + wallNotchDepth + wallNotchDepthClearance), (cavityLength + wallThickness) / 2 - (wallNotchWidth / 2 + wallNotchWidthClearance), wallThickness - wallNotchDepth]) {
      cube([cavityWidth + 2 * (wallNotchDepth + wallNotchDepthClearance), wallNotchWidth + 2 * wallNotchWidthClearance, cavityWidth + wallNotchDepth]);
    }
  }
  
  // Lid screw posts
  for (x = [-1, 1]) {
    translate([x * (cavityWidth / 2 - lidScrewClearanceRadius), 0, wallThickness]) {
      difference() {
        cylinder(cavityWidth - lidNotchDepth, lidScrewPostRadius, lidScrewPostRadius, $fn = 25);
        translate([0, 0, cavityWidth - lidScrewLength]) {
          cylinder(lidScrewLength, lidScrewRadius, lidScrewRadius, $fn = 25);
        }
      }
    }
  }
}

module BulbFixture(includeBulb = false) {
  // Base
  cylinder(bulbFixtureBaseDepth, bulbFixtureBaseRadius, bulbFixtureBaseRadius, $fn = 50);
  // Stem
  cylinder(bulbFixtureBaseDepth + bulbFixtureStemDepth, bulbFixtureStemRadius, bulbFixtureStemRadius, $fn = 50);
  // Contact screw heads
  for (theta = [0, 180]) {
    rotate([0, 0, theta]) {
      translate([bulbFixtureContactScrewHeadSeparation / 2, 0, bulbFixtureBaseDepth]) {
        cylinder(bulbFixtureContactScrewHeadDepth, bulbFixtureContactScrewHeadRadius, bulbFixtureContactScrewHeadRadius, $fn = 50);
      }
    }
  }
  // Bulb
  if (includeBulb) {
    translate([0, 0, bulbFixtureBaseDepth + bulbFixtureStemDepth + bulbHeight - bulbRadius]) {
      sphere(bulbRadius, $fn = 25);
    }
  }
}
