while (steps < max_steps) {
	var next = index - count;

	if (next < 0 || numbers[next]) {
		next = index + count;	
	}

	numbers[next] = true;
	index = next;
	
	var seq_len = array_length(sequence);
	sequence[seq_len] = index;
	
	count++;
	steps++;
}