draw_set_font(ft_res);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(30, 30, "Mouse Grid : " + string(global.WP_mouseGrid));
draw_text(30, 60, "Mouse Block : " + string(global.WP_mouseGridNumber));
draw_text(30, 90, "Block ID : " + string(global.WP_currentGridID));
draw_text(30, 120, "WP Array : " + string(array_length(global.WP_gridArray)));
draw_text(30, 150, "GridToLoad : " + string(global.WP_gridToLoad));