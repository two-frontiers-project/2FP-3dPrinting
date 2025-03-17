height=2;
bolt=(12.55-0.2)/2;

difference(){
   cylinder(height,70/2,70/2);
   cylinder(height,bolt,bolt);
    translate([30,0,0]) cylinder(height,2.9/2,2.9/2,$fs=0.3);
    translate([-30,0,0]) cylinder(height,2.9/2	,2.9/2,$fs=0.3);
}


