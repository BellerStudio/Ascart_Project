function Stern_diatomic(n, mode) {

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


function Golomb(n) {
	
	var table = array_create(n + 1);
	
	table[1] = 1;
	
	for (var i = 2; i <= n; i++) {
		table[i] = 1 + table[i - table[table[i - 1]]];
	}
	
	return table;
}


function Syracuse(n, mode) {
	
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


function Fibonacci(n) {
	
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


function Poly_numbers(n, format) {

	var list = array_create(n);

	for (var i = 0; i < n; i++) {

		switch (format) {
			
			case 3:
				list[i] = (i * (i + 1)) / 2;
				break;
			
			case 4:
				list[i] = sqr(i);
				break;
			
			case 5:
				list[i] = (i * (3 * i - 1)) / 2;
				break;
			
			case 6:
				list[i] = i * (2 * i - 1);
				break;
			
			case 7:
				list[i] = i * (5 * i - 3) / 2;
				break;
			
			case 8:
				list[i] = i * (3 * i - 2);
				break;
		}
	}

	return list;
}


// Return if a number is a Lychrel number (Supposed Lychrel if there's more than 50 iterations (< 10000))
function Lychrel_50(n) {
	
	for (var i = 0; i < 50; i++) {
		
		n += number_reverse(n);
		
		if (is_palindrome(n)) {
			
			return true;
		}
	}
	
	return false;
}


function Josephus(n, k) {
	
	if (n == 1) {
		return 1;	
	} else {
		
		return (Josephus(n - 1, k) + k - 1) % n + 1;
	}
}


function Barnsley(_x, _y) {
	
	var next_x, next_y, rand;
		
	rand = random(1);

	if (rand < 0.01) {
		
		next_x =  0;
		next_y =  0.16 * _y;
	}
	
	if (rand >= 0.01 && rand < 0.86) {

		next_x =  0.85 * _x + 0.04 * _y;
		next_y = -0.04 * _x + 0.85 * _y + 1.6;
	}
	
	if (rand >= 0.86 && rand < 0.93) {
		
		next_x =  0.20 * _x - 0.26 * _y;
		next_y =  0.23 * _x + 0.22 * _y + 1.6;
	}
	
	if (rand >= 0.93) {
		
		next_x = -0.15 * _x + 0.28 * _y;
		next_y =  0.26 * _x + 0.24 * _y + 0.44;
	}


	return [next_x, next_y];
}

















































