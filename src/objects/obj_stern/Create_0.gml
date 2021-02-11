// Settings
width = 1366;
height = 768;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);


// Setup
stern_number = 4000;
stern_array = stern_diatomic(stern_number, false);
timer = 0;
refresh = true;
surf = -1;