CAMBER = true;

wheelRadius = 450 / 2;
wheelThickness = 30;
wheelCamberRadius = 100;
wheelHeadClearance = 10;

idlerWheelSleeveThickness = 12;
idlerWheelSleeveLength = 120;
idlerWheelSleeveExtensionLength = 260;

//////////////////////////

tensionerNutWidth = 16;
tensionerNutRadius = 32 / 2;
tensionerNutHoleRadius = 20 / 2;

//////////////////////////

drivePulleyRadius = 350 / 2;
drivePulleyThickness = 36;

//////////////////////////

frameStockWidth = 40;
frameStockDepth = 40;
frameStockThickness = 2;
frameStockRadius = 4;

frameHeight = 980;
frameOuterWidth = 780;

frameFootLength = 500;
frameFootOffset = 180;
frameFootAttachmentThickness = 5;
frameFootAttachmentWidth = 30;

//////////////////////////

headBeamWidth = 80;
headBeamLength = 1490;
headBeamRadius = 10;
headBeamThickness = 5;

//////////////////////////

guideRailDepth = 50;
guideRailWidth = 50;
guideRailThickness = 4;
guideRailLength = 300;
guideRailRadius = 5;

//////////////////////////

rollerGuideWheelRadius = 60 / 2;
rollerGuideFlangeRadius = 74 / 2;
rollerGuideWheelDepth = 20;
rollerGuideFlangeDepth = 6;
rollerGuideClearance = 10;

rollerGuideAdjusterStockWidth = 16;
rollerGuideAdjusterLength = 80;
rollerGuideAdjusterGap = 28;
rollerGuideAdjusterShaftLength = 90;
rollerGuideAdjusterBoltInset = 15;
rollerGuideAdjusterBoltLength = 30;

rollerGuideLateralPlateWidth = 30;
rollerGuideLateralPlateThickness = 3;
rollerGuideLateralPlateOffset = 20;

rollerGuideAdjusterPinRadius = 6 / 2;
rollerGuideAdjusterBoltRadius = 10 / 2;

rollerGuideAdjusterHoleSeparation = 3;

rollerGuideAdjusterPlateLength = rollerGuideAdjusterLength;
rollerGuideAdjusterPlateWidth = 60;
rollerGuideAdjusterPlateThickness = 3;

rollerGuideArmWidth = 30;
rollerGuideArmRadius = 3;
rollerGuideArmThickness = 1.5;
rollerGuideArmAngle = 10;
rollerGuideArmAngledLength = 80;
rollerGuideArmStandoffLength = 6;
rollerGuideArmStandoffRadius = 8;

//////////////////////////

tensionerNutBracePlateThickness = 3;
tensionerNutBracePlateHeight = tensionerNutRadius * 1.5;
tensionerNutSupportPlateThickness = 2;
tensionerNutSupportPlateOverlap = 10;

//////////////////////////

rollerRadius = 30 / 2;
rollerWidth = 8;
rollerGrooveWidth = 6;
rollerGrooveDepth = 4;
rollerOffset = 50;
rollerOverhang = -10;

//////////////////////////

axleLength = 190;
axleRadius = 25 / 2;
axleOffsetX = 100;

axleTrackingSupportWidth = 60;
axleTrackingSupportDepth = 40;
axleTrackingSupportLength = 60;
axleTrackingSupportOverhang = 30;
axleTrackingSupportRadius = 5;
axleTrackingSupportThickness = 4;
axleTrackingSupportBoltLengthShort = 30;
axleTrackingSupportBoltLengthLong = 40;
axleTrackingSupportBoltOffset = 10;

axleSupportWidth = axleTrackingSupportWidth;
axleSupportDepth = axleTrackingSupportDepth;
axleSupportThickness = 12;

//////////////////////////

motorBodyRadius = 83 / 2;
motorBodyLength = 225;
motorPulleyRadius = 50 / 2;
motorPulleyLength = 50;
motorOffsetX = wheelRadius + 100;

driveBeltWidth = 10;
driveBeltDepth = 8;

//////////////////////////

//bedRailWidth = 25;
//bedRailThickness = 2.5;
//bedRailLength = 3000;
//bedRailDepth = 50;
//bedRailRadius = 3;
//bedCrossBarCount = 10;
//
//bedBottomSupportWidth = 25;
//bedBottomSupportLength = 50;
//bedBottomSupportDepth = 5;
//
//bedSideSupportWidth = 25;
//bedSideSupportLength = 50;
//bedSideSupportThickness = 3;
//
//bedTrackWidth = 25;
//bedTrackThickness = 3;

bedRailWidth = 40;
bedRailThickness = 2;
bedRailLength = 3000;
bedRailDepth = 40;
bedRailRadius = 3;
bedCrossBarCount = 10;

bedBottomSupportWidth = 40;
bedBottomSupportLength = 80;
bedBottomSupportDepth = 8;

bedSideSupportWidth = 30;
bedSideSupportLength = 30;
bedSideSupportThickness = 5;

