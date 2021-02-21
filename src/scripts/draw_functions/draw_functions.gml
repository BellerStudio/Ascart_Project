function draw_arc(x, y, r, detail) {
	
   var dist, inc, draw_x, draw_y;

    dist = 180;
    inc = (1 / detail);
	
	draw_primitive_begin(pr_linestrip);
	
	for (var i = 0; i < 1 + inc; i += inc) {

		draw_x = x + lengthdir_x(r, i * dist);
		draw_y = y + lengthdir_y(r, i * dist);
		draw_vertex(draw_x, draw_y);
	}
	
	draw_primitive_end();
	return 0;
}


function draw_arc_color(x, y, r, color, detail) {
	
   var dist, inc, draw_x, draw_y;

    dist = 180;
    inc = (1 / detail);
	
	draw_primitive_begin(pr_linestrip);
	
	for (var i = 0; i < 1 + inc; i += inc) {

		draw_x = x + lengthdir_x(r, i * dist);
		draw_y = y + lengthdir_y(r, i * dist);
		draw_vertex_color(draw_x, draw_y, color, 1);
	}
	
	draw_primitive_end();
	return 0;
}





























