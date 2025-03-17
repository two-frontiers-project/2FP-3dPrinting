use <Thread_Library.scad>
height=2;
bolt=(12.9)/2;
difference(){
   cylinder(height,16/2,16/2);
   cylinder(height,bolt,bolt);
}