bedTrackWidth = 20;
bedTrackThickness = 3;

//////////////////////////

bladeWidth = 25;
bladeThickness = 1;
bladeHeight = 530 - 250;//52;

// From -1250 to 1300
carriageOffsetFromCentre = -68;

cuttingHeight = 530;
cuttingWidth = 500;
cuttingLength = 2500;

//////////////////////////
// Calculated Variables //
//////////////////////////

//axleSpacing = frameOuterWidth + axleOffsetX * 2;
axleSpacing = 970;
bladeLength = axleSpacing * 2 + wheelRadius * PI * 2;

frameUprightLength = frameHeight;
frameCrossbarLength = frameOuterWidth - 2 * frameStockDepth;
frameGussetLength = sqrt(2 * frameFootOffset * frameFootOffset);

rollerGuideLateralPlateLength = rollerGuideAdjusterGap;

rollerGuideAdjusterPinOffset = rollerGuideAdjusterLength / 2 - (rollerGuideAdjusterPinRadius + rollerGuideAdjusterHoleSeparation);
rollerGuideAdjusterPinOffsets = [-rollerGuideAdjusterPinOffset, 0, rollerGuideAdjusterPinOffset];

rollerGuideAdjusterBoltOffset = rollerGuideAdjusterPinOffset - (rollerGuideAdjusterPinRadius + rollerGuideAdjusterBoltRadius + rollerGuideAdjusterHoleSeparation);
rollerGuideAdjusterBoltOffsets = [-rollerGuideAdjusterBoltOffset, rollerGuideAdjusterBoltOffset];

rollerGuideArmLength = wheelRadius + axleTrackingSupportDepth / 2 + idlerWheelSleeveThickness;
rollerGuideArmOffset = rollerGuideFlangeDepth - (rollerGuideArmWidth + wheelHeadClearance + drivePulleyThickness + (wheelThickness - bladeWidth) / 2);
rollerGuideArmScewMatrix =
      [ [ 1 , 0 , 0 , 0 ],
        [ 0 , 1 , -tan(rollerGuideArmAngle), 0 ],
        [ 0 , 0 , 1 , 0 ],
        [ 0 , 0 , 0 , 1 ] ];

bedWidth = frameOuterWidth - (2 * frameStockDepth + rollerWidth);
bedCrossBarLength = bedWidth - 2 * bedRailWidth;
totalBedSteelLength = bedRailLength * 2 + bedCrossBarLength * bedCrossBarCount;

P1X = (7 + (rollerGuideAdjusterGap + rollerGuideAdjusterStockWidth * 1.5) * sin(rollerGuideArmAngle)) * tan(rollerGuideArmAngle) + rollerGuideAdjusterStockWidth * cos(rollerGuideArmAngle) / 2;
P1Y = 7 + (rollerGuideAdjusterGap + rollerGuideAdjusterStockWidth) * sin(rollerGuideArmAngle);
P2X = P1X + (rollerGuideAdjusterGap + rollerGuideAdjusterStockWidth) * cos(rollerGuideArmAngle);
P2Y = P1Y - (rollerGuideAdjusterGap + rollerGuideAdjusterStockWidth) * sin(rollerGuideArmAngle);

///////////////
// Printouts //
///////////////

echo();
echo();
echo(str("Axle Spacing: ", axleSpacing));
echo(str("Blade Length: ", bladeLength, "mm (", bladeLength / 25.4, "\")"));
echo(str("Head Beam Overhang Past Wheels: ", (headBeamLength - (axleSpacing + wheelRadius * 2)) / 2, "mm"));
echo(str("Steel:"));
echo(str("Frame Post Length: ", frameUprightLength, "mm"));
echo(str("Frame Crossbar Length: ", frameCrossbarLength, "mm"));
echo(str("Frame Foot Length: ", frameFootLength, "mm"));
echo(str("Frame Gusset Length: ", frameGussetLength, "mm"));
echo();
echo(str("Head Guide Rail Length: ", guideRailLength, "mm"));
echo(str("Head Guide Rail Depth: ", guideRailDepth, "mm"));
echo(str("Head Guide Rail Width: ", guideRailWidth, "mm"));
echo();
echo("Blade Guide Arm Pin Coordinates:");
echo(str("P1 = (", P1X,", ", P1Y, ")"));
echo(str("P2 = (", P2X,", ", P2Y, ")"));
echo(str("Distance between points: ", sqrt(((P2X - P1X) * (P2X - P1X)) + ((P2Y - P1Y) * (P2Y - P1Y)))));
echo();
echo(str("Blade Guide Bar Pin Coordinates: ", rollerGuideAdjusterPinOffsets));
echo(str("Blade Guide Bar Bolt Coordinates: ", rollerGuideAdjusterBoltOffsets));
echo();
echo(str("Gap Between Bunks:", (bedRailLength - (bedRailWidth * bedCrossBarCount)) / (bedCrossBarCount - 1)));
echo();
echo("Steel for bed");
echo(str("Cross Bar Length: ", bedCrossBarLength, "mm"));
echo(str("Total Length: ", totalBedSteelLength, "mm"));
echo(str("Total Mass: ", totalBedSteelLength * 2.41 / 1000, "kg (Not including brackets or feet)"));
echo();
echo();

