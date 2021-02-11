delta_factor = 1;

#macro delta delta_factor

#macro ALARMINACTIVE -100

for(var i = 0; i < 16; i++) {
	Alarm[i] = ALARMINACTIVE;	
}

Alarm[0] = 1;