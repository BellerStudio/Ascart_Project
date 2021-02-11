// Reset random
for (var i = 0; i < ar_size; i++) {
	
	values[i] = irandom_range(0, array_height);
	values_step[i] = values[i];
}

// Initialize
timer = get_timer();
test_array = false;
final_timer = -1;
global.sort_save = array_create(0);

ind_array = 0;

values = bogoSort(values);
algo_timer = get_timer() - timer;
alarm[0] = 1;