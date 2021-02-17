function countNeighbors(grid, _x, _y, rows, cols) {
	
	var sum = 0, row, col;
		
	for (var i = -1; i < 2; i++) {
		for (var j = -1; j < 2; j++) {
			
			row = (_x + i + rows) % rows;
			col = (_y + j + cols) % cols;

			sum += grid[row][col];
		}
	}
	
	sum -= grid[_x][_y];
	
	return sum;
}