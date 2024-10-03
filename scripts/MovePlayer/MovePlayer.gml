// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*
function MovePlayer(){
	if (inputMagnitude > 0) {
        // Calculate movement speed and direction based on input
        hspeed = lengthdir_x(speedwalk, inputDirection);
        vspeed = lengthdir_y(speedwalk, inputDirection);

        // Update the lastDirection to match the current movement direction
        lastDirection = inputDirection;

        // Switch to running animation
		state_set(states.run);
        //sprite_index = spriteRun;
    } else {
        // Stop movement if no input is detected
        hspeed = 0;
        vspeed = 0;
		state_set(states.idle);
        //sprite_index = spriteIdle;  // Return to idle animation
    }
}
*/

function MovePlayer(){
    // Check for state transitions based on input magnitude
    if (inputMagnitude > 0) {
        if (state == states.idle) {
            // Transition from idle to running state
            state_set(states.run);
        }
    } else {
        if (state == states.run) {
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

        case states.run:
            // Handle running logic
            hspeed = lengthdir_x(speedwalk, inputDirection);
            vspeed = lengthdir_y(speedwalk, inputDirection);
            lastDirection = inputDirection;
            break;
	}
}
