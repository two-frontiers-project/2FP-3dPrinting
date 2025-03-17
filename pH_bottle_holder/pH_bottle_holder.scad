// pH_bottle.scad - to hold bottle on brokenmeter

bottle=35/2;
peg=10/2;
standarea=23-1;
h=30;
spacer=3;
otherhole=10/2;
otherholeh=5;
bottlecenter=peg+bottle+spacer;

//put on plane
translate([0,0,h/2]) {
    difference() {
        union() {
            //main body
            cylinder(h, r=standarea, center=true);
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
