if (!surface_exists(surf)) {
	
	surf = surface_create(width, height);
} else {
	
	surface_set_target(surf);
	
	var seq_len = array_length(golomb_array);
	var biggest = golomb_array[seq_len - 1];
	
	if (refresh) {
		
		for (var i = 0; i < seq_len; i++) {
		
			var _x, _y, multi = (height - offset) / biggest;
		
			_x = i * ((width - offset) / seq_len);
			_y = height - golomb_array[i] * multi;
		
			draw_circle(_x + offset / 2, _y - offset / 2, 2, true);
		}
		
		refresh = false;
	}
	
	surface_reset_target();
	draw_surface(surf, 0, 0);
	
	
	draw_text(20, 20, "FPS: " + string(fps_real));
	draw_text(20, 40, "Iterations: " + string(golomb_number));
	draw_text(20, 60, "Timer: " + string(timer));
	draw_text(20, 80, "Press [Space] to refresh");
	draw_text(20, 100, "Press [+] to add 100 iterations");
	draw_text(20, 120, "Press [-] to remove 100 iterations");
}