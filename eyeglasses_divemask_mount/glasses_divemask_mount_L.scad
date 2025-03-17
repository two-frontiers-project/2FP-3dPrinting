$fn=50;

overlap=0.001;
h=20;
cutout_h = 8;

module adapter() {
linear_extrude(height = h)
            import(file = "glasses_divemask_mount_L.svg",
            convexity=8
            );
}

module subtraction() {        
    linear_extrude(height = cutout_h+overlap)
            import(file = "glasses_divemask_mount_L_subtract.svg", 
            convexity=8
            );
}
            

module hemisphere() {
    difference () {
        sphere(1);
        translate([0,0,-1]) {cube([2,2,2], center=true);};
    };
 }

module example() {
    minkowski() {
	    cube([10,10,10]) ;
        hemisphere();
        }
}

module mount() {
translate([60.17,0,cutout_h-overlap]) cube([1.5,100,10]);
}
module part() {
    translate([100,0,h]) rotate([0, 180, 0]) {
        difference() {
            difference() {
              adapter();      
              translate([0,0,-overlap]) subtraction();
            };
          mount();
          };
    };
};

part();