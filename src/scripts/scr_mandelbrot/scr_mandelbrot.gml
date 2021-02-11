function updatePixels(buff, surf, offset){
	if (surface_exists(surf)) {
		buffer_set_surface(buff, surf, offset);	
	}
}