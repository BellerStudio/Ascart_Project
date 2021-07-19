if (!grid[floor(cols / 2)][floor(rows / 2)]) {
	
	grid[floor(cols / 2)][floor(rows / 2)] = true;
}


var dirLen = array_length(directions);
var validDirs = [];

for (var i = 0; i < dirLen; i++) {
	
	var currDir = directions[i];
	var newX = grid_x + currDir[0];
	var newY = grid_y + currDir[1];
	
	if (newX >= 0 && newX < cols) {
		if (newY >= 0 && newY < rows) {
			if (!grid[newX][newY]) {
				array_push(validDirs, currDir);
			}
		}
	}
}

if (array_length(validDirs) > 0 ) {
	
	var step = array_random(validDirs);	
	grid_x += step[0][0];
	grid_y += step[0][1];
	grid[grid_x][grid_y] = true;
	
	prev_x = x;
	prev_y = y;
	x = grid_x * gr_size;
	y = grid_y * gr_size;
}