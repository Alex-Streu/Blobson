/// @description Insert description here
// You can write your code in this editor

#region menu 1 phase

#region menu 1 variables
draw_sprite_ext(spr_menu1_color_boxes,0,0,0,1,1,0,tab_solo_color,1) //draw color in single player tab
draw_sprite_ext(spr_menu1_icons,0,icon_solo_x,icon_solo_y,1,1,0,icon_solo_color,1) //draw singleplayer icon
draw_sprite_ext(spr_menu1_glow,0,0,0,1,1,0,c_white,tab1_alpha) //draw tab 1's glow

draw_sprite_ext(spr_menu1_color_boxes,1,0,0,1,1,0,tab_multiplayer_color,1) //draw color in multiplayer tab
draw_sprite_ext(spr_menu1_icons,1,icon_multiplayer_x,icon_multiplayer_y,1,1,0,icon_multiplayer_color,1) //draw multiplayer icon - controllers
draw_sprite_ext(spr_menu1_icons,2,icon_multiplayer_x + 128,icon_multiplayer_y,.9,.9,0,icon_multiplayer_color,1) //draw multiplayer icon - globe
draw_sprite_ext(spr_menu1_glow,1,0,0,1,1,0,c_white,tab2_alpha) //draw tab 2's glow

draw_sprite_ext(spr_menu1_color_boxes,2,0,0,1,1,0,tab_customization_color,1) //draw color in multiplayer tab
draw_sprite_ext(spr_menu1_icons,3,icon_customization_x,icon_customization_y,1,1,0,icon_customization_color,1) //draw customize icon - controllers
draw_sprite_ext(spr_menu1_icons,4,icon_customization_x + 128,icon_customization_y - 48,.9,.9,0,icon_customization_color,1) //draw customize icon - globe
draw_sprite_ext(spr_menu1_glow,2,0,0,1,1,0,c_white,tab3_alpha) //draw tab 3's glow

draw_sprite_ext(spr_menu1_color_boxes,3,0,0,1,1,0,tab_extras_color,1) //draw color in extras tab
draw_sprite_ext(spr_menu1_icons,5,icon_extras_x,icon_extras_y,1,1,0,icon_extras_color,1) //draw extras icon - controllers
draw_sprite_ext(spr_menu1_icons,6,icon_extras_x + 128,icon_extras_y - 48,.9,.9,0,icon_extras_color,1) //draw extras icon - globe
draw_sprite_ext(spr_menu1_glow,3,0,0,1,1,0,c_white,tab4_alpha) //draw tab 4's glow

draw_sprite_ext(spr_menu1_color_boxes,4,0,0,1,1,0,tab_exit_color,1) //draw color in exit tab
draw_sprite_ext(spr_menu1_icons,7,icon_exit_x,icon_exit_y,1,1,0,tab_exit_color,1) //draw exit icon - controllers
draw_sprite_ext(spr_menu1_glow,4,0,0,1,1,0,c_white,tab6_alpha) //draw tab 6's glow

draw_sprite_ext(spr_menu1_color_boxes,5,0,0,1,1,0,tab_settings_color,1) //draw color in settings tab
draw_sprite_ext(spr_menu1_icons,8,icon_settings_x,icon_settings_y,.9,.9,0,icon_settings_color,1) //draw settings icon - controllers
draw_sprite_ext(spr_menu1_glow,5,0,0,1,1,0,c_white,tab5_alpha) //draw tab 5's glow


#endregion


#endregion


draw_sprite_ext(spr_menu1_main,0,0,0,1,1,0,c_white,1)

draw_sprite_ext(spr_menu_cursor,0,menu_p1_cursor_x,menu_p1_cursor_y,1,1,0,c_red,1)

draw_text_transformed(32, 48, string("X ") + string(menu_p1_cursor_x), 1, 1, 0);
draw_text_transformed(32, 64, string("Y ") + string(menu_p1_cursor_y), 1, 1, 0);

draw_text_transformed(32, 256, string("stick_x ") + string(gamepad_axis_value(0,gp_axislh)), 1, 1, 0);
draw_text_transformed(32, 272, string("stick_y ") + string(gamepad_axis_value(0,gp_axislv)), 1, 1, 0);

draw_text_transformed(32, 300, string("highlighy ") + string(menu_highlight), 1, 1, 0);
