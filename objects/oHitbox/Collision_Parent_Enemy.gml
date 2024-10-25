/// @description Insert description here
// You can write your code in this edito
/*
if(state == states.hurt || state == states.death)
	exit;
	
//attackable = false;
var _dir = point_direction(oPlayer.x, oPlayer.y, x, y);

if (ds_list_find_index(oPlayer.hitByAttack, id) == -1) {
	hp -= oPlayer.attackPower;
	ds_list_add(oPlayer.hitByAttack, id);
	state = states.hurt;
	hspeed = 0;
	vspeed = 0;
	show_debug_message("Enemy hit! Current HP: " + string(hp)); // Debug message
}
else {
    //show_debug_message("Enemy already hit, skipping damage.");
}
*/

// In oHitbox, detect collision with enemies
var _enemy = instance_place(x, y, Parent_Enemy);
if(_enemy == noone)
	exit;
if (_enemy.state != _enemy.states.hurt && _enemy.state != _enemy.states.death && ds_list_find_index(oPlayer.hitByAttack, _enemy.id) == -1) {
    // Enemy has not been hit this attack
    ds_list_add(oPlayer.hitByAttack, _enemy.id);
    _enemy.hp -= oPlayer.attackPower;
    with (_enemy) { state_set(states.hurt); }
    _enemy.hspeed = 0;
    _enemy.vspeed = 0;
    show_debug_message("Enemy hit! Current HP: " + string(_enemy.hp));
}
