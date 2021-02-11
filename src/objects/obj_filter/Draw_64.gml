draw_sprite(spr_board, 0, x, y);

draw_set_color(c_black);
draw_rectangle(0, 0, width, height / 2 - 10, false);
draw_rectangle(0, height / 2, width, height, false);
draw_set_color(c_white);

if (!space_pressed) {
	draw_rectangle(0, height / 2 - 10, width, height / 2, true);
}

draw_text(20, 20, "FPS: " + string(fps_real));