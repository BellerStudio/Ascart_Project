draw_set_font(ft_res);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x + 2, y + 2, currentState[0]);


var middleX = x + WP.division / 2;
var middleY = y + WP.division / 2;
var rad = 5;

var color = make_color_rgb(100 + round((155 / WP.maxSignal) * signal), 0, 0);
draw_set_color(color);


// CIRCLE
if (!((currentIDs[0] && currentIDs[1]) || (currentIDs[2] && currentIDs[3]))) {
	
	draw_circle(middleX, middleY, rad*2, false);
}

// UP
if (currentIDs[0] > 0) {
	draw_rectangle(middleX - rad, y, middleX + rad, middleY, false);
}

// DOWN
if (currentIDs[1] > 0) {
	draw_rectangle(middleX - rad, middleY, middleX + rad, y + WP.division, false);
}

// LEFT
if (currentIDs[2] > 0) {
	draw_rectangle(x, middleY - rad, middleX, middleY + rad, false);
}

// RIGHT
if (currentIDs[3] > 0) {
	draw_rectangle(middleX, middleY - rad, x + WP.division, middleY + rad, false);
}

draw_set_color(c_white);










