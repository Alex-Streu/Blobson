/// @description Insert description here
// You can write your code in this editor

#region menu 1 phase

#region menu 1 variables
draw_sprite_ext(spr_menu1_color_boxes,0,0,0,1,1,0,tab_solo_color,1) //draw color in single player tab
draw_sprite_ext(spr_menu1_icons,0,icon_solo_x,icon_solo_y,1,1,0,icon_solo_color,1) //draw singleplayer icon
draw_sprite_ext(spr_menu1_glow,0,0,0,1,1,0,c_white,tab1_alpha) //draw tab 1's glow
draw_sprite_ext(spr_menu1_color_boxes,1,0,0,1,1,0,tab_multiplayer_color,1) //draw color in single player tab
draw_sprite_ext(spr_menu1_icons,1,icon_multiplayer_x,icon_multiplayer_y,1,1,0,icon_multiplayer_color,1) //draw singleplayer icon
draw_sprite_ext(spr_menu1_glow,1,0,0,1,1,0,c_white,tab2_alpha) //draw tab 1's glow

#endregion


#endregion


draw_sprite_ext(spr_menu1_main,0,0,0,1,1,0,c_white,1)