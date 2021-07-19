// Create a string that contains X number of zeros
function createZeros(zeros) {
	
	if (zeros != 0) {
		return string_replace_all(string_format(0, zeros, 0), " ", "0");
	} 
	
	return "";
}


function Big(number) constructor {
	
	_number = "";
	
	if (is_real(number)) {
		_number = string(number);
	} else { 
		
		// Lowercase 'e', Number Length & 'e' pos
		number = string_lower(number);
		var number_len = string_length(number);
		var e_symbol_pos = string_pos("e", number);
		
		// Power of ten detection
		if (e_symbol_pos != 0) {
			
			// String Split
			var num = string_copy(number, 1, e_symbol_pos - 1);
			var pow = string_copy(number, e_symbol_pos + 1, number_len - e_symbol_pos + 1);
			
			// Negative Number, Negative Power, Decimal Point, Number Length
			var ne_number_pos = string_pos("-", num);
			var ne_power_pos = string_pos("-", pow);
			var decimal_pos = string_pos(".", number);
			var num_len = string_length(num);

			// Remove Number/Power Negative Signs
			if (ne_number_pos != 0) num = string_delete(num, 1, 1);
			if (ne_power_pos != 0) pow = string_delete(pow, 1, 1);
				
			// Power converted to real
			pow = real(pow);

			// Negative Power Branch
			if (ne_power_pos == 0) {
							
				if (decimal_pos != 0) {
					num = string_replace(num, ".", "");
					pow -= (num_len - decimal_pos);
					num = createZeros(pow);
				}

			} else {
			
				num_len = string_length(num);
				
				if (decimal_pos != 0) {
					num = string_replace(num, ".", "");
					pow += (num_len - decimal_pos + 1);
				}
				
				if (num_len > pow) {
					num = string_insert(".", num, num_len - pow + 1);
				} else {
					num = "0." + createZeros(pow - num_len) + num; 
				}
			}
			
			if (ne_number_pos != 0) num = "-" + num;
		}
		
		_number = num;
	}
	
	show_debug_message(_number);
}





































