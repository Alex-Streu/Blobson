/// @description Draw selected name
draw_self();

if (selected != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(global.base_font);
	draw_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(selected[? "Name"]), scale, scale, 0);
}

//Draw highlight
if (!isActive)
{
	draw_set_color(c_gray);
	draw_set_alpha(0.5);
	draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
	
	reset_draw();
}
else { draw_highlight(); }