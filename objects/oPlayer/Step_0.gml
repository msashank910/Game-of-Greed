// Input handling
keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);  // Space bar for rolling
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);

// Directional input handling
inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) or (keyDown - keyUp != 0);  // Check if any movement keys are pressed

// Rolling mechanics
if (keyActivate && !isRolling && inputMagnitude > 0) {
    // Start rolling if space is pressed and there is movement input
    isRolling = true;
    rollDuration = maxRollDuration;
    sprite_index = spriteRoll;  // Switch to rolling animation
    hspeed = lengthdir_x(speedroll, lastDirection);  // Set rolling horizontal speed
    vspeed = lengthdir_y(speedroll, lastDirection);  // Set rolling vertical speed
}

// Manage rolling state
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

} else {
    // Normal walking behavior when not rolling
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


var _collision = false;
var tileSize = 16;  // Assuming your tile size is 16x16
var stepSize = 1;  // Move one pixel at a time for collision detection

//TEMP FIX, UPDATES COLLISION EVERY STEP
wallTileMap = layer_tilemap_get_id(layer_get_id("Col")); // Collision layer


if (hspeed != 0) {
    var remainingX = abs(hspeed);  // How much movement is left this frame
    var stepX = sign(hspeed) * stepSize;  // Move in steps of 1 pixel in the direction of hspeed

    while (remainingX > 0) {
        // Check for collision one step at a time
        if (!place_meeting(x + stepX, y, wallTileMap)) {
            x += stepX;  // No collision, move by one pixel
        } else {
          
            hspeed = 0;  // Stop horizontal movement
            break;  // Exit loop, collision occurred
        }
        remainingX -= stepSize;  // Subtract the step we just took
    }
}

// Vertical movement and collision handling
if (vspeed != 0) {
    var remainingY = abs(vspeed);  // How much movement is left this frame
    var stepY = sign(vspeed) * stepSize;  // Move in steps of 1 pixel in the direction of vspeed

    while (remainingY > 0) {
        // Check for collision one step at a time
        if (!place_meeting(x, y + stepY, wallTileMap)) {
            y += stepY;  // No collision, move by one pixel
        } else {
            
            vspeed = 0;  // Stop horizontal movement
            break;  // Exit loop, collision occurred
        }
        remainingY -= stepSize;  // Subtract the step we just took
    }
}





return _collision;
