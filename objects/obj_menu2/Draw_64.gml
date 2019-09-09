/// @description Insert description here

draw_set_font(special_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

#region   Menu phase 1
if menu_phase = 1
{
#region Tab 1 - Multiplayer
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,c_white,menu_tab1_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,menu_tab1_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,menu_tab1_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,menu_tab1_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,1,menu_tab1_x,menu_tab1_y,menu_tab1_icon_xscale,menu_tab1_icon_yscale,menu_tab1_icon_angle,menu_tab1_icon_color,1) //icon multiplayer
draw_text_transformed_color(menu_tab1_font_x, menu_tab1_font_y, string("Multiplayer"), menu_tab1_font_xscale * .27, menu_tab1_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 2 - singlelayer/co-op
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab2_slideout_x,menu_tab2_slideout_y,menu_tab2_slideout_xscale,menu_tab2_slideout_yscale,0,c_white,menu_tab2_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab2_slideout_x,menu_tab2_slideout_y,menu_tab2_slideout_xscale,menu_tab2_slideout_yscale,0,menu_tab2_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,menu_tab2_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,menu_tab2_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,0,menu_tab2_x,menu_tab2_y,menu_tab2_icon_xscale,menu_tab2_icon_yscale,menu_tab2_icon_angle,menu_tab2_icon_color,1) //icon singleplayer
draw_text_transformed_color(menu_tab2_font_x, menu_tab2_font_y, string("Singleplayer"), menu_tab2_font_xscale * .27, menu_tab2_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 3 - customize
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab3_slideout_x,menu_tab3_slideout_y,menu_tab3_slideout_xscale,menu_tab3_slideout_yscale,0,c_white,menu_tab3_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab3_slideout_x,menu_tab3_slideout_y,menu_tab3_slideout_xscale,menu_tab3_slideout_yscale,0,menu_tab3_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,menu_tab3_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,menu_tab3_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,3,menu_tab3_x,menu_tab3_y,menu_tab3_icon_xscale,menu_tab3_icon_yscale,menu_tab3_icon_angle,menu_tab3_icon_color,1) //icon customize
draw_text_transformed_color(menu_tab3_font_x, menu_tab3_font_y, string("Customization"), menu_tab3_font_xscale * .27, menu_tab3_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 4 - extras
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab4_slideout_x,menu_tab4_slideout_y,menu_tab4_slideout_xscale,menu_tab4_slideout_yscale,0,c_white,menu_tab4_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab4_slideout_x,menu_tab4_slideout_y,menu_tab4_slideout_xscale,menu_tab4_slideout_yscale,0,menu_tab4_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,menu_tab4_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,menu_tab4_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,5,menu_tab4_x,menu_tab4_y,menu_tab4_icon_xscale,menu_tab4_icon_yscale,menu_tab4_icon_angle,menu_tab4_icon_color,1) //icon extras
draw_text_transformed_color(menu_tab4_font_x, menu_tab4_font_y, string("Extras"), menu_tab4_font_xscale * .27, menu_tab4_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 5 - settings
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab5_slideout_x,menu_tab5_slideout_y,menu_tab5_slideout_xscale,menu_tab5_slideout_yscale,0,c_white,menu_tab5_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab5_slideout_x,menu_tab5_slideout_y,menu_tab5_slideout_xscale,menu_tab5_slideout_yscale,0,menu_tab5_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,menu_tab5_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,c_white,menu_tab5_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,8,menu_tab5_x,menu_tab5_y,menu_tab5_icon_xscale,menu_tab5_icon_yscale,menu_tab5_icon_angle,menu_tab5_icon_color,1) //icon settings
draw_text_transformed_color(menu_tab5_font_x, menu_tab5_font_y, string("Settings"), menu_tab5_font_xscale * .27, menu_tab5_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
}
#endregion

#region   Menu phase 2 - multiplayer (tag-team, solo, crew)
if menu_phase = 2
{
#region Tab 1 - Tag-team
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,c_white,menu_tab1_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,menu_tab1_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,menu_tab1_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,menu_tab1_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,1,menu_tab1_x,menu_tab1_y,menu_tab1_icon_xscale,menu_tab1_icon_yscale,menu_tab1_icon_angle,menu_tab1_icon_color,1) //icon multiplayer
draw_text_transformed_color(menu_tab1_font_x, menu_tab1_font_y, string("Tag-Team"), menu_tab1_font_xscale * .27, menu_tab1_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 2 - solo 1on1
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab2_slideout_x,menu_tab2_slideout_y,menu_tab2_slideout_xscale,menu_tab2_slideout_yscale,0,c_white,menu_tab2_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab2_slideout_x,menu_tab2_slideout_y,menu_tab2_slideout_xscale,menu_tab2_slideout_yscale,0,menu_tab2_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,menu_tab2_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,menu_tab2_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,0,menu_tab2_x,menu_tab2_y,menu_tab2_icon_xscale,menu_tab2_icon_yscale,menu_tab2_icon_angle,menu_tab2_icon_color,1) //icon singleplayer
draw_text_transformed_color(menu_tab2_font_x, menu_tab2_font_y, string("1 vs 1"), menu_tab2_font_xscale * .27, menu_tab2_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 3 - 2v2
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab3_slideout_x,menu_tab3_slideout_y,menu_tab3_slideout_xscale,menu_tab3_slideout_yscale,0,c_white,menu_tab3_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab3_slideout_x,menu_tab3_slideout_y,menu_tab3_slideout_xscale,menu_tab3_slideout_yscale,0,menu_tab3_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,menu_tab3_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,menu_tab3_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,3,menu_tab3_x,menu_tab3_y,menu_tab3_icon_xscale,menu_tab3_icon_yscale,menu_tab3_icon_angle,menu_tab3_icon_color,1) //icon customize
draw_text_transformed_color(menu_tab3_font_x, menu_tab3_font_y, string("2 vs 2"), menu_tab3_font_xscale * .27, menu_tab3_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
#region Tab 4 - Crew
draw_sprite_ext(spr_mainmenu_slideout,1,menu_tab4_slideout_x,menu_tab4_slideout_y,menu_tab4_slideout_xscale,menu_tab4_slideout_yscale,0,c_white,menu_tab4_glow) //slider glow
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab4_slideout_x,menu_tab4_slideout_y,menu_tab4_slideout_xscale,menu_tab4_slideout_yscale,0,menu_tab4_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,menu_tab4_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,menu_tab4_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,5,menu_tab4_x,menu_tab4_y,menu_tab4_icon_xscale,menu_tab4_icon_yscale,menu_tab4_icon_angle,menu_tab4_icon_color,1) //icon extras
draw_text_transformed_color(menu_tab4_font_x, menu_tab4_font_y, string("Crew Battle"), menu_tab4_font_xscale * .27, menu_tab4_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
#endregion
}
#endregion

draw_sprite_ext(spr_mainmenu,1,menu_info_x,menu_info_y,menu_info_x_scale,menu_info_y_scale,0,c_white,1)
draw_sprite_ext(spr_mainmenu,2,menu_boxes_x,menu_boxes_y,menu_boxes_x_scale,menu_boxes_y_scale,0,c_white,menu_boxes_blackness)//blackness
draw_sprite_ext(spr_mainmenu,0,menu_boxes_x,menu_boxes_y,menu_boxes_x_scale,menu_boxes_y_scale,0,c_white,1)


draw_set_font(fnt_menu);

draw_text_transformed(32, 96, string("menu_tab1_font_y ") + string(menu_tab1_y), .3, .3, 0);
draw_text_transformed(32, 112, string("menu_returned ") + string(menu_returned), .3, .3, 0);
draw_text_transformed(32, 128, string("menu_selected ") + string(menu_selected), .3, .3, 0);
draw_text_transformed(32, 144, string("menu_phase ") + string(menu_phase), .3, .3, 0);
draw_text_transformed(32, 160, string("menu_final_trans ") + string(menu_final_trans), .3, .3, 0);