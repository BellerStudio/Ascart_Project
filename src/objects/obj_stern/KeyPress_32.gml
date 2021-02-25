stern_array = Stern_diatomic(stern_number, false);

if (surface_exists(surf)) {
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

refresh = true;