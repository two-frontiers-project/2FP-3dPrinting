//Spec is 89.1 mm x 63.3 mm x 34.4 mm
//using slightly different numbers from engeneering diagram:
in2mm = 25.4;
specW = 3.5*in2mm;
specH = 1.337*in2mm;

//platform will be 10mm larger
platX = specW+10;
platY = specH+10;

//Location of lens from one side of specW
specLX = 0.970*in2mm;
specLY = 0.8*in2mm;

//slop for fittings (don't want it too tight), on each side
gap = 0.02;

//we will use the colimiting lens that screw into spec
specLensR = 7.97/2;
specLensH = 5.56;

//Can be used in standard nikkon camera mount 
mountR = 41.6/2;
//extra height (above the 2.52+4.02) nessesary for the camera mount so it can fit deeper into microscope mount
mountH = 20; //2.52+4.02;

//Or it can be fitted on camera mount with focus (press fit over screw)
module cameraMount(){
union() {
    translate([0,0,+2.52]) cylinder(4.02,(25.33/2)+gap,(25.33/2)+gap);
    cylinder(2.52,(31.71/2)+gap,(31.71/2)+gap);
  }
}

module platform(){
      //platform with holes cut out, taking into account 5mm on each side of platform
	difference(){
            cube(size=[platX, platY,specLensH], center=false);
            translate([3.1*in2mm+5,platY/2,0]) cylinder(specLensH,3/2+gap,3/2+gap, center=false, $fs=0.3);
            //translate([0.3*in2mm+5,platY/2,0]) cylinder(specLensH,3/2+gap,3/2+gap, center=false);
          }
}

//rotate to sit on platform
translate([19.81200,0,specLensH]) rotate([0,180,0]){
difference() {
  union() {
  //Set up so platform is above 0 Z, mounting clynders are below, and lens in over Z axes
      translate([-specLX-5, -(platY/2),0]) platform();
      //sets into nikon adapter
      translate([0,0,-mountH]) cylinder(mountH,mountR-gap,mountR-gap);
      //stabalise structure
      
    }
  //colimiting lens fits in
  cylinder(5.56,(7.97/2)+gap,(7.97/2)+gap);
  //subtract camera shape
  translate([0,0,-mountH]) cameraMount();
  //subtract lightpath
    translate([0,0,-(mountH)]) cylinder(mountH,(25.33/2),(25.33/2));
}
}
