if (icon == noone) { return; }

if (!surface_exists(drawSurface)) {
	drawSurface = surface_create(iconW, iconH);
}

surface_set_target(drawSurface);

	//Clear surface and set background
	draw_clear_alpha(0, 0);
	draw_set_color(c_gray);
	draw_rectangle(0, 0, iconW, iconH, false);
	
	//Draw icon image
	draw_sprite(icon, 0, 0, 0);
	
	//Draw name
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, iconH-30, iconW, iconH, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text_transformed(iconW/2, iconH-20, string_upper(name), 0.4, 0.4, 0);
	
	//Subtract window
	gpu_set_blendmode(bm_subtract);
	draw_sprite(spr_stage_icon_window, 0, 0, 0);
	
	//Add frame
	gpu_set_blendmode(bm_normal);
	draw_sprite(spr_stage_icon_frame, 0, 0, 0);
	
	//Reset draw
	draw_set_color(c_white);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(drawSurface, x, y);