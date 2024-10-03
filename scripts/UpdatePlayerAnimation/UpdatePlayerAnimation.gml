
/*
function UpdateAnimation(){
	// Update animation based on state
	if (isRolling) {
	    // Rolling animation should continue playing while rolling
	    localFrame += sprite_get_speed(spriteRoll) / ROOM_SPEED;
	    image_index = floor(localFrame) % sprite_get_number(spriteRoll); // Cycling through rolling frames
	} else if (inputMagnitude > 0) {
	    // Running animation
	    localFrame += sprite_get_speed(spriteRun) / ROOM_SPEED;
	    image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
	} else {
	    // Idle animation, showing only the idle frame
	    image_index = round(lastDirection / 90) % 4;
	}
}
*/


function UpdatePlayerAnimation(){
	// Update animation based on state
	if (state == states.roll) {
		// Rolling animation should continue playing while rolling
		//localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		//image_index = floor(localFrame) % sprite_get_number(spriteRoll); // Cycling through rolling frames
		
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
	    var directionIndex = 0;
    
	    if (lastDirection == 0) {
	        directionIndex = 0;  // Right
	    } else if (lastDirection == 90) {
	        directionIndex = 1;  // Up
	    } else if (lastDirection == 180) {
	        directionIndex = 2;  // Left
	    } else if (lastDirection == 270) {
	        directionIndex = 3;  // Down
	    }
    
	    // Assuming 6 frames per direction, calculate the image_index
	    // directionIndex * 6 gives the starting frame for that direction
	    image_index = directionIndex * 6 + (floor(localFrame) % 6); // Cycle through 6 frames per direction

		
		
		if (localFrame >= 6) {
			state_set(state.stateOnEnd);
		}
	}
	else if (state == states.attack) {
		//Attack Animation
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = floor(localFrame) % sprite_get_number(state.sprite);
		
		if (floor(localFrame) >= sprite_get_number(state.sprite)) {
			state_set(state.stateOnEnd);
		}
	} 
	else if (state == states.run) {
		// Running animation
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
	} 
	
	else if (state == states.idle){
		// Idle animation, showing only the idle frame
		image_index = round(lastDirection / 90) % 4;
	}
	else {
		//State is undefined
		show_debug_message("State is undefined: " + string(state));
	}

}
