// SETTINGS
width = 1024;
height = 1024;
timer = 0;
room_width = 1024;
room_height = 1024;
window_set_size(1024, 1024);
surface_resize(application_surface, 1024, 1024);


// BUFFERS
var _ascart_buff_size = round(width * height * 4);
mandel_buffer = buffer_create(_ascart_buff_size, buffer_fast, 1);


// MANDELBROT
mandel_surf = -1;
max_it = 1024;
mandel_mirror = width / 2;