// an adapter for culture tubes to HACH 2100Q

$fn=50;
slicerwall=0.8;

//glass culture tubes
diamtube=12+0.5;  

//lip
diamlip=18+6+6;
hlip=slicerwall*2;

//OD600 space 
diam=17;
depth=18+hlip; 

//light pipe 
diaml=6;


translate([0,0,hlip/2]) difference(){
    //body of adapter
    translate([0,0,0]) difference(){
        union(){
            //body
            translate([0,0,depth/2]) cylinder(h=depth,d=diam, center=true);
            //lip
            cylinder(h=hlip, d=diamlip, center=true);
        };
    //space for tube
    cylinder(h=depth*10, d=diamtube, center=true);
    //lightpath (corect for minkowski of 1/2)
    translate([0,0,(depth)/2+1/2]) rotate([0,90,0]) cylinder(diam*2, diaml/2, diaml/2, center=true);
       
     };
 
     
    //subtract to make alignment edges 
    //from OD600 box
    w=diamlip;
    h=18;
    l=26;
    //box subtracted from box to get edges
    translate([0,0,0]) difference(){
        cube([2*w,2*l,h-10], center=true);
        minkowski()
        {
            cube([w,l,h], center=true);
            sphere(1/2);
        }
    };
};