////////////////////
// Rendering Code //
////////////////////

Gantry();
Bed();

//CuttingVolume();

/////////////
// Modules //
/////////////

module CuttingVolume() {
//   translate([-cuttingSize / 2, 0, 0]) {
//      cube([cuttingSize, cuttingSize, cuttingSize]);
//   }
   translate([0, -cuttingLength / 2, cuttingHeight / 2]) {
      scale([cuttingWidth, 1, cuttingHeight]) {
         rotate([-90, 0, 0]) {
            cylinder(cuttingLength, 1 / 2, 1 / 2, $fn = 100);
         }
      }
   }
}

module Bed() {
   translate([0, -bedRailLength / 2, rollerGrooveDepth - (bedRailDepth + bedTrackWidth + rollerOverhang)]) {
      // Long bars
      translate([bedCrossBarLength / 2 + bedRailWidth, 0, 0]) {
         rotate([0, 0, 90]) {
            _HollowRoundedCuboid(bedRailLength, bedRailWidth, bedRailDepth, bedRailRadius, bedRailThickness);
         }
         translate([0, 0, bedRailDepth]) {
            rotate([0, -90, 0]) {
               _AngleIron(bedRailLength, bedTrackWidth, bedTrackThickness);
            }
         }
      }
      
      // Tracks
      translate([-bedCrossBarLength / 2, 0, 0]) {
         rotate([0, 0, 90]) {
            _HollowRoundedCuboid(bedRailLength, bedRailWidth, bedRailDepth, bedRailRadius, bedRailThickness);
         }
         translate([-bedRailWidth, 0, bedRailDepth]) {
            _AngleIron(bedRailLength, bedTrackWidth, bedTrackThickness);
         }
      }
      
      // Cross bars
      for (i = [0: bedCrossBarCount - 1]) {
         // Cross bar
         translate([-bedCrossBarLength / 2, i * (bedRailLength - bedRailWidth) / (bedCrossBarCount - 1), 0]) {
            _HollowRoundedCuboid(bedCrossBarLength, bedRailWidth, bedRailDepth, bedRailRadius, bedRailThickness);
         }
         
         // Bottom support braces
         translate([0, i * (bedRailLength - bedRailWidth) / (bedCrossBarCount - 1), -bedBottomSupportDepth]) {
            translate([-bedWidth / 2, 0, 0]) {
               cube([bedBottomSupportLength, bedBottomSupportWidth, bedBottomSupportDepth]);
            }
            translate([bedWidth / 2 - bedBottomSupportLength, 0, 0]) {
               cube([bedBottomSupportLength, bedBottomSupportWidth, bedBottomSupportDepth]);
            }
         }
         
         // Feet
         translate([0, bedRailWidth / 2 + i * (bedRailLength - bedRailWidth) / (bedCrossBarCount - 1), 0]) {
            translate([(bedCrossBarLength + bedRailWidth) / 2, 0, 0]) {
               mirror([0, 0, 1]) {
                  _M16Bolt(80);
               }
            }
            translate([-(bedCrossBarLength + bedRailWidth) / 2, 0, 0]) {
               mirror([0, 0, 1]) {
                  _M16Bolt(80);
               }
            }
         }
         
         // Side support braces
         translate([0, i * (bedRailLength - bedRailWidth) / (bedCrossBarCount - 1), (bedRailDepth - bedSideSupportLength) / 2]) {
            // Rear braces
            if (i != 0) {
               translate([-bedCrossBarLength / 2, 0, 0]) {
                  rotate([90, 0, 0]) {
                     _AngleIron(bedSideSupportLength, bedSideSupportWidth, bedSideSupportThickness);
                  }
               }
               mirror([1, 0, 0]) {
                  translate([-bedCrossBarLength / 2, 0, 0]) {
                     rotate([90, 0, 0]) {
                        _AngleIron(bedSideSupportLength, bedSideSupportWidth, bedSideSupportThickness);
                     }
                  }
               }
            }
            // Front braces
            if (i != bedCrossBarCount - 1) {
               translate([-bedCrossBarLength / 2, bedRailWidth, 0]) {
                  rotate([90, 0, 90]) {
                     _AngleIron(bedSideSupportLength, bedSideSupportWidth, bedSideSupportThickness);
                  }
               }
               mirror([1, 0, 0]) {
                  translate([-bedCrossBarLength / 2, bedRailWidth, 0]) {
                     rotate([90, 0, 90]) {
                        _AngleIron(bedSideSupportLength, bedSideSupportWidth, bedSideSupportThickness);
                     }
                  }
               }
            }
         }
      }
   }
}

