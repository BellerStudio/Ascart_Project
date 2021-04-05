// Number of digits in the number
function bignum_digits() {
	
	var num = __bignum_format(argument[0]),
		str = (argument_count > 1) ? argument[1] : 0,
		len = string_length(num) - (string_char_at(num, 1) == "-");

	return (str ? string(len) : len);
}


// Returns the absolute value
function bignum_abs(argument0) {

	var num = __bignum_format(argument0);
	
	return ((string_char_at(num, 1) == "-") ? string_delete(num, 1, 1) : num);
}


/*
Returns the sign of the number
   -1		if num > 0
	0		if num = 0
	1		if num < 0
*/
function bignum_sign(argument0) {

	var num = __bignum_format(string(argument0));
	
	return ((num != "0") * ((string_char_at(num, 1) != "-")*2-1));
}


/*
Returns a comparison between two numbers
   -1		if num1 > num2
	0		if num1 = num2
	1		if num1 < num2
*/
function bignum_compare(argument0, argument1) {



	var a = __bignum_format(argument0), b = __bignum_format(argument1),
		na = (string_char_at(a, 1) == "-"), nb = (string_char_at(b, 1) == "-"),
		ta, tb, da, db, i;
	
	if (na & !nb) return -1;
	if (!na & nb) return 1;

	if (na) a = string_delete(a, 1, 1);
	if (nb) b = string_delete(b, 1, 1);

	da = string_length(a);
	db = string_length(b);
	if (da != db) return (((da < db)*2-1) * (na*2-1));

	i = 0;
	while (i++ < da) {
		
		ta = real(string_char_at(a, i));
		tb = real(string_char_at(b, i));
		if (ta != tb) return (((ta < tb)*2-1) * (na*2-1));
	}

	return 0;
}


// Add two numbers together
function bignum_add() {

	var i = argument_count-1, sum = __bignum_format(argument[i]);
	while (i--) sum = __bignum_pair_add(sum, __bignum_format(argument[i]));
	
	return sum;
}


// Min number between n numbers
function bignum_min() {

	var i = argument_count-1, mn = __bignum_format(argument[i]), num;

	while (i--) {
		
		num = __bignum_format(argument[i]);
		if (bignum_compare(mn, num)) mn = num;
	}

	return mn;
}

// Max number between n numbers
function bignum_max() {

	var i = argument_count-1, mx = __bignum_format(argument[i]), num;

	while (i--) {
		
		num = __bignum_format(argument[i]);
		if (bignum_compare(num, mx)) mx = num;
	}

	return mx;
}


// Modulo
function bignum_mod() {

	var a = __bignum_format(argument[0]), b = argument[1],
		str = (argument_count > 2) ? argument[2] : 0,
		na = (string_char_at(a, 1) == "-"), nb = (b < 0),
		ans = 0, la, i = 0;

	if (na) a = string_delete(a, 1, 1);
	if (nb) b = -b;

	la = string_length(a);
	while (i++ < la) {
		
		ans = (ans*10 + real(string_char_at(a, i))) % b;
	}
	
	if (na) ans = -ans;
	if (str) ans = string(ans);

	return ans;
}


// Divide two numbers
function bignum_divide(argument0, argument1) {

	var a = __bignum_format(argument0), b = argument1,
		na = (string_char_at(a, 1) == "-"), nb = (b < 0),
		qnt = "", dvd = 0, la, i = 0;

	if (!b) {
		
		show_error("BigNum: Cannot divide by 0", true);	
	}

	if (na) a = string_delete(a, 1, 1);
	if (nb) b = -b;

	la = string_length(a);
	while (i++ < la) {
		
		dvd = (dvd*10 + real(string_char_at(a, i)));
		
		if ((dvd >= b) || !dvd) {
			qnt += string(dvd div b);
			dvd = dvd % b;
		}
	}
	
	if (na ^ nb) qnt = "-" + qnt;

	return __bignum_format(qnt);
}


// Multiply two numbers
function bignum_multiply() {

	var i = argument_count-1, prd = __bignum_format(argument[i]);
	while (i--) prd = __bignum_pair_multiply(prd, __bignum_format(argument[i]));
	
	return prd;
}


// Substract two numbers
function bignum_subtract(argument0, argument1) {

	var a = __bignum_format(argument0), b = __bignum_format(argument1), c = "",
		na = (string_char_at(a, 1) == "-"), nb = (string_char_at(b, 1) == "-"),
		sub = "", diff, i, j, carry = 0;

	if (na) a = string_delete(a, 1, 1);
	if (nb) b = string_delete(b, 1, 1);

	if (na & !nb) return ("-" + bignum_add(a, b));
	if (!na & nb) return bignum_add(a, b);

	if (bignum_compare(a, b) < 0) {
		
		c = a;
		a = b;
		b = c;
	}

	i = string_length(a);
	j = string_length(b);
	
	while (i || j) {
		
		if (i) diff = real(string_char_at(a, i--))-carry;
		if (j) diff -= real(string_char_at(b, j--));
		
		if (diff < 0) {
			diff += 10;
			carry = 1;
		}
		
		sub = string(diff % 10) + sub;
	}
	
	if (c != "") sub = "-" + sub;

	return __bignum_format(sub);
}


// Power of x
function bignum_power(x, n) {
	
	var total = x;
	
	for (var i = 0; i < n - 1; i++) {
		
		total = bignum_multiply(x, total);	
	}
	
	return total;
}


// Factorial of n
function bignum_factorial(n) {
	
	var sum = 1;
	
	for (var i = 2; i <= n; i++) {
		
		sum = bignum_multiply(sum, i);
	}
	
	return sum;
}




























