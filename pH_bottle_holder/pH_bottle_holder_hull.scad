// pH_bottle.scad - to hold bottle on brokenmeter

use <threads.scad>

english_thread (diameter=1.05, threads_per_inch=14, length=3/4, taper=1/16);

bottle=35/2;
peg=10/2+1;
standarea=(48/2)-5;
h=30;
spacer=3;
otherhole=10/2;
otherholeh=5;
bottlecenter=peg+bottle+spacer;

//put on plane
translate([0,0,h/2]) {
    difference() {
        hull() {
            //main body
            translate([0,0,-h/3]) {
					cylinder(h/3, r=standarea/3, center=true);
				}
            //holding wall for bottle
            translate([bottlecenter,0,0]) {
                cylinder(h, r=bottle+spacer, center=true);
            }
        }
        //hole to fit peg
        cylinder(h+spacer, r=peg, center=true);
        //bottle holder space
        translate([bottlecenter,0,0]) {
            cylinder(h+spacer, r=bottle, center=true);
        }
        //other mouting hole
        translate([0,0,(h/2)-(otherholeh/2)]) {
            cylinder(otherholeh+spacer, r=otherhole, center=true);    
        }
    }
}
