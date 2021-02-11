if (!surface_exists(ascart_render_surf)) {
	if (surface_exists(ascart_copy_surf)) {
	
		var _scaler = max(string_width("F"), string_height("F"));
		var _w = surface_get_width(ascart_copy_surf) * _scaler;
		var _h = surface_get_height(ascart_copy_surf) * _scaler;
	
		ascart_render_surf = surface_create(_w, _h);
	}
} else {
	
	surface_set_target(ascart_render_surf);
	draw_clear_alpha(c_white, 0);
		
	draw_set_font(ft_ASCII);
	draw_set_halign(fa_left);
	draw_text(0, 0, draw_ascart);
	
	surface_reset_target();

	repeat(ascart_char_brightness) {
		draw_surface_stretched(ascart_render_surf, 0, 0, global.win_w, global.win_h);
	}
}

// PREVIEW
draw_set_font(-1);
draw_set_halign(fa_right);
var _text_x = global.win_w - 20;

draw_text(_text_x, 20, string(fps_real) + " FPS");
//draw_text(_text_x, 40, string(timer / 1000) + "ms");
draw_text(_text_x, 60, "Ascart Buffer : " + string(buffer_get_size(ascart_buffer)));
draw_text(_text_x, 80, "Ascart Output : " + string(buffer_get_size(ascart_out)));

if (surface_exists(ascart_copy_surf)) {
	draw_text(_text_x, 100, "Copy Surf X : " + string(surface_get_width(ascart_copy_surf)));
	draw_text(_text_x, 120, "Copy Surf Y : " + string(surface_get_height(ascart_copy_surf)));
}

draw_rectangle(0, 0, surface_get_width(ascart_copy_surf), surface_get_height(ascart_copy_surf), false);
draw_surface(ascart_copy_surf, 0, 0);