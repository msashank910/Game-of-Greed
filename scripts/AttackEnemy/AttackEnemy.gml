function AttackEnemy(){
	if(!keyAttack) {
		return;
	}
	state_set_attack(states.attack);
	hspeed = 0;		//you can change this how u see fit
	vspeed = 0;
}