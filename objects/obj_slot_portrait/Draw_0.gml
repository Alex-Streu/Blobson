/// @description Draw character portrait
var _character = owner.character;

draw_self();

if (!surface_exists(drawSurface)) {
	drawSurface = surface_create(sprite_width, sprite_height);
}

surface_set_target(drawSurface);

	//Clear surface and set background
	draw_sprite(sprite_index, 0, 0, 0);
	
	//Draw portrait image
	if (_character != noone) {
		var _alpha = owner.isSelected ? 1 : 0.8;
		var _scaleX = sprite_width / sprite_get_width(_character.portrait);
		var _scaleY = sprite_height / sprite_get_height(_character.portrait);
		draw_sprite_ext(_character.portrait, 0, 0, 0, _scaleX, _scaleY, 0, c_white, _alpha);
	}
	
	reset_draw();

surface_reset_target();

draw_surface(drawSurface, x, y);

//Draw name if active
if (_character != noone)
{
	//draw_set_color(c_black);
	//draw_set_alpha(1);
	//draw_rectangle(x, y+sprite_height-30, x+sprite_width, y+sprite_height, false);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(global.base_font);
	draw_fitted_text_transformed(x+sprite_width/2, y+sprite_height-15, string_upper(_character.name), 1, sprite_width, 10);
	
	reset_draw();
}