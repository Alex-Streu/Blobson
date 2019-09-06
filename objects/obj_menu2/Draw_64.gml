/// @description Insert description here

// Tab 1 - Multiplayer
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,menu_tab1_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,menu_tab1_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,menu_tab1_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //boarder
draw_sprite_ext(spr_menu_icons,1,menu_tab1_x,menu_tab1_y,menu_tab1_icon_xscale,menu_tab1_icon_yscale,menu_tab1_icon_angle,c_white,1) //icon multiplayer

draw_set_font(special_font);
draw_text_transformed_color(menu_tab1_font_x, menu_tab1_font_y, string("Multiplayer"), menu_tab1_font_xscale * .27, menu_tab1_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
// Tab 2 - singlelayer/co-op
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab2_slideout_x,menu_tab2_slideout_y,menu_tab2_slideout_xscale,menu_tab2_slideout_yscale,0,menu_tab2_color,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,menu_tab2_color,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,menu_tab2_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab2_x,menu_tab2_y,menu_tab2_x_scale,menu_tab2_y_scale,0,c_white,1) //boarder

draw_text_transformed_color(menu_tab2_font_x, menu_tab2_font_y, string("Singleplayer"), menu_tab2_font_xscale * .27, menu_tab2_font_yscale * .27, 0,c_white,c_white,c_white,c_white,1);
// Tab 3 - customize
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab3_slideout_x,menu_tab3_slideout_y,menu_tab3_slideout_xscale,menu_tab3_slideout_yscale,0,c_white,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,menu_tab3_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab3_x,menu_tab3_y,menu_tab3_x_scale,menu_tab3_y_scale,0,c_white,1) //boarder
// Tab 4 - extras
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab4_slideout_x,menu_tab4_slideout_y,menu_tab4_slideout_xscale,menu_tab4_slideout_yscale,0,c_white,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,menu_tab4_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab4_x,menu_tab4_y,menu_tab4_x_scale,menu_tab4_y_scale,0,c_white,1) //boarder
// Tab 5 - settings
draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab5_slideout_x,menu_tab5_slideout_y,menu_tab5_slideout_xscale,menu_tab5_slideout_yscale,0,c_white,1) //slider
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,c_white,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,c_white,menu_tab5_glow) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab5_x,menu_tab5_y,menu_tab5_x_scale,menu_tab5_y_scale,0,c_white,1) //boarder

draw_sprite_ext(spr_mainmenu,0,menu_boxes_x,menu_boxes_y,menu_boxes_x_scale,menu_boxes_y_scale,0,c_white,1)
draw_sprite_ext(spr_mainmenu,1,menu_info_x,menu_info_y,menu_info_x_scale,menu_info_y_scale,0,c_white,1)

draw_set_font(fnt_menu);
draw_text_transformed(32, 48, string("menu_tab1_x ") + string(menu_tab1_x), .3, .3, 0);
draw_text_transformed(32, 64, string("menu_tab1_y ") + string(menu_tab1_y), .3, .3, 0);
draw_text_transformed(32, 80, string("menu_highlight ") + string(menu_highlight), .3, .3, 0);
draw_text_transformed(32, 96, string("menu_tab2_font_y ") + string(menu_tab2_font_y), .3, .3, 0);
draw_text_transformed(32, 112, string("menu_tab2_font_x ") + string(menu_tab2_font_x), .3, .3, 0);
draw_text_transformed(32, 128, string("menu_tab1_icon_angle ") + string(menu_tab1_icon_angle), .3, .3, 0);
draw_text_transformed(32, 156, string("menu_tab1_icon_dangleleft ") + string(menu_tab1_icon_dangleleft), .3, .3, 0);
draw_text_transformed(32, 174, string("menu_tab1_icon_dangleright ") + string(menu_tab1_icon_dangleright), .3, .3, 0);

