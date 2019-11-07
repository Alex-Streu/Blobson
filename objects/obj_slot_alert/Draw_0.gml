/// @description Draw alert
	
draw_set_font(fnt_consolas);

var x1 = owner.x + 10;
var x2 = owner.x + owner.sprite_width - 10;
var y1 = owner.y + 10;
var y2 = y1 + string_height(text);

draw_set_color(c_gray);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text((x1 + x2)/2, (y1 + y2)/2, text);
	
reset_draw();