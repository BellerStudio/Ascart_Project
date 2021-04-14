var _w = window_get_width();
var _h = window_get_height();

if (_w != global.width) || (_h != global.height) {
	
    surface_resize(application_surface, _w, _h);
    display_reset(0, 0);
    global.width = _w;
    global.height = _h;
	
	// Resize camera
	var pm = matrix_build_projection_ortho(global.width, global.height, 1, 32000);
	camera_set_proj_mat(camera, pm);
}

windowX = window_get_x();
windowY = window_get_y();


// Smooth camera
var mouseX = display_mouse_get_x();
var mouseY = display_mouse_get_y();

if (mouse_check_button_pressed(mb_middle)) {
	
	// Save coords when middle button is clicked
	xFrom = x + mouseX;
	yFrom = y + mouseY;
}

if (mouse_check_button(mb_middle)) {
	
	// Relative coords
	xTo = xFrom - mouseX;
	yTo = yFrom - mouseY;
}

x += (xTo - x) / cameraLerp;
y += (yTo - y) / cameraLerp;

// Block camera from going outside of the window
var cameraMax = [global.width / 2, global.height / 2];
x = clamp(x, cameraMax[0], room_width - cameraMax[0]);
y = clamp(y, cameraMax[1], room_height - cameraMax[1]);

// Apply the new view matrix
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);


// First X and Y grid boxes to load (UP-LEFT)
global.WP_gridToLoad[0] = max(0, (x - cameraMax[0]) div WP.division - WP.chunkLoad);
global.WP_gridToLoad[2] = max(0, (y - cameraMax[1]) div WP.division - WP.chunkLoad);

// Last X and Y grid boxes to load (DOWN-RIGHT)
var rm_size = WP.room_size div WP.division;
global.WP_gridToLoad[1] = min(rm_size, global.WP_gridToLoad[0] + (global.width div WP.division) + WP.chunkLoad * 2);
global.WP_gridToLoad[3] = min(rm_size, global.WP_gridToLoad[2] + (global.height div WP.division) + WP.chunkLoad * 2);























