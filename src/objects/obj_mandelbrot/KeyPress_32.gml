timer = get_timer();

buffer_seek(mandel_buffer, buffer_seek_start, 0);

for (var i = 0; i < mandel_mirror; i++) {
	for (var j = 0; j < height; j++) {

		var b = map(i, 0, width, -2, 2);
		var a = map(j, 0, height, -2, 2);

		var ca = a;
		var cb = b;

		var n = 0;

		while(n < max_it) {
			var aa = (a * a - b * b);
			var bb = (2 * a * b);
			a = aa + ca;
			b = bb + cb;
			
			if (abs(a + b) > 16) {
				break;
			}
			
			n++;
		}

		var _v = (255 * n) / max_it;
		var _brightness = make_color_hsv(_v, 255, 255);
		
		if (n == max_it) {
			_brightness = 0;
		}
		
		buffer_write(mandel_buffer, buffer_u8, color_get_red(_brightness));
		buffer_write(mandel_buffer, buffer_u8, color_get_green(_brightness));
		buffer_write(mandel_buffer, buffer_u8, color_get_blue(_brightness));
		buffer_write(mandel_buffer, buffer_u8, 255);
	}
}

updatePixels(mandel_buffer, mandel_surf, 0);

timer = get_timer() - timer;