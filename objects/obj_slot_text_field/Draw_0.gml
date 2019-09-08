/// @description Draw text
draw_self();

textString = "";
for (var i = 0; i < ds_list_size(text); i++)
{
	textString += string(text[|i]);
}

draw_set_font(global.base_font);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x + sprite_width/2, y + sprite_height/2, textString, 0.2, 0.2, 0);

reset_draw();