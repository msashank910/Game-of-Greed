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