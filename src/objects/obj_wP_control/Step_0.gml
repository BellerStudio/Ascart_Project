// Mouse grid position update
global.WP_mouseGridNumber[0] = mouse_x div WP.division;
global.WP_mouseGridNumber[1] = mouse_y div WP.division;
global.WP_mouseGrid[0] = global.WP_mouseGridNumber[0] * WP.division;
global.WP_mouseGrid[1] = global.WP_mouseGridNumber[1] * WP.division;


// Get the current ID where the mouse is
global.WP_currentGridID = global.WP_gridArray[global.WP_mouseGridNumber[1], global.WP_mouseGridNumber[0]];


if (mouse_check_button_pressed(mb_left)) {
	
	// Update the grid
	//global.WP_gridUpdate = true;
	//alarm[0] = 2;
	
	if (global.WP_currentGridID == "0-0") {
		
		// Create the instance
		instance_create_layer(global.WP_mouseGrid[0], global.WP_mouseGrid[1], "layer_wP", obj_wP_wire);
	}
}