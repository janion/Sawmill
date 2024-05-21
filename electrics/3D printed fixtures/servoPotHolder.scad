potBodyRadius = 28.0 / 2;
potThreadRadius = 10 / 2;
potThreadLength = 10.0;
potShaftRadius = 6.5 / 2; //6.0 / 2;
potShaftLength = 12.0;

servoBodyWidth = 11.8;
servoBodyLength = 23.8;
servoBodyDepth = 3.6;
servoBossDepth = 5.1;
servoShaftRadius = 4.15 / 2; //4.05 / 2;
servoShaftLength = 3.0;
servoTabLength = 4.5;
servoTabHoleOffset = 1.0;
servoTabHoleRadius = 1.5 / 2;

servoChassisSupportBraceWidth = 8.0;

chassisWallThickness = 4.0;
chassisBezelWidth = 6.0;

couplerWallThickness = 5.0;
couplerGrubScrewRadius = 2.5 / 2;


chassisTabRadius = 5;
chassisTabHoleRadius = 3.0 / 2;
chassisMinWidthBetweenWalls = 36.0;


chassisLength = potThreadLength + potShaftLength + couplerWallThickness + servoBodyDepth + servoBossDepth + servoShaftLength;
chassisWidth = max(chassisMinWidthBetweenWalls + 2 * chassisWallThickness, potBodyRadius * 2, servoBodyWidth + 2 * chassisBezelWidth);

axisHeight = max(potBodyRadius, servoBodyWidth / 2 + servoTabLength);

couplerLength = potShaftLength + couplerWallThickness + servoShaftLength;
couplerRadius = max(potShaftRadius, servoShaftRadius) + couplerWallThickness;


//CouplerTest();

//Coupler();
Chassis();

module CouplerTest() {
  tests = [ for (i = [-2:2]) i ];
  difference() {
    translate([0, -couplerRadius, -1]) {
      cube([couplerRadius * (1 + len(tests)), couplerRadius * 2, 1 + servoShaftLength]);
    }
  
    for (i = tests) {
      translate([couplerRadius * (1 + i - min(tests)), 0, 0]) {
        cylinder(servoShaftLength + 0.001, servoShaftRadius + i * 0.025, servoShaftRadius + i * 0.025, $fn = 50);
      }
    }
    
    cylinder(servoShaftLength + 0.001, 1, 1, $fn=20);
  }
}

module Coupler() {
  difference() {
    cylinder(couplerLength, couplerRadius, couplerRadius, $fn = 50);
    
    // Pot shaft
    cylinder(potShaftLength, potShaftRadius, potShaftRadius, $fn = 50);
    
    // Servo shaft
    translate([0, 0, potShaftLength + couplerWallThickness]) {
      cylinder(servoShaftLength, servoShaftRadius, servoShaftRadius, $fn = 50);
    }
    
    // Pot grub screw
    translate([0, 0, potShaftLength / 2])
    rotate([90, 0, 0])
    cylinder(couplerRadius, couplerGrubScrewRadius, couplerGrubScrewRadius, $fn = 25);
  }
}

module Chassis() {
  // Pot wall
  difference() {
    translate([-chassisWidth / 2, 0, 0]) {
      cube([chassisWidth, chassisWallThickness, axisHeight + potBodyRadius]);
    }
    
    // Pot thread
    translate([0, 0, axisHeight]) {
      rotate([-90, 0, 0]) {
        translate([0, 0, chassisWallThickness / 2]) {
          cylinder(chassisWallThickness + 0.01, potThreadRadius, potThreadRadius, $fn = 50, center = true);
        }
      }
    }
  }
  
  servoWallHeight = axisHeight + servoBodyLength + servoTabLength + chassisWallThickness - servoBodyWidth / 2;

  // Servo wall
  translate([0, chassisLength - chassisWallThickness, 0]) {
    difference() {
      union() {
        translate([-chassisWidth / 2, 0, 0]) {
          cube([chassisWidth, chassisWallThickness, servoWallHeight]);
        }
        
        // Supports
        translate([-chassisWidth / 2, chassisWallThickness, -chassisWallThickness]) {
          cube([chassisWallThickness, servoChassisSupportBraceWidth, servoWallHeight + chassisWallThickness]);
        }
        translate([chassisWidth / 2 - chassisWallThickness, chassisWallThickness, -chassisWallThickness]) {
          cube([chassisWallThickness, servoChassisSupportBraceWidth, servoWallHeight + chassisWallThickness]);
        }
      }
      
      // Servo body
      translate([-servoBodyWidth / 2, -0.01, axisHeight - servoBodyWidth / 2]) {
        cube([servoBodyWidth, chassisWallThickness + 0.02, servoBodyLength]);
      }
      // Servo tab holes
      translate([0, 0, axisHeight - (servoBodyWidth / 2 + servoTabHoleRadius + servoTabHoleOffset)]) {
        rotate([-90, 0, 0]) {
          translate([0, 0, chassisWallThickness / 2]) {
            cylinder(chassisWallThickness + 0.02, servoTabHoleRadius, servoTabHoleRadius, $fn = 20, center = true);
          }
        }
      }
      translate([0, 0, axisHeight + servoBodyLength + servoTabHoleRadius + servoTabHoleOffset - servoBodyWidth / 2]) {
        rotate([-90, 0, 0]) {
          translate([0, 0, chassisWallThickness / 2]) {
            cylinder(chassisWallThickness + 0.02, servoTabHoleRadius, servoTabHoleRadius, $fn = 20, center = true);
          }
        }
      }
    }
  }

  // Floor
  translate([-chassisWidth / 2, 0, -chassisWallThickness]) {
    cube([chassisWidth, chassisLength, chassisWallThickness]);
  }
  
  // Tabs
  translate([0, chassisTabRadius, 0]) {
    ChassisTabsBar();
  }
  translate([0, chassisLength - chassisTabRadius, 0]) {
    ChassisTabsBar();
  }

  // Side walls
  translate([-chassisWidth / 2, 0, 0]) {
    cube([chassisWallThickness, chassisLength, axisHeight]);
  }
  translate([chassisWidth / 2 - chassisWallThickness, 0, 0]) {
    cube([chassisWallThickness, chassisLength, axisHeight]);
  }
}

module ChassisTabsBar() {
  translate([0, 0, -chassisWallThickness]) {
    difference() {
      hull() {
        translate([-(chassisWidth / 2 + chassisTabRadius), 0, 0]) {
          cylinder(chassisWallThickness, chassisTabRadius, chassisTabRadius, $fn = 50);
        }
        translate([chassisWidth / 2 + chassisTabRadius, 0, 0]) {
          cylinder(chassisWallThickness, chassisTabRadius, chassisTabRadius, $fn = 50);
        }
      }
      
      translate([-(chassisWidth / 2 + chassisTabRadius), 0, 0]) {
        cylinder(chassisWallThickness, chassisTabHoleRadius, chassisTabHoleRadius, $fn = 50);
      }
      translate([chassisWidth / 2 + chassisTabRadius, 0, 0]) {
        cylinder(chassisWallThickness, chassisTabHoleRadius, chassisTabHoleRadius, $fn = 50);
      }
    }
  }
}
