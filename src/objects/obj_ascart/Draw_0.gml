draw_set_font(ft_ASCII);
var _scaler = max(string_width("F"), string_height("F"));

var _w = floor((global.win_w / _scaler) / ascart_quality);
var _h = floor((global.win_h / _scaler) / ascart_quality);

if (!surface_exists(ascart_copy_surf)) {

	ascart_copy_surf = surface_create(_w, _h);
} else {
	
	surface_set_target(ascart_copy_surf);
	
	shader_set(shd_saturation);
	shader_set_uniform_f(ascart_contrast_unif, ascart_contrast);
	shader_set_uniform_f(ascart_saturation_unif, ascart_saturation);
	draw_surface_stretched(application_surface, 0, 0, _w, _h);
	shader_reset();
	
	surface_reset_target();
}