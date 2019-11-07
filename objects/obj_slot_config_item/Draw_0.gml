/// @description Draw name and highlight
draw_self();

//Deleting box
if (isDeleting)
{
	draw_set_color(c_red);
	draw_set_alpha(0.7);
	draw_rectangle(x, y, x + (sprite_width*deleteProgress), y + sprite_height, false);
	
	reset_draw();
}

//Draw name
if (config != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(global.base_font);
	draw_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(config[? "Name"]), 0.1, 0.1, 0);
}

//Draw grey out if default
if (config[? "IsDefault"])
{
	draw_set_color(c_gray);
	draw_set_alpha(0.4);
	draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
	
	reset_draw();
}

//Draw highlight
if (!isDeleting) { draw_highlight(); }