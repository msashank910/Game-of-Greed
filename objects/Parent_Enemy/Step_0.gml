
if(hp <= 0) {
	state_set(state.death);
}


// Initialize Controller
Controller();

// If the player initiates a roll and the current state is not already rolling or attacking
if (keyActivate && state != states.roll && state != states.attack) {
    state_set(states.roll);
}

// If the player initiates an attack and is not currently rolling or attacking
if (keyAttack && state != states.roll && state != states.attack) {
    AttackEnemy();
}

// Only allow player movement when not rolling or attacking
if (state != states.roll && state != states.attack) {
    MoveEnemy();
}

// Handle animation and transition states
UpdateEnemyAnimation();

CollisionUpdate(TILE_SIZE, 1);