module Gantry() {
   translate([0, carriageOffsetFromCentre, 0]) {
      Head();
      Frame();
   }
}

module Frame() {
   // Posts
   translate([0, -(headBeamWidth + frameStockWidth + guideRailThickness), frameStockDepth]) {
      // Left post
      translate([frameStockDepth - frameOuterWidth / 2, 0, 0]) {
         rotate([0, -90, 0]) {
            _HollowRoundedCuboid(frameUprightLength, frameStockWidth, frameStockDepth, frameStockThickness, frameStockRadius);
         }
      }
      // Right post
      translate([frameOuterWidth / 2, 0, 0]) {
         rotate([0, -90, 0]) {
            _HollowRoundedCuboid(frameUprightLength, frameStockWidth, frameStockDepth, frameStockThickness, frameStockRadius);
         }
      }
   }
   
   // Cross bar
   translate([-frameOuterWidth / 2 + frameStockDepth, -(headBeamWidth + frameStockWidth + guideRailThickness), frameHeight + frameStockDepth - frameStockDepth]) {
      _HollowRoundedCuboid(frameCrossbarLength, frameStockWidth, frameStockDepth, frameStockThickness, frameStockRadius);
   }
   
   // Feet
   Foot();
   mirror([1, 0, 0]) Foot();
}

module Foot() {
   // Foot
   translate([0, -(headBeamWidth + frameFootOffset + frameFootAttachmentThickness + guideRailThickness), 0]) {
      translate([frameStockWidth - frameOuterWidth / 2, 0, 0]) {
         rotate([0, 0, 90]) {
            _HollowRoundedCuboid(frameFootLength, frameStockWidth, frameStockDepth, frameStockThickness, frameStockRadius);
         }
      }
   }
   
   // Brace
   translate([-frameOuterWidth / 2, -(headBeamWidth + frameFootOffset + frameFootAttachmentThickness + guideRailThickness), frameStockDepth]) {
      Brace();
   }
   
   // Attachment plate
   translate([-(frameOuterWidth / 2 + frameFootAttachmentThickness), -(headBeamWidth + frameStockWidth + guideRailThickness), frameStockDepth]) {
      rotate([90, 0, 0]) {
         _AngleIron(frameFootOffset - frameStockDepth / 2, frameFootAttachmentWidth, frameFootAttachmentThickness);
      }
   }
   
   // Rollers
   for (y = [-(frameFootOffset + frameFootAttachmentThickness - rollerOffset), frameFootLength - (frameFootOffset + rollerOffset + frameFootAttachmentThickness)]) {
      translate([-(frameOuterWidth / 2 - (frameStockDepth + rollerWidth / 2)), y - (headBeamWidth + guideRailThickness), rollerRadius - rollerOverhang]) {
         Roller();
      }
   }
}

module Roller() {
   rollerWall = (rollerWidth - rollerGrooveWidth) / 2;
   translate([-rollerWidth / 2, 0, 0]) {
      rotate([0, 90, 0]) {
         cylinder(rollerWall, rollerRadius, rollerRadius);
         cylinder(rollerWidth, rollerRadius - rollerGrooveDepth, rollerRadius - rollerGrooveDepth);
         translate([0, 0, rollerWidth - rollerWall]) {
            cylinder(rollerWall, rollerRadius, rollerRadius);
         }
      }
   }
}

module Brace() {
   intersection() {
      rotate([45, 0, 0]) {
         translate([frameStockWidth, 0, -frameStockDepth]) {
            rotate([0, 0, 90]) {
               _HollowRoundedCuboid(frameFootLength, frameStockWidth, frameStockDepth, frameStockThickness, frameStockRadius);
            }
         }
      }
      
      cube([frameStockWidth, frameFootOffset - frameStockDepth, frameFootOffset - frameStockDepth / 2]);
   }
}

module Head() {
   maxAxleSupportWidth = max(axleSupportWidth, axleTrackingSupportWidth);
   translate([0, 0, wheelRadius + bladeThickness + bladeHeight]) {
      translate([0, 0, axleTrackingSupportDepth / 2 + idlerWheelSleeveThickness]) {
         HeadBeam(maxAxleSupportWidth);
      }
      
      // Offset plate for idler sleeve
      translate([-(axleSpacing / 2 + maxAxleSupportWidth / 2), -headBeamWidth, axleTrackingSupportDepth / 2]) {
         cube([maxAxleSupportWidth, headBeamWidth, idlerWheelSleeveThickness]);
      }
      
      // Idler sleeve
      translate([(axleSpacing + idlerWheelSleeveLength - maxAxleSupportWidth) / 2, 0, idlerWheelSleeveThickness + (axleSupportDepth + headBeamWidth) / 2]) {
         IdlerSleeve();
      }
      
      // Axle supports
      for (i = [-1, 1]) {
         translate([i * axleSpacing / 2, 0, 0]) {
            AxleSupport();
            translate([0, -(headBeamWidth + axleTrackingSupportOverhang), 0]) {
               AxleTrackingSupport();
            }
         }
      }
      
      translate([-(axleSpacing / 2 - motorOffsetX),
            -(motorBodyLength + (motorPulleyLength - (wheelHeadClearance + drivePulleyThickness))),
            axleTrackingSupportDepth / 2 + idlerWheelSleeveThickness + headBeamWidth + motorBodyRadius]) {
         Motor();
      }
      
      Wheels();
      Blade();
      DriveBelt();
   }
   RollerGuideAssemblies();
}

