if (global.WP_gridUpdate) {
	
	// currentState : ACTIVESAROUND UP DOWN LEFT RIGHT
	gridCoords = WP_getGridPos(x, y);
	currentState = WP_getSignal(gridCoords[0], gridCoords[1]);
	currentIDs = WP_getID(gridCoords[0], gridCoords[1], true);
	
	signal = clamp(currentState[1] - 1, 0, WP.maxSignal);
	WP_setValue(gridCoords[0], gridCoords[1], WP.wire_ID, signal);
}