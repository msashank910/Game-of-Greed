// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Controller(){
	// Input handling
	keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
	keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
	keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
	keyActivate = keyboard_check_pressed(vk_space);  // Space bar for rolling
	keyAttack = keyboard_check_pressed(vk_shift);
	keyItem = keyboard_check_pressed(vk_control);
	
	inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
	inputMagnitude = (keyRight - keyLeft != 0) or (keyDown - keyUp != 0);  // Check if any movement keys are pressed
}