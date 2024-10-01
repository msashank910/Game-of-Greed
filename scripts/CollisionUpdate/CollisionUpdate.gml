// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionUpdate(tileSize, stepSize){
	var _collision = false;

	if(wallTileMap == noone) {
		wallTileMap = layer_tilemap_get_id(layer_get_id("Col")); // Collision layer
	}

	if (hspeed != 0) {
	    var remainingX = abs(hspeed);  // How much movement is left this frame
	    var stepX = sign(hspeed) * stepSize;  // Move in steps of 1 pixel in the direction of hspeed

	    while (remainingX > 0) {
	       
			//!place_meeting(x + stepX, y, wallTileMap)
	        if (!tilemap_get_at_pixel(wallTileMap, x + stepX, y)) {
	            x += stepX;  
	        } else {
          
	            hspeed = 0; 
				_collision = true;
	            break; 
	        }
	        remainingX -= stepSize;  
	    }
	}

	// Vertical movement and collision handling
	if (vspeed != 0) {
	    var remainingY = abs(vspeed);  // How much movement is left this frame
	    var stepY = sign(vspeed) * stepSize;  // Move in steps of 1 pixel in the direction of vspeed

	    while (remainingY > 0) {
			//!place_meeting(x, y + stepY, wallTileMap)
	        if (!tilemap_get_at_pixel(wallTileMap, x, y + stepY)) {
	            y += stepY;  
	        } else {
				_collision = true;
	            vspeed = 0;  
	            break;  
	        }
	        remainingY -= stepSize; 
	    }
	}

	return _collision;
}