// SETUP
width = 1366;
height = 768;
array_height = height - 160;
sort_number = 7;
framerate = 5;
sep = 5;

room_width = width;
room_height = height;
window_set_size(width, height);
surface_resize(application_surface, width, height);
randomize();

// Initialize
timer = -1;
values = array_create(sort_number);
ar_size = array_length(values);
test_array = false;
pos_a = 0;
pos_b = 0;

for (var i = 0; i < ar_size; i++) {
	
	 values[i] = irandom_range(0, array_height);
	 values_step[i] = values[i];
}

timer = get_timer();
global.sort_save = array_create(0);
ind_array = 0;


// Timing
timer = get_timer();
final_timer = -1;
values = bogoSort(values);
algo_timer = get_timer() - timer;
alarm[0] = 1;