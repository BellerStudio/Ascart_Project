var neighbors = 0, state;

for (var i = 0; i < rows; i++) {
	for (var j = 0; j < cols; j++) {
		
		state = grid[i][j];
		
		neighbors = countNeighbors(grid, i, j, rows, cols);
		
		if (state == 0 && neighbors == 3) {
			
			next[i][j] = 1;
		} else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
			
			next[i][j] = 0;
		} else {
			
			next[i][j] = state;
		}
	}
}

grid = next;