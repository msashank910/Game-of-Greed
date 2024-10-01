
//Initialize Controller
Controller();

// Manage rolling state
if(!RollPlayer()) {
    MovePlayer();
	AttackPlayer();
}

UpdateAnimation();

CollisionUpdate(TILE_SIZE, 1);
