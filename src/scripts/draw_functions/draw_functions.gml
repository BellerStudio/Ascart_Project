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



/*
function draw_arc(x1, y1, x2, y2, x3, y3, x4, y4, precision) {

    if (precision == 0) precision = 24;
	
    var res, xm, ym, xr, yr, r, a1, a2, sx, sy, a;
	
    res = 360 / min(max(4, 4 * (precision div 4)), 64);
    xm = (x1 + x2) / 2;
    ym = (y1 + y2) / 2;
    xr = abs(x2 - x1) / 2;
    yr = abs(y2 - y1) / 2;
	
    if (xr > 0) r = yr/xr;
    else r = 0;
	
    a1 = point_direction(0, 0, (x3 - xm) * r, y3 - ym);
    a2 = point_direction(0, 0, (x4 - xm) * r, y4 - ym);
	
    if (a2 < a1) a2 += 360;
	
    draw_primitive_begin(pr_linestrip);
 
	
    sx = xm + lengthdir_x(xr, a1);
    sy = ym + lengthdir_y(yr, a1);
    draw_vertex(sx, sy);
	
    for (a = res * (a1 div res + 1); a < a2; a += res) {
		
		sx = xm + lengthdir_x(xr, a);
		sy = ym + lengthdir_y(yr, a);
        draw_vertex(sx, sy);
    }
	
    sx = xm + lengthdir_x(xr, a2);
    sy = ym + lengthdir_y(yr, a2);
    draw_vertex(sx, sy);
		
    draw_primitive_end();
    return 0;
}
*/





























