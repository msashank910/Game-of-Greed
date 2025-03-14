// Player initialization in the Create event
image_speed = 0;
hspeed = 0;
vspeed = 0;
speedwalk = 0.50;  // Walking speed
speedroll = 0.75;  // Rolling speed (adjust as needed)
distanceroll = 35; // Distance covered during the roll (adjust as needed)

spriteIdle = sPlayerIdle;  // Idle sprite with 4 frames (1 frame per direction)
spriteRun = sPlayerRun;    // Running sprite with 32 frames (covering all directions)
spriteRoll = sPlayerRoll;  // Rolling sprite
spriteAttack = sPlayerAttackSlash

sprite_index = spriteIdle; // Start with idle sprite by default
image_index = 0;           // Start at the first frame of the animation

localFrame = 0;            // Initialize localFrame for animation tracking
ROOM_SPEED = FRAME_RATE;           // Frame rate (room speed)

wallTileMap = layer_tilemap_get_id(layer_get_id("Col")); // Collision layer

// Variables to manage rolling
isRolling = false;         // Whether the player is currently rolling
rollDuration = 0;          // Countdown timer for how long the roll lasts
maxRollDuration = distanceroll / speedroll; // Time to complete a roll, based on distance and speed
lastDirection = 0;         // Last direction the player moved in

//tilemap
//wallTileMap = layer_tilemap_get_id("Col")

// State Initialization
states = {
	idle : new State (sPlayerIdle),
	run : new State (sPlayerRun),
	roll : new State (sPlayerRoll),
	attack : new State (sPlayerAttackSlash),
	death : new State (sPlayerRoll)
}

states.attack.StateOnEnd(states.idle);
states.roll.StateOnEnd(states.idle);

state = states.idle;

//Health and Attacks
hp = 100;
isAttacking = false;
attackPower = 10;
hitByAttack = ds_list_create();
invincibleTimer = 0;


//Inventory
playerCoins = 0;
