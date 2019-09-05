//Draw if not off
if (state == SLOT_STATE.OFF) { return; }

if (!surface_exists(drawSurface)) {
	drawSurface = surface_create(sprite_width, sprite_height);
}

surface_set_target(drawSurface);

	//Clear surface and set background
	draw_sprite(sprite_index, 0, 0, 0);
	
	//Draw portrait image
	if (character != noone) {
		var _scaleX = sprite_width / sprite_get_width(character.portrait);
		var _scaleY = sprite_height / sprite_get_height(character.portrait);
		draw_sprite_ext(character.portrait, 0, 0, 0, _scaleX, _scaleY, 0, c_white, 1);
	}
	
	//Reset draw
	draw_set_color(c_white);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(drawSurface, x, y);

//Draw fade if unselected
if (!isSelected)
{
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
	
	//Reset draw
	draw_set_color(c_white);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
}


//Draw marker
if (isSelected && character != noone)
{
	draw_sprite(marker[0], 0, character.x + marker[1], character.y + marker[2]);
}