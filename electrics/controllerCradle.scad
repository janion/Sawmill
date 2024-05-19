mountingScrewStepHeight = 1.5;
mountingScrewSeparation = 60.0;
mountingScrewRadius = 3.5 / 2;
mountingScrewTabRadius = 10.0 / 2;
mountingScrewStepOffset = 3.5;

basePlateThickness = 2.5;

boardScrewLength = 10.0;
boardScrewRadius = 2.5 / 2;
boardScrewColumnRadius = 8.0 / 2;
boardScrewSeparationX = 33.02;
boardScrewSeparationY = 63.5;


basePlateWidth = boardScrewSeparationX + 2 * boardScrewColumnRadius;
mountingTabSupportWidth = mountingScrewSeparation + 2 * mountingScrewTabRadius;


difference() {
  union() {
    // Base plate
    translate([-basePlateWidth / 2, 0, 0]) {
      cube([basePlateWidth, boardScrewSeparationY + 2 * boardScrewColumnRadius, basePlateThickness]);
    }
    
    // Mounting tab support
    translate([-mountingTabSupportWidth / 2, 0, 0]) {
      cube([mountingTabSupportWidth, mountingScrewTabRadius * 2, basePlateThickness]);
    }
    
    // Mounting tabs
    translate([0, 0, mountingScrewStepHeight]) {
      for (x = [-0.5, 0.5]) {
        translate([x * mountingScrewSeparation, 0, 0]) {
          hull() {
            translate([0, -mountingScrewStepOffset, 0]) {
              cylinder(basePlateThickness - mountingScrewStepHeight, mountingScrewTabRadius, mountingScrewTabRadius, $fn = 50);
            }
            translate([0, mountingScrewTabRadius, 0]) {
              cylinder(basePlateThickness - mountingScrewStepHeight, mountingScrewTabRadius, mountingScrewTabRadius, $fn = 50);
            }
          }
        }
      }
    }
    
    // Board screw columns
    for (x = [-0.5, 0.5]) {
      for (y = [boardScrewColumnRadius, boardScrewColumnRadius + boardScrewSeparationY]) {
        translate([x * boardScrewSeparationX, y, 0]) {
          cylinder(boardScrewLength, boardScrewColumnRadius, boardScrewColumnRadius, $fn = 50);
        }
      }
    }
  }
  
  // Mounting tab holes
  translate([0, 0, mountingScrewStepHeight]) {
    for (x = [-0.5, 0.5]) {
      translate([x * mountingScrewSeparation, 0, 0]) {
        translate([0, -mountingScrewStepOffset, 0]) {
          cylinder(basePlateThickness - mountingScrewStepHeight, mountingScrewRadius, mountingScrewRadius, $fn = 25);
        }
      }
    }
  }
  
  // Board screw column holes
  for (x = [-0.5, 0.5]) {
    for (y = [boardScrewColumnRadius, boardScrewColumnRadius + boardScrewSeparationY]) {
      translate([x * boardScrewSeparationX, y, 0]) {
        cylinder(boardScrewLength, boardScrewRadius, boardScrewRadius, $fn = 25);
      }
    }
  }
}
