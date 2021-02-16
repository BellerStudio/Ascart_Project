// Render Grid
var render;

for (var i = 0; i < rows; i++) {
	for (var j = 0; j < cols; j++) {
		
		render = grid[i][j];
		
		if (render == 1) {
			
			draw_rectangle(j * cel, i * cel, j * cel + cel - 2, i * cel + cel - 2, false);
		}
	}
}


// Setup
var col = make_color_rgb(3, 157, 91);
draw_rectangle_color(1, 1, width - 2, height - 2, col, col, col, col, true);

draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(20, 20, "FPS: " + string(round(fps_real)));
draw_text(20, 40, "Result 1: " + string(out1));
