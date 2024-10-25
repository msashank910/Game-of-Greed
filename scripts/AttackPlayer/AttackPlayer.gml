function AttackPlayer(){
	if(!keyAttack) {
		return;
	}
	state_set(states.attack);
	
	hspeed = 0;		//you can change this how u see fit
	vspeed = 0;
	
	var _hitbox = instance_create_depth(x, y, depth, oHitbox);
	_hitbox.sprite_index = sprite_index;
	_hitbox.image_xscale = image_xscale;
}