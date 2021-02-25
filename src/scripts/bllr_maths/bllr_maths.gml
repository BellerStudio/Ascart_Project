// Mostly used in Project Euler problems

// Map function
function map(val, start1, end1, start2, end2) {
	
	var prop = (val - start1) / (end1 - start1);
	return prop * (end2 - start2) + start2;
}


// Partition for a quicksort
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


function nth_root(x, n) {
	return power(x, (1/n));
}


// Sieve Of Eratosthenes -> List of primes (from 2 to n)
function SOE(n) {
	
	var prime = array_create(n + 1, true);
	var size = n / ln(n);
	
	var list = array_create(size);
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
	
	var k = 0;
	
	for (var j = 1; j < n + 1; j++) {
		
		if (prime[j] == true) {
			
			list[k] = j;
			k++;
		}
	}
	
	return list;
}


// Sieve Of Eratosthenes with negative numbers
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


// Reverse a number using maths instead of a string
function number_reverse(n) {
	
	var reverse = 0;
	
	while (n > 0) {
			
		reverse = reverse * 10 + n % 10;
		n = n div 10;
	}
	
	return reverse;
}


// Reverse a string
function string_reverse(str) {
	
	var res = "";
	
	for (var i = 0; i < string_length(str); i++) {

		res += string_copy(str, string_length(str) - i, 1);
	}
	
	return res;
}


// Check if a number is a palindrome
function is_palindrome(n) {
	
	n = string(n);
	var reverse = string_reverse(n);
	
	if (n == reverse) {
		
		return true;	
	}

	return false;
}


// Check if a number is a prime
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


// Decompose a number into it's prime factors
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


// Decompose a number into factors
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


// factorial : n! -> 5! = 1 x 2 x 3 x 4 x 5
function factorial(n) {
	
	if (n == 0) {
		
		return 1;
	} else {
		
		return n * factorial(n - 1);	
	}
}


// Check if a year is leap (Because built-in functions are limited to a date)
function is_leap(n) {
	
	if (n % 4 == 0) {
		if (n % 100 == 0) {
			if (n % 400 == 0) {
				return true;
			} else return false;
		} else return true;		
	} else return false;
}


// Split a string into an array
function string_split(str) {
	
	str = string(str);
	var str_len = string_length(str);
	var split_list = array_create(str_len);
	
	for (var k = 1; k <= str_len; k++) {
		
		split_list[k - 1] = string_char_at(str, k);
	}
	
	return split_list;
}


function cycle_length(n) {
	
	var remainder = 10, i = 0;
	
	while (remainder != 10 || i < 1) {
		
		remainder = (remainder % n) * 10;
		i++;
	}
	
	return i;
}


// Check if a prime number can be a prime when rotated
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


// Convert a number into binary
function binary(dec) {
	
	var bin;
	
    if (dec) bin = "" else bin="0";
	
    while (dec) {
		
        bin = string_char_at("01", (dec & 1) + 1) + bin;
        dec = dec >> 1;
    }
	
    return bin;
}


// Check if a number is a pandigital
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


// Convert uppercase chars to alphabetic value (A -> 1)
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


// Value of every char added together
function word_value(str) {
	
	var list = str_number(str);
	var len = array_length(list);
	var number = 0;
	
	for (var i = 0; i < len; i++) {
		
		number += list[i];
	}
	
	return number;
}


// Counts only different numbers in an array ([1, 1, 2, 2, 3] -> 3)
function array_count_diff(array) {
	
	var len = array_length(array);
	var value, count = 0, maxi = 0;
		
	for (var i = 0; i < len; i++) {
		
		value = array[i];
		
		if (value > maxi) {
			
			count++;
			maxi = value;	
		}
	}
	
	return count;
}


// Check if a number is a permutation (12345 -> 54231)
function is_permutation(a, b) {
		
	var split1 = string_split(string(a));
	var split2 = string_split(string(b));
	
	var sorted1 = array_sort(split1, true);
	var sorted2 = array_sort(split2, true);
	
	if (array_equals(sorted1, sorted2)) {
		
		return true;	
	}
	
	return false;
}


// Mode = true -> Return a list of sum
function prime_sum(n, mode) {
	
	var primes = SOE(n);
	var list = [], i = 0;
	var val = 0;
	
	while (val < n) {
		
		val += primes[i];
		if (mode) array_push(list, primes[i]);
		
		i++;
	}
	
	if (mode) return list;
	else return val;
}


// Sum of all digits in a number
function number_sum(n) {
	
	var r = 0;
	
	while (n > 0) {
		
		r += n % 10;
		n = n div 10;
	}
	
	return r;
}


// Return the max digit in a number (Ex: 195 -> 9)
function number_max(n) {
		
	var res = 0, divide;
	
	while (n > 0) {
		
		divide = n % 10;
		
		if (divide > res) {
			
			res = divide;
		}
		
		n = n div 10;
	}
	
	return res;
}


function binomial_coefficient(n, k) {
	
   var C = array_create(k + 1);
   C[0] = 1;
   
   for (var i = 1; i <= n; i++) {
	   
      for (var j = min(i, k); j > 0; j--) {
		  
         C[j] += C[j - 1];
	  }
   }
   
   return C[k];
}


// Sum of all the possible permutations of a number
function all_permutations_sum(n) {
	
	var sum = number_sum(n);
	var len = string_length(string(n));
	var fact = factorial(len - 1);
	var str = "";
	
	for (var i = 1; i <= len; i++) {
		
		str += "1";	
	}
	
	return sum * fact * real(str);
}





