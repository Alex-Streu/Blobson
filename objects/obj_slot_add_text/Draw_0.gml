/// @description Draw characters
draw_self();

//Draw characters
draw_set_font(global.base_font);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_fitted_text_transformed(x + sprite_width/2, y + sprite_height/2, display, 0, sprite_width, 5);

reset_draw();

draw_highlight();