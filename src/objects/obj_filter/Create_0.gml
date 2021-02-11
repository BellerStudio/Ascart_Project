// Settings
width = 1024;
height = 576;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);
//window_set_position(0, display_get_height() - height);

// Setup
x = 0;
y = -height / 1.4;
img_speed = 3;
space_pressed = false;