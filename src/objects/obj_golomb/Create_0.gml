// Settings
width = 1366;
height = 768;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);


// Setup
timer = get_timer();
golomb_number = 100;
golomb_array = Golomb(golomb_number);
timer = get_timer() - timer;

refresh = true;
surf = -1;
offset = 40;