// an adapter for culture tubes to HACH 2100Q

$fn=50;

//glass capped tube 
diamtube=12+0.5;  

//lip
diamlip=35;
hlip=4.05;

//hach vial 
diam=24.8;
depth=29+hlip; //lighpath starts 29mm deep, so add hight of lip 


difference(){
    union(){
        //body
        translate([0,0,depth/2]) cylinder(h=depth,d=diam, center=true);
        //lip
        translate([0,0,hlip/2]) cylinder(h=hlip, d=diamlip, center=true);
    };
//space for tube
cylinder(h=depth*10, d=diamtube, center=true);
   
 };