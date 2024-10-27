//show_debug_message("Slime Health: " + string(hp));


// Change direction randomly
if (randomTimer <= 0) {
    move_direction = irandom(359);
    randomTimer = irandom_range(30, 120); // Random duration in frames
}
--randomTimer;

// Calculate movement
var dx = move_speed * dcos(move_direction);
var dy = move_speed * dsin(move_direction);

// Check if it’s still within home radius
switch (state) {
    case states.idle:
        // Check if it's still within the home radius
        if (point_distance(home_x, home_y, x + dx, y + dy) <= home_radius) {
            MoveEnemy(dx, dy);
        } else {
            state = states.returnHome;
        }
        break;

    case states.returnHome:
        // Move back to home position
        move_direction = point_direction(x, y, home_x, home_y);
        var return_dx = move_speed * dcos(move_direction);
        var return_dy = move_speed * dsin(move_direction);

        if (point_distance(x, y, home_x, home_y) < move_speed) {
            x = home_x;
            y = home_y;
            state = states.idle;
        } else {
            MoveEnemy(return_dx, return_dy);
        }
        break;

    case states.pursue:
        // Pursue logic goes here
        break;

    case states.attack:
        AttackEnemy();
        break;

    case states.hurt:
        // Hurt logic goes here
        break;

    case states.death:
        // Death logic goes here
        break;
}

event_inherited();