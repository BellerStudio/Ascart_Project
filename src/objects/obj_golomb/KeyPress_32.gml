timer = get_timer();
golomb_array = golomb_sequence(golomb_number);
timer = get_timer() - timer;

if (surface_exists(surf)) {
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

refresh = true;