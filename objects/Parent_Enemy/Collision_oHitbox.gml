/// @description Insert description here
// You can write your code in this editor
if(!attackable)
	exit;
	
//attackable = false;
var _dir = point_direction(oPlayer.x, oPlayer.y, x, y);

hp -= oPlayer.attackPower;