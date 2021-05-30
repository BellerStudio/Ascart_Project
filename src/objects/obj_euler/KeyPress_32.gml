timer = get_timer();

var str = clipboard_get_text();
var len = string_length(str);

var res = "";
for (var i = 1; i <= len; i++) {
	
	res += string_char_at(str, i); ///"*" + string_char_at(str, i) + "*";
}

var cursed = 2;
len = string_length(str);

for (var j = 0; j < cursed * 2; j++) {
	
	var start_index = irandom_range(start_index + 1, len - 2);
	var end_index = irandom_range(floor(len / 2), len - 1);
	
	res = string_insert("*", res, start_index);
	res = string_insert("*", res, end_index);
}

out = res;

reset_timer = true;