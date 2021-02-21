if (reset_timer) {
	
	timer = get_timer() - timer;
	if (global.beep_on) audio_play_sound(snd_beep, 10, false);	
	reset_timer = false;
}

var _w = window_get_width();
var _h = window_get_height();
var _x = window_get_x();
var _y = window_get_y();

if (_w != global.width) || (_h != global.height) {
	
    surface_resize(application_surface,_w,_h);
    display_reset(0,0);
    global.width = _w;
    global.height = _h;
}

window_x = _x;
window_y = _y;


if (!surface_exists(surf)) {
	
	surf = surface_create(global.width, global.height);	
}



if (hue < 0) hue_set = true;	
if (hue > 255) hue_set = false;
if (hue_set) hue++;	
else hue--;
c_rainbow = make_color_hsv(hue, 255, 255);