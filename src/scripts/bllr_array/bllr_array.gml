// Create a 2D array with cols & rows
function array_2D(cols, rows, datatype) {
	
	var grid = array_create(cols, datatype);
	for (var n = 0; n < cols; n++) {
	
		grid[n] = array_create(rows, datatype);
	}
	
	return grid;
}


// Shuffle an array and save every steps in an array (To visualize an algorithm)
global.sort_save = array_create(0);
function array_shuffle(array) {
	
	var j, k;
	var size = array_length(array);
	for (var i = 0; i < size; i++) {
		
	    j = irandom_range(i, size - 1)
	    if (i != j) {
	        k = array[i]
	        array[@ i] = array[j]
	        array[@ j] = k
			
			// Save the steps into an array
			var save_size = array_length(global.sort_save);
			global.sort_save[save_size + 0] = i;
			global.sort_save[save_size + 1] = array[i];
			global.sort_save[save_size + 2] = j;
			global.sort_save[save_size + 3] = array[j];
	    }
	}
}


// Swap two values and save every steps in an array (To visualize an algorithm)
function com_swap(array, a, b) {
	
	var temp = array[a];
	array[a] = array[b];
	array[b] = temp;
	
	// Save the steps into an array
	var save_size = array_length(global.sort_save);
	global.sort_save[save_size + 0] = a;
	global.sort_save[save_size + 1] = array[a];
	global.sort_save[save_size + 2] = b;
	global.sort_save[save_size + 3] = array[b];
	
	return array;
}


// Check if an array is sorted (Ascending)
function array_sorted_ascend(array) {
	
	var size = array_length(array);
	var _min = 0;
	
	for (var i = 0; i < size; i++) {
		
		if (array[i] >= _min) {
			_min = array[i];	
		} else {
			return false;
		}
	}
	return true;
}


// Swap two values in an array (by reference)
function swap(array, a, b) {
	
	var temp = array[a];
	array[@ a] = array[b];
	array[@ b] = temp;
}


// Quicksort algorithm (Not as fast as array_sort())
function quickSort(array, start, _end) {
	
	if (start >= _end) {
		
		return array;
	}
	
	var temp = QS_partition(array, start, _end);
	
	array = temp[0];
	var index = temp[1];
	
	quickSort(array, start, index - 1);
	quickSort(array, index + 1, _end);
	
	return array;
}


// Yeah, Bogo sorting ... don't try with more than 7 numbers
function bogoSort(array) {
	
	while (!array_sorted_ascend(array)) {
		
		array_shuffle(array);
	}
	
	return array;
}


// Load a text file into an array
// Mode: True -> lines, Mode: False -> chars
function open_txt(filename, mode) {
	
	var txt = file_text_open_read(filename);
	var line, line_len;
	var array = [];
	
	while (!file_text_eof(txt)) {
	
		line = file_text_read_string(txt);
		
		if (mode) {
			
			array_push(array, line);
		} else {
			
			line_len = string_length(line);
			for (var i = 1; i <= line_len; i++) {
				array_push(array, string_char_at(line, i));
			}
		}
	
		file_text_readln(txt);
	}

	file_text_close(txt);
	return array;
}


function DLA_particles(width, height) {
		
	var _x = 0, _y = 0;
	
	var array = array_create(width * 2);
	
	while (_x < width) {
		
		_y = irandom_range(-1, 1);
		_x++;
		
		array[_x] = _x;
		array[_x + 1] = _y;
	}
	
	return array;
}


// Reverse an array between two values
function array_reverse(array, a, b) {
	
	while (a < b) {
		
		swap(array, a, b);
		a++;
		b--;
	}
}


// Converts an array into a string
function array_to_string(array) {
	
	var str = "";
	var len = array_length(array);
	for (var i = 0; i < len; i++) {
		
		str += array[i];
	}
	
	return str;
}


// Function to return gcd of a and b
function GCD(a, b) {
	
	if (a == b) {
		
		return b;
	}
	
	return GCD(b % a, a);
}


// Function to find gcd of array of
// numbers
function find_GCD(array, n) {
	
    var result = array[0];
    for (var i = 1; i < n; i++) {
		
        result = GCD(array[i], result);
 
        if(result == 1) {
			
			return 1;
        }
    }
	
    return result;
}


// Returns the min and the max values of the array
function array_min_max(array) {
	
	array_sort(array, true);
	return[array[0], array_pop(array)];
}


// Returns an array multiplied by a scalar
function array_multiply(array, scalar) {
	
	var len = array_length(array);
	var i = 0;
	
	repeat(len - 1) {
		
		array[i] *= scalar;
		i++;
	}
	
	return array;
}


function files_list(directory, file_type) {
	
	var i = 0;
	var filesArray = [];
	var fileName = file_find_first(directory + "*." + file_type, fa_directory);
	
	while (fileName != "") {
		
		filesArray[i] = fileName;
		fileName = file_find_next();
		i++;
	}
	
	return filesArray;
}































