// CONFIG
application_surface_draw_enable(false);
global.win_w = window_get_width();
global.win_h = window_get_height();

ascart_list = ["  ", ". ", "^ ", ": ", "- ", "= ", "* ", "# ", "& ", "8 ", "% ", "B ", "@ ", "$ "];
draw_ascart = "";

// Buffers
var _ascart_buff_size = round(window_get_width() * window_get_height() * 4);
ascart_buffer = buffer_create(_ascart_buff_size, buffer_grow, 1);

var _ascart_out_size = buffer_get_size(ascart_buffer) * .25 + sprite_get_height(spr_ascart_image) + 1;
ascart_out = buffer_create(_ascart_out_size, buffer_wrap, 1);

// Surfaces
ascart_copy_surf = -1;
ascart_render_surf = -1;
global.update_surf = true;

// Quality
ascart_quality = 0.5;
ascart_char_brightness = 2;

// Shaders
ascart_contrast = 2;
ascart_contrast_unif = shader_get_uniform(shd_saturation, "contrast");
ascart_saturation = 0;
ascart_saturation_unif = shader_get_uniform(shd_saturation, "saturation");


// TEST PHASE
timer = -1;