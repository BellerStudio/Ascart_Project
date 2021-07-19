// Reset & Restart

grid = array_2D(cols + 1, rows + 1, false);

prev_x = 0;
prev_y = 0;
grid_x = floor(cols / 2);
grid_y = floor(rows / 2);
x = grid_x * gr_size;
y = grid_y * gr_size;

main_surf = surface_create(w, h);