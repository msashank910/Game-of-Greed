
function MoveEnemy(){
    // Check for state transitions based on input magnitude
    if (inputMagnitude > 0) {
        if (state == states.idle) {
            // Transition from idle to running state
            state_set(states.walk);
        }
    } else {
        if (state == states.walk) {
            // Transition from running to idle state when no input
            state_set(states.idle);
        }
    }

    // Perform behavior based on current state
    switch (state) {
        case states.idle:
            // Handle idle logic
            hspeed = 0;
            vspeed = 0;
            // Set idle animation (if necessary)
            //sprite_index = spriteIdle;  // Optional if not set elsewhere
            break;

        case states.walk:
            // Handle running logic
            hspeed = lengthdir_x(speedwalk, inputDirection);
            vspeed = lengthdir_y(speedwalk, inputDirection);
            lastDirection = inputDirection;
            break;
	}
}
