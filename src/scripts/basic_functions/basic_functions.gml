function array_append(array, value) {
	
	var len = array_length(array);
	array[@ len] = value;
}


function make2DArray(cols, rows) {
	
	var grid = array_create(cols);
	for (var n = 0; n < cols; n++) {
	
		grid[n] = array_create(rows);
	}
	
	return grid;
}



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
	        array[@ i] = array[j]
	        array[@ j] = k
			
			var save_size = array_length(global.sort_save);
			global.sort_save[save_size + 0] = i;
			global.sort_save[save_size + 1] = array[i];
			global.sort_save[save_size + 2] = j;
			global.sort_save[save_size + 3] = array[j];
	    }
	}
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


function basic_swap(array, a, b) {
	
	var temp = array[a];
	array[@ a] = array[b];
	array[@ b] = temp;
}


function partition(array, start, _end) {
	
	var pivotIndex = start;
	var pivotValue = array[_end];
	
	for (var i = start; i < _end; i++) {
		
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
		array_shuffle(array);
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


function number_reverse(n) {
	
	var reverse = 0;
	
	while (n > 0) {
			
		reverse = reverse * 10 + n % 10;
		n = n div 10;
	}
	
	return reverse;
}


function string_reverse(str) {
	
	var res = "";
	
	for (var i = 0; i < string_length(str); i++) {

		res += string_copy(str, string_length(str) - i, 1);
	}
	
	return res;
}


function is_palindrome(n) {
	
	n = string(n);
	var reverse = string_reverse(n);
	
	if (n == reverse) {
		
		return true;	
	}

	return false;
}


function is_prime(n) {
	
	if (n < 2) {
		
		return false;
	}
	
	if (n == 2 || n == 3) {
		
		return true;	
	}
	
	var i = 2;
	
	while (i*i <= n) {
		
		if (n % i == 0) {
			
			return false;	
		}
		
		i++;
	}
	
	return true;
}


// Sieve Of Eratosthenes
function SOE(n) {
	
	var prime = array_create(n + 1, true);
	var list = [];
	var p = 2;
	
	while (p*p <= n) {
		
		if (prime[p] == true) {
			
			for (var i = p*2; i < n + 1; i += p) {
				
				prime[i] = false;
			}
		}
		
		p++;
	}
	
	prime[0] = false;
	prime[1] = false;
	
	for (var j = 1; j < n + 1; j++) {
		
		if (prime[j] == true) {
			
			array_append(list, j);
		}
	}
	
	return list;
}


function nSOE(n) {
	
	var temp_array = SOE(n);
	var temp_len = array_length(temp_array);
	var primes = [];

	for (var j = temp_len - 1; j >= 0; j--) {
	
		var temp_val = 0 - temp_array[j];
		primes[temp_len - j - 1] = temp_val;
	}

	for (var k = 0; k < temp_len; k++) {
	
		var len = array_length(primes);
		primes[len] = temp_array[k];
	}
	
	return primes;
}



function prime_decompose(n) {

	var i = 2, fac_len;
	var factors = [];
	
	while (i <= n) {
		
		if (n % i == 0) {
			
			fac_len = array_length(factors);
			factors[fac_len] = i;
			n /= i;
		} else {
			
			i++;
		}
	}
	return factors;
}


function factors(n, mode) {
	
    
	if (!is_prime(n)) {
		
		var results = [1], res_len = 1, n_max = (n / 2) + 1;
	
	    for (var i = 2; i < n_max; i++) {
        
	        if (n % i == 0) {
	            res_len = array_length(results);
	            results[res_len] = i;
	        }
	    }
		
	    if (mode) results[res_len + 1] = n;
		
	} else {
		var results = [1, n];
	}
	
    return results;
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


function factorielle(n) {
	
	if (n == 0) {
		
		return 1;
	} else {
		
		return n * factorielle(n - 1);	
	}
}


function is_leap(n) {
	
	if (n % 4 == 0) {
		if (n % 100 == 0) {
			if (n % 400 == 0) {
				return true;
			} else return false;
		} else return true;		
	} else return false;
}


function number_sum(n) {
	
	if (is_string(n)) {
		var str = string(n);	
	} else {
		var str = n;	
	}
	
	var len = string_length(str);
	var sum = 0;
	
	for (var i = 1; i <= len; i++) {
		sum += real(string_char_at(str, i));
	}
	
	return sum;
}


function number_permutations(set, range) {
	
	var f, k, l, m, n;
	
	n = floor(set);
	k = floor(range);
	m = n - k;
	
	if (m < 0) {
		
		return -1;
	} else {
		
		f = 1;
		
		for (l = n; l > m; l -= 1){
			
			f *= l;
		}
		
		return f;
	}
}


function string_split(str) {
	
	str = string(str);
	var str_len = string_length(str);
	var split_list = array_create(str_len);
	
	for (var k = 1; k <= str_len; k++) {
		
		split_list[k - 1] = string_char_at(str, k);
	}
	
	return split_list;
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


function cycle_length(n) {
	
	var remainder = 10, i = 0;
	
	while (remainder != 10 || i < 1) {
		
		remainder = (remainder % n) * 10;
		i++;
	}
	
	return i;
}


function allRotationsPrime(n) {

    var l = floor(log10(n)) + 1;
    var p = power(10, l) - 1;

    for (var i = 1; i < l; i++) {
		
        n = (n + n % 10 * p) / 10;
		
        if (!is_prime(n)) {
			
            return false;
        }
    }
	
    return true;
}


function binary(dec) {
	
	var bin;
	
    if (dec) bin = "" else bin="0";
	
    while (dec) {
		
        bin = string_char_at("01", (dec & 1) + 1) + bin;
        dec = dec >> 1;
    }
	
    return bin;
}


function is_pandigital(n) {
	
	var str = string(n);
	var len = string_length(str);
	var list = array_create(len);

	var number, k, check_number;

	if (len > 9) {
		
		return false;
	} else {

		// Generate the list of numbers in a n-length pandigital
		for (var i = 1; i <= len; i++) list[i - 1] = string(i);

		for (var j = 1; j <= len; j++) {
			
			k = 0;
			check_number = true;
			number = string_char_at(str, j);
			
			while (check_number && k < len) {
				
				if (list[k] == number) {
					
					list[k] = -1;
					check_number = false;
				}
				
				k++;
			}
		}
		
		for (var l = 0; l < len; l++) {
			
			if (list[l] != -1) {
				return false;	
			}
		}

		return true;
	}
}


function str_number(str) {
	
	var list = string_split(str);
	var len = array_length(list);
	var number;
	
	for (var i = 0; i < len; i++) {
		
		number = ord(list[i]) - 64;
		
		list[i] = number;
	}
	
	return list;
}


function word_value(str) {
	
	var list = str_number(str);
	var len = array_length(list);
	var number = 0;
	
	for (var i = 0; i < len; i++) {
		
		number += list[i];
	}
	
	return number;
}


function triangle_numbers(n) {

	var list = array_create(n);
	var k;

	for (var i = 0; i < n; i++) {
		
		k = i + 1;
		list[i] = (k * (k + 1)) / 2;
	}
	
	return list;
}

















