var save_size = array_length(global.sort_save);

pos_a = global.sort_save[ind_array + 0];
var val_a = global.sort_save[ind_array + 1];
pos_b = global.sort_save[ind_array + 2];
var val_b = global.sort_save[ind_array + 3];
	
values_step[pos_a] = val_a;
values_step[pos_b] = val_b;


if (ind_array < save_size - 4) {
	ind_array += 4;
	alarm[0] = framerate;
} else {
	final_timer = get_timer() - timer;
	test_array = array_sorted_ascend(values_step);
}