// Settings
window_set_min_width(640);
window_set_min_height(480);
global.width = window_get_width();
global.height = window_get_height();
windowX = window_get_x();
windowY = window_get_y();


// Camera
camera = camera_create();
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
var pm = matrix_build_projection_ortho(global.width, global.height, 1, 32000);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;


// Smooth camera
xFrom = 0; 
yFrom = 0;
xTo = 0;
yTo = 0;
cameraLerp = 12;