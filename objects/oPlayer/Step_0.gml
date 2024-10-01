
//Initialize Controller
Controller();

// Manage rolling state
if(!RollPlayer()) {
    MovePlayer();
	AttackPlayer();
}

UpdateAnimation();

var stepSize = 1;  // Move one pixel at a time for collision detection
CollisionUpdate(TILE_SIZE, stepSize);
