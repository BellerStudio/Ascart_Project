// Settings
window_set_min_width(640);
window_set_min_height(480);
global.width = window_get_width();
global.height = window_get_height();
window_x = window_get_x();
window_y = window_get_y();


// Setup
out = -1;
out2 = -1;
out3 = -1;
out4 = -1;
iterations = 50000;
timer = 0;
reset_timer = false;
c_rainbow = 0;
hue = 0;
hue_set = true;
surf = -1;

global.beep_on = false;
global.graph = true;
