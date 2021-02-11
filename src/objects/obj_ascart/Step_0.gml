timer = get_timer();

if (surface_exists(ascart_copy_surf)) {

	if (global.update_surf) {
		
		buffer_get_surface(ascart_buffer, ascart_copy_surf, 0);

		buffer_seek(ascart_buffer, buffer_seek_start, 0);
		buffer_seek(ascart_out, buffer_seek_start, 0);

		var _ascart_list_length = array_length(ascart_list) / 256;
		var _height_rep = surface_get_height(ascart_copy_surf);
		var _width_rep = surface_get_width(ascart_copy_surf);

		repeat(_height_rep) {
			repeat(_width_rep) {
			
				var _n = buffer_read(ascart_buffer, buffer_u32);
				buffer_write(ascart_out, buffer_text, ascart_list[floor(_ascart_list_length * (_n & 255))]);
			}
		
			buffer_write(ascart_out, buffer_text, "\n");
		}

		buffer_write(ascart_out, buffer_u8, 0);
		buffer_seek(ascart_out, buffer_seek_start, 0);
		draw_ascart = buffer_read(ascart_out, buffer_string);
		
		global.update_surf = false;
	}
}

timer = get_timer() - timer;