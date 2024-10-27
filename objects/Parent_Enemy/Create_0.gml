
image_speed = 0;
hspeed = 0;
vspeed = 0;
move_direction = irandom(359);
lastDirection = move_direction;
home_radius = 100;
move_speed = 0.5;

home_x = x;
home_y = y;

hp = 1;
attack = 1;
attackable = true;
hurtTimer = 10;
randomTimer = 0;

        
image_index = 0;           // Start at the first frame of the animation
localFrame = 0;
ROOM_SPEED = FRAME_RATE; 
wallTileMap = layer_tilemap_get_id(layer_get_id("Col")); // Collision layer

states = {
	idle : noone,
	pursue : noone,
	hurt : noone,
	attack : noone,
	returnHome: noone,
	death: noone
}
state = noone;
