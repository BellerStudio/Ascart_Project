signal = WP.maxSignal;

// Add the block ID + signal to the grid position in the 2D array
gridCoords = WP_getGridPos(x, y);
WP_setValue(gridCoords[0], gridCoords[1], WP.torch_ID, signal);