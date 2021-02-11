function map(val, start1, end1, start2, end2) {
	
	var prop = (val - start1) / (end1 - start1);
	return prop * (end2 - start2) + start2;
}


function array_shuffle(array) {
	
	var j, k;
	var size = array_length(array);
	for (var i = 0; i < size; i++) {
		
	    j = irandom_range(i, size - 1)
	    if (i != j) {
	        k = array[i]
	        array[i] = array[j]
	        array[j] = k
			
			var save_size = array_length(global.sort_save);
			global.sort_save[save_size + 0] = i;
			global.sort_save[save_size + 1] = array[i];
			global.sort_save[save_size + 2] = j;
			global.sort_save[save_size + 3] = array[j];
	    }
	}
	
	return array;
}


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


function swap(array, a, b) {
	
	var temp = array[a];
	array[a] = array[b];
	array[b] = temp;
	
	var save_size = array_length(global.sort_save);
	global.sort_save[save_size + 0] = a;
	global.sort_save[save_size + 1] = array[a];
	global.sort_save[save_size + 2] = b;
	global.sort_save[save_size + 3] = array[b];
	
	return array;
}


function partition(array, start, _end) {
	var pivotIndex = start;
	var pivotValue = array[_end];
	
	for(var i = start; i < _end; i++) {
		
		if (array[i] < pivotValue) {
			array = swap(array, i, pivotIndex);
			pivotIndex++;
		}
	}
	
	array = swap(array, pivotIndex, _end);
	
	return [array, pivotIndex];
}


function quickSort(array, start, _end) {
	if (start >= _end) {
		return;
	}
	
	var temp = partition(array, start, _end);
	
	array = temp[0];
	var index = temp[1];
	
	quickSort(array, start, index - 1);
	quickSort(array, index + 1, _end);
	
	return array;
}


function bogoSort(array) {
	
	while(!array_sorted_ascend(array)) {
		array = array_shuffle(array);
	}
	
	return array;
}


function gmSort(array, ascend) {
	
    var list = ds_list_create();
    var count = array_length(array);
	
    for (var i = 0; i < count; i++) list[| i] = array[i];
	
    ds_list_sort(list, ascend);
	
    for (i = 0; i < count; i++) array[i] = list[| i];
	
    ds_list_destroy(list);
    return array;
}


function nth_root(x, n) {
	return power(x, (1/n));
}


function stern_diatomic(n, mode) {

	var table = array_create(n + 1);
	var biggest = 0;
	
	table[0] = 0;
	table[1] = 1;
	
	for(var i = 2; i <= n; i++) {
		
		if (i % 2 == 0) {
			table[i] = table[i / 2];
		} else {
			table[i] = table[(i - 1) / 2] + table[(i + 1) / 2];
		}
		
		if (table[i] > biggest) {
			biggest = table[i];
		}
	}

	if (mode) {
		return table[n];
	} else {
		return [biggest, table];
	}
}











































