up_key = keyboard_check_pressed(vk_up);
down_key= keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//Store number of options in current menu
op_length = array_length(option[menu_level]);

//move through menu
pos += down_key - up_key;
if pos >= op_length {pos = 0}
if pos < 0 {pos = op_length-1}

//using options
if accept_key {
	
	var _sml = menu_level; //sml = start menu level
	
	switch(menu_level) {

	//pause menu
	case 0:
		switch(pos) {
			//start game	
			case 0: room_goto_next(); break;
			//settings
			case 1: menu_level = 1; break;  
			//Quit Game	
			case 2: break;
				}
			break;
		
	//settings
			case 1:  
				switch(pos) {
					//Controls
					case 0:
				
						break;
					//Brightness
					case 1:
				
						break;
					//Window Size
					case 2:
				
						break;
					//Back
					case 3:
						menu_level = 0;
						break;
				}
			break;
		}
		
	//set position back
	if _sml != menu_level {pos = 0};

	//correct option length
	op_length = array_length(option[menu_level]);

}