// Handle animation and transition states
if(hp <= 0) 
	state_set(states.death);
UpdateEnemyAnimation();
CollisionUpdate(TILE_SIZE, 1);
