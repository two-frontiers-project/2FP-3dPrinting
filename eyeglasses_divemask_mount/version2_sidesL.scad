//Top Bottom, Front, Rear
//Left side

$fs=50;

cornercube=3;
U=62.5;
F=50;
supportH=3.9;
backH=2;

module hinge() {
    translate([17,37.4-1.5,1]) rotate([0,45,0]) 
    translate([-3.2,0,0]) {
    cube([3.2,1.5,20]);
    };    
};

module TF() {
    translate([F,U,0]) {
    cube([cornercube,cornercube,cornercube]);
    };
};

module TR() {
    translate([0,U,0]) {
    cube([cornercube,cornercube,backH]);
    };
};
    
module BF() {
    translate([F,0,0]) {
    cube([cornercube,cornercube,cornercube]);
    };
};
    
module BR() {
    translate([0,0,0]) {
    cube([cornercube,cornercube,backH]);
    };
};
    
module Tglasses(){
    translate([17,37.4,0]) {
    cube([7,3.5,supportH]);
    };
};
    
module Bglasses() {
    translate([17,37.4-1.5-3.5,0]) {
    cube([7,3.5,supportH]);
    };
};

module Fsupport_old() {
    translate([17,37.4-1.5-3.5,0]) {
    cube([7,3.5+1+3.5,3]);
    };
};

module Fsupport() {
    translate([17,37.4-1.5-3.5,0]) {
    cube([7,3.5+1+3.5,7]);
    };
};

module Rsupport(w) {
    translate([17-w,37.4-1.5-3.5,0]) {
    cube([w,3.5+1+3.5,3.9]);
    };
};

module rough() {
    union() {

        Fsupport();

        hull() {
            Rsupport(2);
            //TR();
            //BR();
    };
            hull() {
            TF();
            Tglasses();
        };

        hull() {
            TR();
            Tglasses();
        };

        hull() {
            BF();
            Bglasses();
         };

        hull() {
            BR();
            Bglasses();
        };
    };
};


module hemisphere(d) {
    difference () {
        sphere(d);
        translate([0,0,-d]) {cube([2*d,2*d,2*d], center=true);};
    };
 }

 difference () {
     minkowski() {
        rough();
        hemisphere(1);
    };
    hinge();
};