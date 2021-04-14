// EDIT : THE ROOM NEEDS TO HAVE A SQUARE SIZE

// Constants
enum WP {
	
	division = 64,
	room_size = 4096,
	chunkLoad = 4,  // Numbers of boxes to load around the screen
	maxSignal = 15,
	
	// Blocks IDs
	wire_ID = 1,
	torch_ID = 2
}

global.WP_gridUpdate = true;  // True when the wire/blocks state needs to be updated
global.WP_mouseGrid = [0, 0];  // Mouse grid coords
global.WP_mouseGridNumber = [0, 0];  // Mouse grid number (grid not multiplied by the division)
global.WP_currentGridID = 0;  // Returns the current ID of the block where the mouse is
global.WP_gridToLoad = [0, 0, 0, 0];  // Returns the first grid box to load and the number of boxes (For X and Y)

// Screen grid for blocks
var rm_size = WP.room_size div WP.division;
global.WP_gridArray = array_2D(rm_size, rm_size, "0-0");


// /!\ X AND Y NEEDS TO BE REVERSED IN THE GRID POSITION IN THE FUNCTIONS, NOT IN THE CODE.
// EVERY X AND Y IN FUNCTIONS NEEDS TO BE GRID COORDINATES


// Returns the current position in the grid
function WP_getGridPos(_x, _y) {	
	
	return [_x div WP.division, _y div WP.division];
}


// Split the values in a grid box into two values in an array ("1-15" -> [1, 15])
// Mode can be "all", "ID", "signal"
function WP_getValue(_x, _y, mode) {
	
	var str = global.WP_gridArray[_y, _x];
	var delimiter_pos = string_pos("-", str);

	switch (mode) {
		
		case "all":
			var split_ID = string_copy(str, 1, delimiter_pos - 1);
			var split_signal = string_copy(str, delimiter_pos + 1, string_length(str) - delimiter_pos);
			return [real(split_ID), real(split_signal)];
			break;
		
		case "ID":
			var split_ID = string_copy(str, 1, delimiter_pos - 1);
			return real(split_ID);
			break;
		
		case "signal":
			var split_signal = string_copy(str, delimiter_pos + 1, string_length(str) - delimiter_pos);
			return real(split_signal);
			break;
	}
}


// Set the value in the array (Format: ID-signal)
function WP_setValue(_x, _y, ID, signal) {
	
	global.WP_gridArray[_y, _x] = string(ID) + "-" + string(signal);
}


// Get the signal strength of the 4 blocks around the current block
// currentState : ACTIVESAROUND UP DOWN LEFT RIGHT
function WP_getSignal(_x, _y) {
	
	var currentState = [0, 0, 0, 0, 0];
	var w = _x;
	var h = _y;
	var maxLEN = (WP.room_size div WP.division - 1);
	
	if (h-1 >= 0	  && global.WP_gridArray[h-1, w  ] != 0) { currentState[1] = WP_getValue(w, h-1, "signal"); currentState[0]++; }
	if (h+1 <= maxLEN && global.WP_gridArray[h+1, w  ] != 0) { currentState[2] = WP_getValue(w, h+1, "signal"); currentState[0]++; }
	if (w-1 >= 0	  && global.WP_gridArray[h  , w-1] != 0) { currentState[3] = WP_getValue(w-1, h, "signal"); currentState[0]++; }
	if (w+1 <= maxLEN && global.WP_gridArray[h  , w+1] != 0) { currentState[4] = WP_getValue(w+1, h, "signal"); currentState[0]++; }
	
	return currentState;
}


// Get the ID of the 4 blocks around the current block
// currentIDs : UP DOWN LEFT RIGHT
// booleans : True returns booleans, false returns IDs
function WP_getID(_x, _y, booleans) {
	
	var currentID = [0, 0, 0, 0];
	var w = _x;
	var h = _y;
	var maxLEN = (WP.room_size div WP.division - 1);
	
	if (h-1 >= 0	  && global.WP_gridArray[h-1, w  ] != 0) { currentID[0] = WP_getValue(w, h-1, "ID"); }
	if (h+1 <= maxLEN && global.WP_gridArray[h+1, w  ] != 0) { currentID[1] = WP_getValue(w, h+1, "ID"); }
	if (w-1 >= 0	  && global.WP_gridArray[h  , w-1] != 0) { currentID[2] = WP_getValue(w-1, h, "ID"); }
	if (w+1 <= maxLEN && global.WP_gridArray[h  , w+1] != 0) { currentID[3] = WP_getValue(w+1, h, "ID"); }
	
	if (booleans) {
		for (var i = 0; i < 4; i++) {
			if (currentID[i] != 0) currentID[i] = true;
			else currentID[i] = false; 
		}
	}
	
	return currentID;
}

