module Motor() {
   rotate([-90, 0, ]) {
      cylinder(motorBodyLength, motorBodyRadius, motorBodyRadius);
      translate([0, 0, motorBodyLength]) {
         cylinder(motorPulleyLength, motorPulleyRadius, motorPulleyRadius);
      }
   }
}

module DriveBelt() {
   difference() {
      hull() {
         _DriveBeltMotorPulley(motorPulleyRadius, driveBeltWidth);
         _DriveBeltWheelPulley(drivePulleyRadius, driveBeltWidth);
      }
      hull() {
         _DriveBeltMotorPulley(motorPulleyRadius - driveBeltDepth, driveBeltWidth + 0.01);
         _DriveBeltWheelPulley(drivePulleyRadius - driveBeltDepth, driveBeltWidth + 0.01);
      }
   }
}

module _DriveBeltWheelPulley(radius, width) {
   translate([-axleSpacing / 2, 0, 0]) {
      translate([0, wheelHeadClearance + drivePulleyThickness / 2, 0]) {
         Wheel(width, radius);
      }
   }
}

module _DriveBeltMotorPulley(radius, width) {
   translate([-(axleSpacing / 2 - motorOffsetX),
         wheelHeadClearance + drivePulleyThickness / 2,
         axleTrackingSupportDepth / 2 + idlerWheelSleeveThickness + headBeamWidth + motorBodyRadius]) {
      Wheel(width, radius);
   }
}

module HeadBeam(maxAxleSupportWidth) {
   difference([0, 0, wheelRadius + bladeThickness + bladeHeight]) {
      translate([-headBeamLength / 2, -headBeamWidth, 0]) {
         _HollowRoundedCuboid(headBeamLength, headBeamWidth, headBeamWidth, headBeamRadius, headBeamThickness);
      }
      
      // Tensioner nut slot
      translate([0, -headBeamWidth / 2, -0.1]) {
         rotate([0, 0, 0]) {
            slotWidth = tensionerNutRadius * sqrt(3) + (tensionerNutSupportPlateThickness + 1) * 2;
            hull() {
               translate([frameOuterWidth / 2 + idlerWheelSleeveExtensionLength - tensionerNutRadius, 0, 0]) {
                  cylinder(headBeamThickness + 0.2, slotWidth / 2, slotWidth / 2);
               }
               translate([headBeamLength / 2, 0, 0]) {
                  cylinder(headBeamThickness + 0.2, slotWidth / 2, slotWidth / 2);
               }
            }
         }
      }
   }
   
   HeadGuideRails();
}

module HeadGuideRails() {
   HeadGuideRail();
   mirror([1, 0, 0]) HeadGuideRail();
}

module HeadGuideRail() {
   translate([
         frameOuterWidth / 2 + guideRailWidth - (frameStockDepth + guideRailThickness),
         -(headBeamWidth + guideRailDepth),
         (headBeamWidth - guideRailLength) / 2]) {
      rotate([0, -90, 0]) {
         _HollowRoundedCuboid(guideRailLength, guideRailDepth, guideRailWidth, guideRailRadius, guideRailThickness);
      }
   }
}

module RollerGuideAssemblies() {
   PositionedRollerGuideAssembly();
   mirror([1, 0, 0]) {
      PositionedRollerGuideAssembly();
   }
}


module PositionedRollerGuideAssembly() {
   translate([-(cuttingWidth / 2 + rollerGuideFlangeRadius + rollerGuideClearance),
         wheelHeadClearance + drivePulleyThickness + (wheelThickness - bladeWidth) / 2 - rollerGuideFlangeDepth,
         bladeHeight + rollerGuideWheelRadius + bladeThickness]) {
      RollerGuideAssembly();
      
   }
}

module RollerGuideAssembly() {
   RollerGuideAdjuster();
   RollerGuide();
   RollerGuideArm();
   RollerGuideStandoffs();
}

