// Vector Implementation

function vector(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static set = function(_x, _y) {
		x = _x;
		y = _y;
	}
	
	static add = function(_vector) {
		x += _vector.x;
		y += _vector.y;
	}
	
	static sub = function(_vector) {
		x -= _vector.x;
		y -= _vector.y;
	}
	
	static mult = function(_scalar) {
		x *= _scalar;
		y *= _scalar;
	}
	
	static divide = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
	}
	
	static mag = function() {
		return sqrt((x * x) + (y * y));
	}
	
	static magSq = function() {
		return (x * x) + (y * y);
	}
	
	static normalize = function() {
		if ((x != 0) || (y != 0)) {
			var _factor = 1 / sqrt((x * x) + (y * y));
			x = _factor * x;
			y = _factor * y;
		}
	}
	
	static setMag = function(_scalar) {
		normalize();
		mult(_scalar);
	}
	
	static limit = function(_max) {
		if (mag() > _max) {
			setMag(_max);
		}
	}
	
	static negate = function() {
		x = -x;
		y = -y;
	}
	
	static dir = function() {
		return point_direction(0, 0, x, y);
	}
	
	static copy = function(_vector) {
		x = _vector.x;
		y = _vector.y;
	}
}































