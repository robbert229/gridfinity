/**
 * This box is inspired by Alexandre Chapel's box system.
 */

include <lasercut/lasercut.scad>; 

gfSizeMM = 42.0;
widthCells = 10;
depthCells = 9;
materialThicknessMM = 10; 

heightMM = 76;

module box_bottom(){
    lasercutoutSquare(
        thickness=materialThicknessMM, 
        x = gfSizeMM * widthCells, 
        y = depthCells * gfSizeMM
    );
};

module box_top(){
    lasercutoutSquare(
        thickness=materialThicknessMM,
        x = gfSizeMM * widthCells - (materialThicknessMM * 2), 
        y = depthCells * gfSizeMM
    );
}

module box_left() {
    rotate([90, 0, 90]){
        lasercutoutSquare(
            thickness=materialThicknessMM,
            x = depthCells * gfSizeMM,
            y = heightMM
        );
    }
};

module box_right() {
    rotate([90, 0, 90]){
        lasercutoutSquare(
            thickness=materialThicknessMM,
            x = depthCells * gfSizeMM,
            y = heightMM
        );
    }
};

module box_front(){
    frontAndBackHeightMM = heightMM - materialThicknessMM;
    rotate([0, -90,-90]){
        lasercutoutSquare(
            thickness=materialThicknessMM,
            x = frontAndBackHeightMM,
            y = gfSizeMM * widthCells - (2 * materialThicknessMM)
        );
    }
};

module box_back(){
    frontAndBackHeightMM = heightMM - materialThicknessMM;
    rotate([0, -90, -90]){
        lasercutoutSquare(
            thickness=materialThicknessMM,
            x = frontAndBackHeightMM,
            y = gfSizeMM * widthCells - (2 * materialThicknessMM)
        );
    }
}

color("red"){
    box_bottom();
}

translate([0,0,materialThicknessMM]){
    // left
    translate([0,0,0]) {
        box_left();
    }

    // right
    translate([gfSizeMM * widthCells - materialThicknessMM,0,0]) {
        box_right();
    }
    
    // the front and back panels are shorter than the side panels to allow for 
    // the hinged top to sit flush when closed.
    
    translate([materialThicknessMM, 0,0]){
        color("cyan"){
            // front
            translate([0,0,0]){
                box_front();
            }
            
            // back
            translate([0, depthCells * gfSizeMM - materialThicknessMM, 0]){
                box_back();
            }
        }
    }
}

// top
color("magenta") {
    translate([materialThicknessMM,0,heightMM]){
        box_top();
    }
}
