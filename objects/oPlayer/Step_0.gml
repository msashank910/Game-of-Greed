
// Initialize Controller
Controller();

// If the player initiates a roll and the current state is not already rolling or attacking
if (keyActivate && state != states.roll && state != states.attack) {
    state_set(states.roll);
}

// If the player initiates an attack and is not currently rolling or attacking
if (keyAttack && state != states.roll && state != states.attack) {
    state_set(states.attack);
}

// Only allow player movement when not rolling or attacking
if (state != states.roll && state != states.attack) {
    MovePlayer();
}

// Handle animation and transition states
UpdatePlayerAnimation();

// Collision handling
CollisionUpdate(TILE_SIZE, 1);
