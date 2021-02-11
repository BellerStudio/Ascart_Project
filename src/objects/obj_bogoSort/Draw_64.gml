for(var i = 0; i < ar_size; i++) {
	
	var _one_length = width / ar_size;
	var _origin_x = i * _one_length;
	
	if (final_timer == -1) {
		if (i == pos_a) {
			var color = c_red;
		} else if (i == pos_b) {
			var color = c_lime;
		} else {
			var color = c_white;
		}
	} else {
		var color = c_white;
	}
	
	draw_rectangle_color(_origin_x, height, _origin_x + _one_length - sep, height - values_step[i], color, color, color, color, false);
}


// DRAW INFOS
draw_set_font(-1);
draw_set_valign(fa_top);

draw_set_halign(fa_left);
draw_text(10, 10, "- [Space] to restart\n- [Keypad +] to increase steps speed\n- [Keypad -] to reduce steps speed\n");

draw_set_halign(fa_right);
var _txt_w = width - 10;

draw_text(_txt_w, 10, "FPS: " + string_format(fps_real, 6, 0));
draw_text(_txt_w, 70, "Numbers: " + string(sort_number));
draw_text(_txt_w, 90, "Steps: " + string(array_length(global.sort_save) / 4));
draw_text(_txt_w, 110, "Index: " + string(ind_array + 4));
draw_text(_txt_w, 130, "Steps Duration: " + string(framerate));
draw_text(_txt_w, 150, "Sort Test: " + string(test_array));

// Timers
if (final_timer != -1) draw_text(_txt_w, 30, "Timer: " + string(final_timer / 1000000) + " seconds");
else draw_text(_txt_w, 30, "Timer: " + "...");

draw_text(_txt_w, 50, "Algo Timer: " + string(algo_timer / 1000) + " ms");