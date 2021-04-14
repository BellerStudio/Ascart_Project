// Draw screen grid
draw_set_alpha(0.2);

var _start = global.WP_gridToLoad[0] * WP.division;
var _end = global.WP_gridToLoad[1] * WP.division;
for (var i = _start; i < _end; i += WP.division) {
	draw_line_color(i, 0, i, room_height, c_gray, c_gray);
}

_start = global.WP_gridToLoad[2] * WP.division;
_end = global.WP_gridToLoad[3] * WP.division;
for (var j = _start; j < _end; j += WP.division) {
	draw_line_color(0, j, room_width, j, c_gray, c_gray);
}

draw_set_alpha(1);