currentState = [0, 0, 0, 0, 0];
currentIDs = [0, 0, 0, 0];
signal = 0;

// Add the block ID + signal to the grid position in the 2D array
gridCoords = WP_getGridPos(x, y);
WP_setValue(gridCoords[0], gridCoords[1], WP.wire_ID, signal);