module RollerGuideArm() {
   translate([-(rollerGuideAdjusterStockWidth / 2 + rollerGuideAdjusterPlateThickness + rollerGuideArmStandoffLength),
         rollerGuideArmOffset,
         -rollerGuideAdjusterPlateWidth / 2]) {
      // Angled section to align with pins
      translate([0, rollerGuideArmAngledLength * tan(rollerGuideArmAngle), 0]) {
         multmatrix(rollerGuideArmScewMatrix) {
            rotate([0, -90, 0]) {
               _HollowRoundedCuboid(rollerGuideArmAngledLength, rollerGuideArmWidth, rollerGuideArmWidth, rollerGuideArmRadius, rollerGuideArmThickness);
            }
         }
      }
     
      // Connection to head beam
      translate([0, 0, rollerGuideArmAngledLength]) {
         rotate([0, -90, 0]) {
            _HollowRoundedCuboid(rollerGuideArmLength - rollerGuideArmAngledLength, rollerGuideArmWidth, rollerGuideArmWidth, rollerGuideArmRadius, rollerGuideArmThickness);
         }
      }
   }
}

module RollerGuideStandoffs() {
   translate([-rollerGuideAdjusterStockWidth / 2, -rollerGuideAdjusterShaftLength, 0]) {
      translate([-(rollerGuideArmStandoffLength + rollerGuideAdjusterPlateThickness), rollerGuideAdjusterLength / 2, 0]) {
         rotate([90, 0, 0]) {
            rotate([0, 90, 0]) {
               for (y = [-1, 1]) {
                  translate([rollerGuideAdjusterPinOffsets[1], y * (rollerGuideAdjusterPlateWidth - rollerGuideAdjusterStockWidth) / 2, 0]) {
                     RollerGuideStandoff();
                  }
               }
            }
         }
      }
   }
}

module RollerGuideStandoff() {
   translate([0, 0, rollerGuideArmStandoffLength / 2]) {
      difference() {
         cylinder(rollerGuideArmStandoffLength, rollerGuideArmStandoffRadius, rollerGuideArmStandoffRadius, $fn=25, center=true);
         cylinder(rollerGuideArmStandoffLength, rollerGuideAdjusterPinRadius, rollerGuideAdjusterPinRadius, $fn=25, center=true);
      }
   }
}

module RollerGuideAdjuster() {
   translate([-rollerGuideAdjusterStockWidth / 2, -rollerGuideAdjusterShaftLength, 0]) {
      // Rails
      for (i = [-1, 1]) {
         translate([rollerGuideAdjusterStockWidth / 2, rollerGuideAdjusterLength / 2, i * (rollerGuideAdjusterGap + rollerGuideAdjusterStockWidth) / 2]) {
            RollerGuideRail();
         }
      }
      
      // Shaft
      translate([0, 0, -rollerGuideAdjusterStockWidth / 2]) {
         cube([rollerGuideAdjusterStockWidth, rollerGuideAdjusterShaftLength, rollerGuideAdjusterStockWidth]);
      }
      
      // Plates
      for (x = [-rollerGuideAdjusterPlateThickness / 2, rollerGuideAdjusterStockWidth + rollerGuideAdjusterPlateThickness / 2]) {
         translate([x, rollerGuideAdjusterLength / 2, 0]) {
            RollerGuidePlate();
         }
      }
      
      // Lateral adjustment plate
      translate([-(rollerGuideLateralPlateThickness + rollerGuideAdjusterPlateThickness),
            -(rollerGuideLateralPlateThickness + rollerGuideLateralPlateOffset),
            rollerGuideLateralPlateLength / 2]) {
         rotate([-90, 0, 0]) {
            _AngleIron(rollerGuideLateralPlateLength, rollerGuideLateralPlateWidth, rollerGuideLateralPlateThickness);
         }
      }
      
      // Tilt and height bolts
      for (y = rollerGuideAdjusterBoltOffsets) {
         translate([rollerGuideAdjusterStockWidth / 2, rollerGuideAdjusterLength / 2 + y, rollerGuideAdjusterStockWidth / 2]) {
            _M10Bolt(rollerGuideAdjusterBoltLength);
         }
         translate([rollerGuideAdjusterStockWidth / 2, rollerGuideAdjusterLength / 2 + y, -rollerGuideAdjusterStockWidth / 2]) {
            mirror([0, 0, 1]) {
               _M10Bolt(rollerGuideAdjusterBoltLength);
            }
         }
      }
      
      // Lateral bolt
      translate([rollerGuideAdjusterStockWidth / 2, 0, 0]) {
         rotate([90, 0, 0]) {
            _M10Bolt(rollerGuideLateralPlateOffset);
         }
      }
   }
}


module RollerGuidePlate() {
   rotate([90, 0, 0]) {
      rotate([0, 90, 0]) {
         difference() {
           cube([rollerGuideAdjusterPlateLength, rollerGuideAdjusterPlateWidth, rollerGuideAdjusterPlateThickness], center = true);
           
           // Reamed holes for pins
           for (y = [-1, 1]) {
               for (offset = rollerGuideAdjusterPinOffsets) {
                   translate([offset, y * (rollerGuideAdjusterPlateWidth - rollerGuideAdjusterStockWidth) / 2, 0]) {
                       cylinder(rollerGuideAdjusterStockWidth, rollerGuideAdjusterPinRadius, rollerGuideAdjusterPinRadius, center = true);
                   }
               }
           }
        }
      }
   }
}

