/// @description Draw correct text
if (owner == noone) { return; }

//Draw switch sprite
draw_self();

//Set properties
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_consolas);

//Draw text
var _text = string(round(setting*100)) + "%";
draw_text_transformed(x + sprite_width/2, y + sprite_height/2, _text, 1, 1, 0);