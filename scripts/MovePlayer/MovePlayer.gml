// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MovePlayer(){
	if (inputMagnitude > 0) {
        // Calculate movement speed and direction based on input
        hspeed = lengthdir_x(speedwalk, inputDirection);
        vspeed = lengthdir_y(speedwalk, inputDirection);

        // Update the lastDirection to match the current movement direction
        lastDirection = inputDirection;

        // Switch to running animation
        sprite_index = spriteRun;
    } else {
        // Stop movement if no input is detected
        hspeed = 0;
        vspeed = 0;
        sprite_index = spriteIdle;  // Return to idle animation
    }
}