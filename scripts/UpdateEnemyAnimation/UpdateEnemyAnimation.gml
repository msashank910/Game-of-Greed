
function UpdateEnemyAnimation(){
	// Update animation based on state
	if (state == states.death) {
		// Rolling animation should continue playing while rolling
		//localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		//image_index = floor(localFrame) % sprite_get_number(spriteRoll); // Cycling through rolling frames
		
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
	    image_index = floor(localFrame) % sprite_get_number(state.sprite);
		
		if (localFrame >= 6) {
			instance_destroy();
		}
	}
	else if (state == states.hurt) {
		// Running animation
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
		if (floor(localFrame) >= sprite_get_number(state.sprite)) {
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
	else if (state == states.walk) {
		// Running animation
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
	} 
	
	else if (state == states.idle){
		// Idle animation, showing only the idle frame
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
	}
	else {
		//State is undefined
		show_debug_message("State is undefined: " + string(state));
	}

}
