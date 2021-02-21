// Settings
width = 1344;
height = 768;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);
randomize();

// Setup
cel = 64;
cols = width div cel;
rows = height div cel;

grid = make_2D_array(cols, rows);

for (var i = 0; i < rows; i++) {
	for (var j = 0; j < cols; j++) {
		
		grid[i][j] = irandom_range(0, 1);
	}
}

next = grid;