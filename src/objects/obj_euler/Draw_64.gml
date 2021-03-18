#region GUI

if (!global.graph) {
	
	draw_sprite_ext(spr_logo1, 0, 18, global.height - 12, 0.2, 0.2, 0, c_white, 1);
	draw_sprite_ext(spr_logo2, 0, global.width / 2, global.height / 2, 0.5, 0.5, 0, c_white, 1);
	draw_rectangle_color(0, global.height / 1.3, global.width, global.height / 1.3 + 10, c_rainbow, c_rainbow, c_rainbow, c_rainbow, false);
}

var col = make_color_rgb(3, 157, 91);
draw_rectangle_color(1, 1, global.width - 2, global.height - 2, col, col, col, col, true);


draw_set_font(ft_res);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (!global.graph) {
	draw_text(20, 30, "FPS: " + string(round(fps_real)));
	draw_text(20, 60, "Average FPS: " + string(round(total_fps / frames)));
	
	draw_text(20, 90, "Iterations: " + string(iterations));
	
	draw_text(20, 150, "Result 1: " + string(out));
	draw_text(20, 180, "Result 2: " + string(out2));
	draw_text(20, 210, "Result 3: " + string(out3));
	draw_text(20, 240, "Result 4: " + string(out4));

	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text(global.width - 20, global.height - 20, string(timer) +		" microseconds");
	draw_text(global.width - 20, global.height - 50, string(timer / 1000) +	" milliseconds");

	draw_set_valign(fa_top);
	draw_text(global.width - 10, 10, "V 0.16");
} else {
	
	draw_line(20, global.height - 40, global.width, global.height - 40);  // X
	draw_line(40, 0, 40, global.height - 20);  // Y
	draw_text(25, global.height - 35, "0");
}

#endregion
