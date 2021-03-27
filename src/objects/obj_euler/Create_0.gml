// Settings
window_set_min_width(640);
window_set_min_height(480);
global.width = window_get_width();
global.height = window_get_height();
window_x = window_get_x();
window_y = window_get_y();
total_fps = 0;
frames = 0;


// Setup
iterations = 700;
out = -1;
out2 = -1;
out3 = -1;
out4 = -1;

pOut = 0.0;  // High-Precision Numbers
pOut_precision = 20;  // Number of decimals


// Timer System
timer = 0;
reset_timer = false;

// GUI
c_rainbow = 0;
hue = 0;
hue_set = true;

// Surface and Window Position
_x = 0;
_y = 0;
surf = -1;

// GUI Globals
global.beep_on = false;
global.graph = false;

// TEST
HTTP = -1;
HTTP_RES = "";