module RollerGuideRail() {
    difference() {
        cube([rollerGuideAdjusterStockWidth, rollerGuideAdjusterLength, rollerGuideAdjusterStockWidth], center = true);
        
        // Threaded holes
        for (offset = rollerGuideAdjusterBoltOffsets) {
            translate([0, offset, 0]) {
                cylinder(rollerGuideAdjusterStockWidth, rollerGuideAdjusterBoltRadius, rollerGuideAdjusterBoltRadius, center = true);
            }
        }
        
        // Reamed holes
        rotate([0, 90, 0]) {
            for (offset = rollerGuideAdjusterPinOffsets) {
                translate([0, offset, 0]) {
                    cylinder(rollerGuideAdjusterStockWidth, rollerGuideAdjusterPinRadius, rollerGuideAdjusterPinRadius, center = true);
                }
            }
        }
    }
}

module RollerGuide() {
   rotate([-90, 0, 0]) {
      cylinder(rollerGuideFlangeDepth, rollerGuideFlangeRadius, rollerGuideFlangeRadius, $fn=50);
      cylinder(rollerGuideFlangeDepth + rollerGuideWheelDepth, rollerGuideWheelRadius, rollerGuideWheelRadius, $fn=50);
   }
}

module Tensioner() {
   // Plate
   // Bearing
   // Screw
   // Handle
}

module IdlerSleeve() {
   translate([0, -headBeamWidth / 2, 0]) {
      difference() {
         cube([idlerWheelSleeveLength, headBeamWidth + 2 * idlerWheelSleeveThickness, headBeamWidth + 2 * idlerWheelSleeveThickness], center=true);
         cube([idlerWheelSleeveLength + 0.2, headBeamWidth, headBeamWidth], center=true);
      }
      translate([-idlerWheelSleeveLength / 2, -(headBeamWidth / 2 + idlerWheelSleeveThickness), -(headBeamWidth / 2 + idlerWheelSleeveThickness)]) {
         cube([idlerWheelSleeveExtensionLength, headBeamWidth + 2 * idlerWheelSleeveThickness, idlerWheelSleeveThickness]);
      }
      
//      // Tensioning nut
//      translate([(idlerWheelSleeveLength - tensionerNutWidth) / 2, 0, -(headBeamWidth / 2 - tensionerNutOffset)]) {
//         rotate([0, 90, 0]) {
//            rotate([0, 0, 30]) {
//               difference() {
//                  cylinder(tensionerNutWidth, tensionerNutRadius, tensionerNutRadius, $fn=6, center=true);
//                  cylinder(tensionerNutWidth + 0.2, tensionerNutHoleRadius, tensionerNutHoleRadius, center=true);
//               }
//            }
//         }
//      }
      
      // Tensioning nut & support
      translate([idlerWheelSleeveExtensionLength - (idlerWheelSleeveLength / 2 + tensionerNutBracePlateHeight), 0, -headBeamWidth / 2]) {
         TensionerNut();
         TensionerNutSupport();
      }
   }
}

module TensionerNut() {
   translate([-tensionerNutWidth, 0, tensionerNutRadius]) {
      rotate([0, 90, 0]) {
         difference() {
            cylinder(tensionerNutWidth, tensionerNutRadius, tensionerNutRadius, $fn = 6);
            translate([0, 0, -0.01]) {
               cylinder(tensionerNutWidth + 0.02, tensionerNutHoleRadius, tensionerNutHoleRadius, $fn = 25);
            }
         }
      }
   }
}

module TensionerNutSupport() {
   TensionerNutBracePlate();
   mirror([0, 1, 0]) TensionerNutBracePlate();
   TensionerNutSupportPlate();
   mirror([0, 1, 0]) TensionerNutSupportPlate();
}

module TensionerNutSupportPlate() {
   translate([-tensionerNutWidth, -(tensionerNutSupportPlateThickness + tensionerNutRadius * sqrt(3) / 2), 0]) {
      hull() {
         cube([tensionerNutWidth, tensionerNutSupportPlateThickness, tensionerNutBracePlateHeight]);
         translate([tensionerNutWidth, 0, 0]) {
            cube([tensionerNutSupportPlateOverlap, tensionerNutSupportPlateThickness, tensionerNutBracePlateHeight - tensionerNutSupportPlateOverlap]);
         }
      }
   }
}

module TensionerNutBracePlate() {
   translate([0, -tensionerNutRadius * sqrt(3) / 2, 0]) {
      hull() {
         cube([tensionerNutBracePlateHeight, tensionerNutBracePlateThickness, 0.001]);
         cube([0.001, tensionerNutBracePlateThickness, tensionerNutBracePlateHeight]);
      }
   }
}

module AxleSupport() {
   translate([0, -axleSupportThickness / 2, 0]) {
      difference() {
         cube([axleSupportWidth, axleSupportThickness, axleSupportDepth], center=true);
         rotate([-90, 0, 0]) {
            cylinder(axleSupportThickness + 0.2, axleRadius, axleRadius, center=true);
         }
      }
   }
}

