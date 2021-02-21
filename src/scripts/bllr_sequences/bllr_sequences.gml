function stern_diatomic(n, mode) {

	var table = array_create(n + 1);
	var biggest = 0;
	
	table[0] = 0;
	table[1] = 1;
	
	for (var i = 2; i <= n; i++) {
		
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


function golomb_sequence(n) {
	
	var table = array_create(n + 1);
	
	table[1] = 1;
	
	for (var i = 2; i <= n; i++) {
		table[i] = 1 + table[i - table[table[i - 1]]];
	}
	
	return table;
}


function syracuse(n, mode) {
	
	if (mode) {
		var results = [n];	
	} else {
		var results = 1;	
	}
	
	while (n > 1) {
		
		if (n % 2 == 0) {
			n /= 2;
			
			if (mode) {
				var seq_len = array_length(results);	
				results[seq_len] = n;
			}
		} else {
			n = n * 3 + 1;
			
			if (mode) {
				var seq_len = array_length(results);	
				results[seq_len] = n;
			}
		}
		
		if (!mode) {
			results++;
		}
	}
	
	return results;
}


function fibonacci(n) {
	
	var calc = n - 2, a = 1, b = 1, temp;
	
	if (n <= 1) {
		
		return n;
	} else {
		
		repeat(calc) {
			
			temp = a;
			a = b;
			b = temp + b;

		}
		
		return b;
	}
}


// FORM: (1 -> Triangle, 2 -> Pentagon, 3 -> Hexagon) | MODE: true -> Return a list
function geom_numbers(n, form, mode) {

	if (mode == true) var list = array_create(n);
	else var number = 0;
	
	if (mode == true) {
		
		var k;
		for (var i = 0; i < n; i++) {
		
			k = i + 1;
			if (form == 1) list[i] = (k * (k + 1)) / 2;
			else if (form == 2) list[i] = (k * (3 * k - 1)) / 2;
			else if (form == 3) list[i] = k * (2 * k - 1);
		}
	} else {
			
		if (form == 1) number = (n * (n + 1)) / 2;
		else if (form == 2) number = (n * (3 * n - 1)) / 2;
		else if (form == 3) number = n * (2 * n - 1);
	}
	
	if (mode == true) return list;
	else return number;
}


// Return if a number is a Lychrel number (Supposed Lychrel if there's more than 50 iterations (< 10000))
function lychrel_50(n) {
	
	for (var i = 0; i < 50; i++) {
		
		n += number_reverse(n);
		
		if (is_palindrome(n)) {
			
			return true;
		}
	}
	
	return false;
}