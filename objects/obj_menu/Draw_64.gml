/// @description Draw and animate menus
// You can write your code in this editor

#region menu 1 phase
if menu_phase = 1
{
#region menu drawing tabs/glow/icons
draw_sprite_ext(spr_menu1_color_boxes,0,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,tab_solo_color,1) //draw color in single player tab
draw_sprite_ext(spr_menu1_color_boxes,0,480,270,.2,.2,0,c_white,1) //draw color in single player tab
draw_sprite_ext(spr_menu1_icons,0,icon_solo_x,icon_solo_y,menu_phase1_scale_x,1,0,icon_solo_color,icon_alpha) //draw singleplayer icon
draw_sprite_ext(spr_menu1_glow,0,480,270,menu_phase1_scale_x,1,0,glow_color,tab1_alpha) //draw tab 1's glow

draw_sprite_ext(spr_menu1_color_boxes,1,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,tab_multiplayer_color,1) //draw color in multiplayer tab
draw_sprite_ext(spr_menu1_icons,1,icon_multiplayer_x,icon_multiplayer_y,menu_phase1_scale_x,menu_phase1_scale_y,0,icon_multiplayer_color,icon_alpha) //draw multiplayer icon - controllers
draw_sprite_ext(spr_menu1_icons,2,icon_multiplayer_x + 128,icon_multiplayer_y,menu_phase1_scale_x - .1 ,menu_phase1_scale_y - .1,0,icon_multiplayer_color,icon_alpha) //draw multiplayer icon - globe
draw_sprite_ext(spr_menu1_glow,1,480,270,menu_phase1_scale_x,1,0,glow_color,tab2_alpha) //draw tab 2's glow

draw_sprite_ext(spr_menu1_color_boxes,2,480,270,menu_phase1_scale_x,1,0,tab_customization_color,1) //draw color in multiplayer tab
draw_sprite_ext(spr_menu1_icons,3,icon_customization_x,icon_customization_y,menu_phase1_scale_x,1,0,icon_customization_color,icon_alpha) //draw customize icon - controllers
draw_sprite_ext(spr_menu1_icons,4,icon_customization_x + 128,icon_customization_y - 48,menu_phase1_scale_x - .1,menu_phase1_scale_y - .1,0,icon_customization_color,icon_alpha) //draw customize icon - globe
draw_sprite_ext(spr_menu1_glow,2,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,glow_color,tab3_alpha) //draw tab 3's glow

draw_sprite_ext(spr_menu1_color_boxes,3,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,tab_extras_color,1) //draw color in extras tab
draw_sprite_ext(spr_menu1_icons,5,icon_extras_x,icon_extras_y,menu_phase1_scale_x,menu_phase1_scale_y,0,icon_extras_color,icon_alpha) //draw extras icon - controllers
draw_sprite_ext(spr_menu1_icons,6,icon_extras_x + 128,icon_extras_y - 48,menu_phase1_scale_x - .1,menu_phase1_scale_y - .1,0,icon_extras_color,icon_alpha) //draw extras icon - globe
draw_sprite_ext(spr_menu1_glow,3,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,glow_color,tab4_alpha) //draw tab 4's glow

draw_sprite_ext(spr_menu1_color_boxes,4,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,icon_exit_color,1) //draw color in exit tab
draw_sprite_ext(spr_menu1_icons,7,icon_exit_x,icon_exit_y,menu_phase1_scale_x,menu_phase1_scale_y,0,icon_exit_color,icon_alpha) //draw exit icon - controllers
draw_sprite_ext(spr_menu1_glow,4,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,glow_color,tab6_alpha) //draw tab 6's glow

draw_sprite_ext(spr_menu1_color_boxes,5,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,tab_settings_color,1) //draw color in settings tab
draw_sprite_ext(spr_menu1_icons,8,icon_settings_x,icon_settings_y,menu_phase1_scale_x - .1,menu_phase1_scale_y - .1,0,icon_settings_color,icon_alpha) //draw settings icon - controllers
draw_sprite_ext(spr_menu1_glow,5,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,glow_color,tab5_alpha) //draw tab 5's glow


#endregion

draw_sprite_ext(spr_menu1_main,1,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,c_black,1) //blackness
draw_sprite_ext(spr_menu1_main,0,480,270,menu_phase1_scale_x,menu_phase1_scale_y,0,c_white,1)
}
#endregion

//cursor
draw_sprite_ext(spr_menu_cursor,0,menu_p1_cursor_x,menu_p1_cursor_y,1,1,0,c_red,1)

//testing debug

draw_text_transformed(32, 300, string("menu_transition ") + string(menu_transition), .2, .2, 0);
draw_text_transformed(32, 340, string("menu phase1 scale x ") + string(menu_phase1_scale_x), .2, .2, 0);
draw_text_transformed(32, 360, string("stick_x ") + string(gamepad_axis_value(0,gp_axislh)), .2, .2, 0);