module AxleTrackingSupport() {
   translate([axleTrackingSupportWidth / 2, 0, -axleTrackingSupportDepth / 2]) {
      rotate([0, 0, 90]) {
         _HollowRoundedCuboid(axleTrackingSupportLength, axleTrackingSupportWidth, axleTrackingSupportDepth, axleTrackingSupportRadius, axleTrackingSupportThickness);
      }
   }
   
   for (theta = [180:180:360]) {
      rotate([0, theta, 0]) {
         translate([0, axleTrackingSupportBoltOffset, axleRadius]) {
            _M10Bolt(axleTrackingSupportBoltLengthShort);
         }
      }
   }
   
   for (theta = [90:180:360]) {
      rotate([0, theta, 0]) {
         translate([0, axleTrackingSupportBoltOffset, axleRadius]) {
            _M10Bolt(axleTrackingSupportBoltLengthLong);
         }
      }
   }
}

module Wheels() {
   // Drive wheel
   translate([-axleSpacing / 2, 0, 0]) {
      // Axle
      translate([0, -(headBeamWidth + axleTrackingSupportOverhang), 0]) {
         rotate([-90, 0, 0]) {
            cylinder(axleLength, axleRadius, axleRadius);
         }
      }
      // Pulley
      translate([0, wheelHeadClearance + drivePulleyThickness / 2, 0]) {
         Wheel(drivePulleyThickness, drivePulleyRadius);
      }
      // Wheel
      translate([0, wheelHeadClearance + drivePulleyThickness + wheelThickness / 2, 0]) {
         CamberedWheel();
      }
   }
   
   // Idler wheel
   translate([axleSpacing / 2, 0, 0]) {
      // Axle
      translate([0, -(headBeamWidth + axleTrackingSupportOverhang), 0]) {
         rotate([-90, 0, 0]) {
            cylinder(axleLength, axleRadius, axleRadius);
         }
      }
      // Wheel
      translate([0, wheelHeadClearance + drivePulleyThickness + wheelThickness / 2, 0]) {
         CamberedWheel();
      }
   }
}

module Blade() {
   translate([0, wheelHeadClearance + drivePulleyThickness + wheelThickness / 2, 0]) {
      difference() {
         _Discorectangle(axleSpacing + 2 * (wheelRadius + bladeThickness), (wheelRadius + bladeThickness) * 2, bladeWidth);
         _Discorectangle(axleSpacing + 2 * (wheelRadius), wheelRadius * 2, bladeWidth + 0.2);
      }
   }
}

module CamberedWheel() {
   intersection() {
      // Disk
      Wheel(wheelThickness, wheelRadius);
      if (CAMBER) {
         // Camber
         scale([1, wheelCamberRadius / wheelRadius, 1]) {
            rotate([90, 0, 0]) {
               sphere(wheelRadius, $fn=100);
            }
         }
      }
   }
}

module Wheel(thickness, radius) {
   rotate([90, 0, 0]) {
      // Disk
      cylinder(thickness, radius, radius, center=true, $fn=100);
   }
}

module _M10Bolt(length) {
   _Bolt(length, 5, 10, 6);
}

module _M16Bolt(length) {
   _Bolt(length, 8, 15, 10);
}

module _Bolt(length, radius, headRadius, headDepth) {
   cylinder(length, radius, radius, $fn=20);
   translate([0, 0, length - headDepth]) {
      cylinder(headDepth, headRadius, headRadius, $fn=6);
   }
}

module _Discorectangle(width, depth, thickness) {
   hull() {
      for (i = [-1, 1]) {
         translate([i * (width - depth) / 2, 0, 0]) {
            rotate([-90, 0, 0]) {
               cylinder(thickness, depth / 2, depth / 2, center=true, $fn=100);
            }
         }
      }
   }
}

module _AngleIron(length, width, thickness) {
   difference() {
      cube([width, length, width]);
      translate([thickness, -0.1, thickness]) {
         cube([width, length + 0.2, width]);
      }
   }
}

module _HollowRoundedCuboid(length, width, depth, radius, thickness, center=false) {
   difference() {
      _RoundedCuboid(length, width, depth, radius, center);
      translate([center ? 0 : -0.1, center ? 0 : thickness, center ? 0 : thickness]) _RoundedCuboid(length + 0.2, width - 2 * thickness, depth - 2 * thickness, radius - thickness, center);
   }
}

module _RoundedCuboid(length, width, depth, radius, center=false) {
   translate([center ? -length / 2 : 0, center ? -width / 2 : 0, center ? -depth / 2 : 0]) {
      minkowski() {
         translate([0, radius, radius]) {
            cube([length, width - 2 * radius, depth - 2 * radius]);
         }
         rotate([0, 90, 0]) cylinder(0.001, radius, radius, $fn=40);
      }
   }
}
