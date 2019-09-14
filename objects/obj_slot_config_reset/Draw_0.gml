/// @description Draw correct text
if (owner == noone) { return; }

//Draw switch sprite
draw_self();

//Set properties
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(global.base_font);

//Draw text
var _text = "RESET";
draw_text_transformed(x + sprite_width/2, y + sprite_height/2, _text, font_size_small, font_size_small, 0);

//Draw highlight
draw_highlight();