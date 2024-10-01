
//Initialize Controller
Controller();

// Manage rolling state
if(!RollPlayer()) {
    MovePlayer();
	AttackPlayer();
}

UpdateAnimation();

var tileSize = 16;  // Assuming your tile size is 16x16
var stepSize = 1;  // Move one pixel at a time for collision detection
CollisionUpdate(tileSize, stepSize);
