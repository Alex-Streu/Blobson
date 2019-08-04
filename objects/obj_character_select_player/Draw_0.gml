if (!surface_exists(drawSurface)) {
	drawSurface = surface_create(drawW, drawH);
}

surface_set_target(drawSurface);

	//Clear surface and set background
	draw_clear_alpha(0, 0);
	draw_set_color(bg_color);
	draw_rectangle(0, 0, drawW, drawH, false);
	
	//Draw icon image
	if (portrait != noone) {
		var _scaleX = drawW / sprite_get_width(portrait);
		var _scaleY = drawH / sprite_get_height(portrait);
		draw_sprite_ext(portrait, 0, 0, 0, _scaleX, _scaleY, 0, c_white, 1);
	}
	
	//Draw name
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, drawH-30, drawW, drawH, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text_transformed(drawW/2, drawH-15, string_upper(name), 0.4, 0.4, 0);
	
	//Reset draw
	draw_set_color(c_white);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(drawSurface, x, y);