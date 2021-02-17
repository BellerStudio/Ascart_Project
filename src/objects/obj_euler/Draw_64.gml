var col = make_color_rgb(3, 157, 91);
draw_rectangle_color(1, 1, width - 2, height - 2, col, col, col, col, true);


draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(20, 20, "FPS: " + string(round(fps_real)));
draw_text(20, 40, "Iterations: " + string(iterations));


draw_text(20, 80, "Result 1: " + string(out1));
draw_text(20, 100, "Result 2: " + string(out2));
draw_text(20, 120, "Result 3: " + string(out3));
draw_text(20, 140, "Result 4: " + string(out4));


draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(width - 20, height - 20, string(timer) +			" microseconds");
draw_text(width - 20, height - 40, string(timer / 1000) +	" milliseconds");