/// @func bignum_multiply(num1, num2,...)
/// @arg {string/real} num1
/// @arg {string/real} num2,...
function bignum_multiply() {

	/*
		Returns: string
		num1 * num2 * num3 * ...
		Product of the numbers
	*/

	var i = argument_count-1, prd = __bignum_format(argument[i]);
	while (i--) prd = __bignum_pair_multiply(prd, __bignum_format(argument[i]));
	return prd;


}


function bignum_power(x, n) {
	
	var total = x;
	
	for (var i = 0; i < n - 1; i++) {
		
		total = bignum_multiply(x, total);	
	}
	
	return total;
}


function bignum_factorial(n) {
	
	var sum = 1;
	
	for (var i = 2; i <= n; i++) {
		
		sum = bignum_multiply(sum, i);
	}
	
	return sum;
}



















