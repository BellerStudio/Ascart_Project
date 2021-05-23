timer = get_timer();

var str = clipboard_get_text();
var len = string_length(str);

var stars = "**";
var star_init = "*****";
var res = "";

for (var i = 1; i <= len; i++) {
	
	res += string_char_at(str, i) + stars;
	stars = string_copy(star_init, 1, irandom_range(1, 3));
}

out = res + stars;

reset_timer = true;