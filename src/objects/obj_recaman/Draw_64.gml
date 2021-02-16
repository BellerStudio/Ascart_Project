var seq_len = array_length(sequence);


if (!surface_exists(surf)) {
	surf = surface_create(width, height);	
} else {
	
	surface_set_target(surf);
	
	if (!draw_once) {
		for (var i = 1; i < seq_len - 1; i++) {
		
			var index, next, _x, radius, abs_rad;
	
			index = sequence[i];
			next = sequence[i + 1];
	
			var scale = 0.2;
	
			index *= scale;
			next *= scale;
	
			radius = (next - index) / 2;
			_x = index + radius;
			abs_rad = abs(radius);
	
			if (i % 2 == 0) {
				abs_rad = -abs_rad;	
			}

			draw_arc(_x, height / 2, abs_rad, 64);
		}
		draw_once = true;
	}
	
	surface_reset_target();
	draw_surface(surf, 0, 0);
}

draw_text(20, 20, "FPS: " + string(fps_real));
draw_text(20, 40, "Iteration: " + string(count));