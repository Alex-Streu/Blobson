/// @description Insert description here
// You can write your code in this editor

cubes_destroyed = 0;
cubes_total = 9;

//font settings
map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
special_font = font_add_sprite_ext(spr_font1, map_string, true, -0);
draw_set_font(special_font);

red_cube = true;
blue_cube = true;
yellow_cube = true;
green_cube = true;
purple_cube = true;
orange_cube = true;
cyan_cube = true;
pink_cube = true;
white_cube = true;

//timer = room_speed * 10;
timer_on = true;
timer = 0;