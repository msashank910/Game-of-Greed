
function UpdateEnemyAnimation(){
	// Update animation based on state
	if(state == states.death) {
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = floor(localFrame) % sprite_get_number(state.sprite);
		
		if (localFrame >= sprite_get_number(state.sprite)) {
			instance_destroy();
		}
	}
	else if (state == states.hurt) {	//FIX THIS
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
	else if (state == states.pursue || state == states.returnHome || state == states.idle) {
		// Running animation
		localFrame += sprite_get_speed(state.sprite) / ROOM_SPEED;
		image_index = (round(lastDirection / 90) % 4) * 8 + (floor(localFrame) % 8); // Use cardinal directions for running
	} 
	else {
		//State is undefined
		show_debug_message("State is undefined: " + string(state));
	}

}
