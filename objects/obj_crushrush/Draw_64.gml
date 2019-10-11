/// @description Insert description here
// You can write your code in this editor





draw_sprite_ext(spr_cr_hud_boarder,0,0,0,1,1,0,c_blue,1);
draw_sprite_ext(spr_cr_hud_boarder,1,960,480,-1,1,0,c_blue,.75);

draw_set_font(special_font);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_text_transformed_color(940,515,"" + string(timer/room_speed), .35,.35,0,c_white,c_white,c_white,c_white,1);

//draw_text(960,500, "" + string(timer/room_speed));

#region cube icons
if red_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,24,20,1,1,0,c_red,1);}
if blue_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,48,20,1,1,0,c_blue,1);}
if yellow_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,72,20,1,1,0,c_yellow,1);}
if green_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,96,20,1,1,0,c_green,1);}
if purple_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,120,20,1,1,0,c_purple,1);}
if orange_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,24,44,1,1,0,c_orange,1);}
if cyan_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,48,44,1,1,0,c_aqua,1);}
if pink_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,72,44,1,1,0,c_fuchsia,1);}
if white_cube = true {draw_sprite_ext(spr_cr_hud_cube,0,96,44,1,1,0,c_white,1);}
#endregion