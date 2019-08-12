/// @description
draw_set_font(fnt_large);
draw_set_color(c_black);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
//Back Button
draw_sprite_ext(spr_back_button, 0, 0, 0, 1, 1, 0, image_blend, image_alpha);

//Stock
draw_sprite_ext(spr_stock_ui, 0, half_room - 250, 0, 1, 1, 0, image_blend, image_alpha);
draw_text(half_room - 125 + 50, 16, "STOCK");

//Time
draw_sprite_ext(spr_stock_ui, 0, half_room - 6, 0, 1, 1, 0, image_blend, image_alpha);
draw_text(half_room + 125 + 50, 16, "TIME");