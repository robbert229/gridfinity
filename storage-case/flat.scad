use <lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 10, 
          points = [[0, 0], [420, 0], [420, 378], [0, 378], [0, 0]]
        ) 

lasercutout(thickness = 10, 
          points = [[0, 0], [378, 0], [378, 76], [0, 76], [0, 0]]
        ) 

lasercutout(thickness = 10, 
          points = [[0, 0], [378, 0], [378, 76], [0, 76], [0, 0]]
        ) 

lasercutout(thickness = 10, 
          points = [[0, 0], [66, 0], [66, 400], [0, 400], [0, 0]]
        ) 

lasercutout(thickness = 10, 
          points = [[0, 0], [66, 0], [66, 400], [0, 400], [0, 0]]
        ) 

lasercutout(thickness = 10, 
          points = [[0, 0], [400, 0], [400, 378], [0, 378], [0, 0]]
        ) 

;
}

flat();
