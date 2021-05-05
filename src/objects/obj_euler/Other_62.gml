if (ds_map_find_value(async_load, "id")) {
	
	if (ds_map_find_value(async_load, "status") == 0) {
		
		url_callback = ds_map_find_value(async_load, "result");
	} else {
		
		url_callback = "null";
	}
}