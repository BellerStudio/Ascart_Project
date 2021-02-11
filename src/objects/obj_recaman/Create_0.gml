// Settings
width = 1366;
height = 768;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);

// Setup
numbers = [true];
count = 0;
index = 0;
steps = 0;
max_steps = 1000;
sequence = array_create(max_steps);

draw_once = false;
surf = -1;