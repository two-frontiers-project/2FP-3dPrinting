$fn=4;

overlap=0.001;
h=8-1;
cutout_h = 8;

module adapter() {
linear_extrude(height = h)
            translate([-60.17,-56.12+3.51,0]) import(file = "glasses_divemask_contactpoints.svg",
            convexity=20
            );
}

module gap(extra=1) {
    translate([0-extra,-40/2,cutout_h]) cube([1.5+2*extra,40,12+2*extra]);
}

module attachment(t=5, w=(1.5+2*5)/2) {
    hull() {
        translate([-t,-1,cutout_h]) cube([1.5+2*t,8,12]);
        translate([0,8-1.5,0]) cube([1.5,0.5,0.1]);  
        translate([w,8-2+0.03+1,8-1]) cube([0.1,2.23+1-2,0.1]);       
        translate([-w,8-3.15+1,8-1]) cube([0.1,3.35-2,0.1]);     
      
    }
}

module hemisphere(d) {
    difference () {
        sphere(d);
        translate([0,0,-d]) {cube([2*d,2*d,2*d], center=true);};
    };
 }

 difference() {
    union() { 
        minkowski() {
            union() {attachment(t=5, w=8);
            adapter();
            }
            hemisphere(2);
        }
    }
    gap();   
 }
 
