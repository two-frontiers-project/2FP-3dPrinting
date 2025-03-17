noz=0.35;
$fa=6;
$fs=noz/2;
tolerence=0.1;

d1 = 15.6;
hboost=22;
d2=d1-(2*noz)-tolerence;
h2=4;

channel=3;
screwinset=7.5;

difference() {
    //main
    cylinder(r = (d1/2), h = hboost+h2, center = false);
    //inset in top
    translate([0,0,hboost]) {
        cylinder(r = d2/2-(noz), h = h2+tolerence, center = false);
    }
    //side channel
    translate([0,d1/2,-tolerence]) {
    cylinder(r = 3/2, h = hboost+h2+2*tolerence, center = false);
    }
    //bottem insets
    translate([0,0,-tolerence]) {
    union(){
        cylinder(r = screwinset/2, h = screwinset+tolerence, center = false);
        translate([0,d1/2/2,0]) {
        cube([channel, d1/2, screwinset+tolerence], center = true);
        }
        //screw pilot
        cylinder(r = 1, h = screwinset+10+tolerence, center = false);
        }
    }
}
