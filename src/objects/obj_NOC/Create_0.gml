// Parameters

CONST_SOLAR_MASS = bignum_multiply(1989, bignum_power(10, 27)); // 1.989 * 10^30


CONST_MASS = bignum_multiply(CONST_SOLAR_MASS, 6000000000);
CONST_GRAV = bignum_multiply(66743015, power(10, -4)) // 6.6743015 * 10^-11
CONST_LISP = 299792458;


// Setup

M87 = {
	
	pos : new vector(0, 0),
	rs : bignum_multiply(CONST_MASS, CONST_GRAV, 2)
}

test = new Big("1.9574E-5");
test = new Big("1957.4E-4");
test = new Big("19574E-5");
test = new Big("19574E5"); // <--- PROBLEM
test = new Big("-1.9574E-6");
test = new Big("-19574E-7");