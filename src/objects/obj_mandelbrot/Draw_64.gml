if (!surface_exists(mandel_surf)) {
	mandel_surf = surface_create(width, height);	
} else {
	
	var _scale = max(room_width, room_height) / max(width, height);
	draw_surface_ext(mandel_surf, 0, 0, _scale, _scale, 0, c_white, 1);
	draw_surface_ext(mandel_surf, 0, height * _scale, _scale, -_scale, 0, c_white, 1);
}

draw_set_font(-1);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var _txt_w = room_width - 10;
draw_text(_txt_w, 10, "FPS: " + string_format(fps_real, 6, 0));
draw_text(_txt_w, 25, "Timer: " + string(timer));