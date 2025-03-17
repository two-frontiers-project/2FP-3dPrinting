$fa=6;
$fs=0.3/2;
d1 = 15.6;
hboost=22;
d2=15;
h2=4;
tolerence=0.1;

difference() {
        cylinder(r = d1/2, h = hboost+h2, center = false);
translate([0,0,hboost]) {
        cylinder(r = d2/2, h = h2+tolerence, center = false);
    }
}
