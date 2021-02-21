x = global.width / 2;

if (!global.graph) y = global.height - 20;
else y = sprite_height;


if (position_meeting(window_mouse_get_x(), window_mouse_get_y(), self)) {

	if (mouse_check_button(mb_left)) state = 2;
	else state = 1;

	if (mouse_check_button_pressed(mb_left)) {
		
		if (button_switch) button_switch = false;
		else button_switch = true;
	}

} else state = 0;


if (button_switch) {
	
	image_index = 2;
	global.graph = true;
} else {
	image_index = state;
	global.graph = false;	
}