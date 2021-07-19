draw_clear(c_black);

if (surface_exists(main_surf)) {
	
	surface_set_target(main_surf);
			
		if (y - prev_y == 0) {
			draw_rectangle(prev_x + gr_mid,
						   prev_y - line_thickness + gr_mid,
						   x - 1 + gr_mid,
						   y + line_thickness + gr_mid,
						   false);
		} else {
			draw_rectangle(prev_x - line_thickness + gr_mid,
						   prev_y + gr_mid,
						   x + line_thickness + gr_mid,
						   y - 1 + gr_mid,
						   false);
		}
	
		draw_circle(x + gr_mid, y + gr_mid, gr_size * 0.15, false);
		
	surface_reset_target();
	
	draw_surface(main_surf, 0, 0);
} else {
	
	main_surf = surface_create(w, h);
}

draw_text(50, 50, [grid_x, grid_y]);
draw_text(50, 80, [surface_get_width(main_surf), surface_get_height(main_surf)]);