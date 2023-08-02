flangeWidth = 6;
flangeRadius = 74 / 2;

barrelWidth = 20;
barrelRadius = 60 / 2;
barrelGrooveWidth = 3;
barrelGrooveDepth = 2;
barrelGrooveCount = 3;

boreRadius = 28 / 2;
bearingRadius = 42 / 2;
bearingWidth = 8;
springClipGrooveDepth = 2;
springClipGrooveWidth = 2;
springClipGrooveInset = 2;

wallThickness = 3;


barrelGrooveSeparation = (barrelWidth - barrelGrooveCount * barrelGrooveWidth) / (barrelGrooveCount + 1);


echo();
echo();
echo(str("Barrel Groove Separation: ", barrelGrooveSeparation, "mm"));
echo(str("Bearing Spacer Width: ", barrelWidth + flangeWidth - (wallThickness + 2 * bearingWidth + springClipGrooveWidth + springClipGrooveInset), "mm"));
echo();
echo();


difference() {
    union() {
        cylinder(barrelWidth + flangeWidth, barrelRadius, barrelRadius, $fn=100);
        cylinder(flangeWidth, flangeRadius, flangeRadius, $fn=100);
    }
    // Centre bore
    cylinder(barrelWidth + flangeWidth, boreRadius, boreRadius, $fn=100);
    // Bearing socket
    cylinder(barrelWidth + flangeWidth - wallThickness, bearingRadius, bearingRadius, $fn=100);
    
    // Spring clip
    translate([0, 0, springClipGrooveInset]) cylinder(springClipGrooveWidth, bearingRadius + springClipGrooveDepth, bearingRadius + springClipGrooveDepth, $fn=100);
    
    // Grooves
    for (i = [0 : barrelGrooveCount - 1]) {
        translate([0, 0, flangeWidth + barrelGrooveSeparation * (i + 1) + barrelGrooveWidth * i]) {
            difference() {
                cylinder(barrelGrooveWidth, barrelRadius, barrelRadius, $fn=100);
                cylinder(barrelGrooveWidth, barrelRadius - barrelGrooveDepth, barrelRadius - barrelGrooveDepth, $fn=100);
            }
        }
    }
}

//translate([0, 0, barrelWidth + flangeWidth - (wallThickness + 2 * bearingWidth)]) {
//    cylinder(bearingWidth * 2, bearingRadius, bearingRadius, $fn=100);
//}