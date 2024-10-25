//show_debug_message("Slime Health: " + string(hp));


// Change direction randomly
if (random(1) < 0.02) {
    move_direction = irandom(359);
	lastDirection = move_direction;
}

// Calculate movement
var dx = move_speed * dcos(move_direction);
var dy = move_speed * dsin(move_direction);

// Check if it’s still within home radius
if(state == states.idle) {
	if (point_distance(home_x, home_y, x + dx, y + dy) <= home_radius) {
	   MoveEnemy(dx, dy);
	} 
	else {
		state = states.returnHome;
	}
}
else if(state == states.returnHome) {
	 move_direction = point_direction(x, y, home_x, home_y);
	 if(x == home_x && y == home_y) {
		state_set(state.stateOnEnd); 
	 }
}
else if(state == states.pursue) {
	
}
else if(state == states.attack) {
	AttackEnemy();
}

event_inherited();