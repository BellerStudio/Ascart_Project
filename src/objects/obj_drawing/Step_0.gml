if (x + circle_rad >= room_width) {
	switch_x = false;
}

if (x - circle_rad < 0) {
	switch_x = true;
}

if (switch_x) {
	x += 10;
} else {
	x -= 10;
}

/*
if (scale < 0) {
	switch_scale = true;
}

if (scale > 1) {
	switch_scale = false;
}

if (switch_scale) {
	scale += 0.01;
} else {
	scale -= 0.01	
}*/