// https://samdex.eu/product/v-belt-pulleys/

a = 9.7;
h = 11;
c = 8;
d = 12;
f = 2;
theta = 34;
count = 1;

t = 3;

bottom = a - 2 * h * tan(theta / 2);

echo();
echo();
echo(str("Bottom Width: ", bottom));
echo();
echo();

//Guide();
Pulley(54 / 2, 2);

//// Depth test
//translate([0, -h, 0]) {
//   Guide();
//}

//// Rotation test
//rotate([0, 0, -theta / 2]) {
//   translate([bottom / 2, 0, 0]) {
//      Guide();
//   }
//}

module Pulley(outerRadius, grooveCount, segments=100) {
   extension = max(0, (13 + 18) - (2 * c + d * (grooveCount - 1)));
   difference() {
      SolidPulley(outerRadius, grooveCount, extension, segments);
      
      cylinder(13, 17.2 / 2, 17.2 / 2, $fn=segments);
      cylinder(31, 11 / 2, 11 / 2, $fn=segments);
   }
}

module SolidPulley(outerRadius, grooveCount, extension=0, segments=100) {
   // Centre hub
   cylinder(2 * c + d * (grooveCount - 1), outerRadius - h, outerRadius - h, $fn=segments);
   
   // Bottom flange
   edgeFlangeWidth = c - a / 2;
   middleFlangeWidth = d - a;
   slopeWidth = (a - bottom) / 2;
   cylinder(edgeFlangeWidth, outerRadius, outerRadius, $fn=segments);
   
   for (i = [0 : grooveCount - 1]) {
      translate([0, 0, edgeFlangeWidth + (a + middleFlangeWidth) * i]) {
         // Bottom slope
         cylinder(slopeWidth, outerRadius, outerRadius - h, $fn=segments);
         // Top slope
         translate([0, 0, slopeWidth + bottom]) cylinder(slopeWidth, outerRadius - h, outerRadius, $fn=segments);
         // Middle flange
         if (i < grooveCount - 1) {
            translate([0, 0, slopeWidth * 2 + bottom]) cylinder(middleFlangeWidth, outerRadius, outerRadius, $fn=segments);
         }
      }
   }
   
   // Top flange
   translate([0, 0, edgeFlangeWidth + a * grooveCount + middleFlangeWidth * (grooveCount - 1)]) {
      cylinder(edgeFlangeWidth + extension, outerRadius, outerRadius, $fn=segments);
   }
}

module Guide() {
   for (i = [0:count - 1]) {
      translate([i * d, 0, t / 2]) {
         hull() {
            cube([bottom, 0.001, t], center = true);
            translate([0, h, 0]) {
               cube([a, 0.001, t], center = true);
            }
         }
      }
   }

   translate([-c, h, 0]) {
      cube([2 * c + (count - 1) * d, t, t]);
   }
}
