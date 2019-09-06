/// @description Draw selected name
draw_self();

if (selected != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(global.base_font);
	draw_fitted_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(selected[? "Name"]), 0, sprite_width, 10);
}

//Draw highlight
draw_highlight();