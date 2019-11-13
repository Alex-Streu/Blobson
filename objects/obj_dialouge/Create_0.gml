/// @description Insert description here
// You can write your code in this editor

map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
dialouge_font = font_add_sprite_ext(spr_font2, map_string, true, -0);
draw_set_font(dialouge_font);

box = spr_dialouge_box;
portrait = spr_sarina_offscreen;

box_x = 0;
box_y = 440;

counter = 0;

pause = false;

box_width = sprite_get_width(box)
box_height = sprite_get_height(box)

portrait_body_index = 0;
portrait_character = 0;
portrait_x = 240;
portrait_y = 440;



text = obj_win_screen.winner[PLAYER_DATA.text];

//text[0] = "I am the only one. The one, that will take you down! Now prepare yourself!"
//text[1] = "bitch"
page = 0;

name = "Sarina"


font = dialouge_font;
x_buffer = 16;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

text_max_width = box_width - (2*x_buffer);

event_perform(ev_other,ev_user1);
