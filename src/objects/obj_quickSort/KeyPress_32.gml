// Reset random
for (var i = 0; i < ar_size; i++) {
	
	values[i] = irandom_range(0, array_height);
	values_step[i] = values[i];
}

// Initialize
test_array = false;
final_timer = -1;
global.sort_save = array_create(0);
ind_array = 0;

timer = get_timer();
values = quickSort(values, 0, ar_size - 1);
algo_timer = get_timer() - timer;

alarm[0] = 1;