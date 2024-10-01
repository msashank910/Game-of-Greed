function RollPlayer(){
	if (keyActivate && !isRolling && inputMagnitude > 0) {
	    // Start rolling if space is pressed and there is movement input
	    isRolling = true;
	    rollDuration = maxRollDuration;
	    sprite_index = spriteRoll;  // Switch to rolling animation
	    hspeed = lengthdir_x(speedroll, lastDirection);  // Set rolling horizontal speed
	    vspeed = lengthdir_y(speedroll, lastDirection);  // Set rolling vertical speed
	}
	
	if (isRolling) {
	    // Decrease roll duration
	    rollDuration -= 1;

	    // Continue moving in the last direction with rolling speed
	    hspeed = lengthdir_x(speedroll, lastDirection);
	    vspeed = lengthdir_y(speedroll, lastDirection);

	    // End roll when duration expires
	    if (rollDuration <= 0) {
	        isRolling = false;
	        hspeed = 0;
	        vspeed = 0;
	        sprite_index = spriteIdle;  // Return to idle animation
	    }
		
		return true;
	}
	return false;
}