include <gridfinity-rebuilt-openscad/gridfinity-rebuilt-utility.scad>

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 2;  
// number of bases along y-axis   
gridy = 4;  
// bin height. See bin height information and "gridz_define" below.  
gridz = 6;   
// base unit
length = 42;


/* [Toggles] */
// internal fillet for easy part removal
enable_scoop = true;
// snap gridz height to nearest 7mm increment
enable_zsnap = true;
// enable upper lip for stacking other bins
enable_lip = false;

/* [Other] */
// determine what the variable "gridz" applies to based on your use case
gridz_define = 0; // [0:gridz is the height of bins in units of 7mm increments - Zack's method,1:gridz is the internal height in millimeters, 2:gridz is the overall external height of the bin in millimeters]
// the type of tabs
style_tab = 1; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]

// overrides internal block height of bin (for solid containers). Leave zero for default height. Units: mm
height_internal = 0; 

/* [Base] */
style_hole = 1; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit]
// number of divisions per 1 unit of base along the X axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_x = 0;
// number of divisions per 1 unit of base along the Y axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_y = 0; 

// ===== Commands ===== //

difference(){
    color("green"){
        gridfinityInit(gridx, gridy, height(gridz, gridz_define, enable_lip, enable_zsnap), height_internal, length) {
            
        }
    }
    
    $scale = 1.03;

    color("tomato") {
        translate([-80 * $scale,-100 * $scale, 52 * $scale]){
            rotate([0,180,0]){
                scale([$scale, $scale,$scale]){
                    import("Dial_Indicator_Shape_Mockup.stl", convexity=5);
                }
            }
        }
    }
    
    color("blue"){
        translate([0,-20,35]){
            cylinder(10, d=70){
                
            }
        }
    }
}

gridfinityBase(gridx, gridy, length, div_base_x, div_base_y, style_hole);
