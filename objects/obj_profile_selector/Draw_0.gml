/// @description Don't draw if inactive
if (!isActive) { return; }

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 0.7);

draw_set_color(c_white);
draw_set_font(global.base_font);
draw_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(selected[? "Name"]), 0.15, 0.15, 0);