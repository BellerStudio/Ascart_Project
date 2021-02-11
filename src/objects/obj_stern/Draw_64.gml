if (!surface_exists(surf)) {
	
	surf = surface_create(width, height);
} else {
	
	surface_set_target(surf);
	
	if (refresh) {
		timer = get_timer();
		
		var biggest = stern_array[0];
		var array = stern_array[1];
		var seq_len = array_length(array);
		
		for(var j = 0; j < seq_len; j++) {
	
			var _x, _y, multi;

			multi = height / biggest;
			_x = j * (width / stern_number)
			_y = height - (array[j] * multi);
	
			draw_circle(_x, _y, 1, true);
		}
		
		timer = get_timer() - timer;
		refresh = false;
	}
	
	surface_reset_target();
	draw_surface(surf, 0, 0);	
}


draw_text(20, 20, "FPS: " + string(fps_real));
draw_text(20, 40, "Iterations: " + string(stern_number));
draw_text(20, 60, "Timer: " + string(timer));
draw_text(20, 80, "Press [Space] to refresh");
draw_text(20, 100, "Press [+] to add 100 iterations");
draw_text(20, 120, "Press [-] to remove 100 iterations");