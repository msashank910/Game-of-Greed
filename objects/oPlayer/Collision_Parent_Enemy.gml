/// @description Insert description here
// You can write your code in this editor

if(invincibleTimer > 0) {
	exit;	
}

invincibleTimer = 60;
oPlayer.hp -= Parent_Enemy.attack;

show_debug_message("Hit by Enemy! Health: " + string(oPlayer.hp));

