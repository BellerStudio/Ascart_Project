// Parameters
w = 1440;
h = 1440;
gr_size = 32;
line_thickness = 2;

// Setup
gr_mid = gr_size / 2;
cols = w / gr_size;
rows = h / gr_size;
grid = array_2D(cols + 1, rows + 1, false);
directions = [[1, 0], [-1, 0], [0, 1], [0, -1]];

prev_x = 0;
prev_y = 0;
grid_x = floor(cols / 2);
grid_y = floor(rows / 2);
x = grid_x * gr_size;
y = grid_y * gr_size;

main_surf = surface_create(w, h);