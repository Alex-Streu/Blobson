/// @description Insert description here

draw_sprite_ext(spr_mainmenu_slideout,0,menu_tab1_slideout_x,menu_tab1_slideout_y,menu_tab1_slideout_xscale,menu_tab1_slideout_yscale,0,c_white,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,1,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //inside color
draw_sprite_ext(spr_mainmenu_tabs,2,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //glow
draw_sprite_ext(spr_mainmenu_tabs,0,menu_tab1_x,menu_tab1_y,menu_tab1_x_scale,menu_tab1_y_scale,0,c_white,1) //boarder

draw_sprite_ext(spr_mainmenu,0,menu_boxes_x,menu_boxes_y,menu_boxes_x_scale,menu_boxes_y_scale,0,c_white,1)
draw_sprite_ext(spr_mainmenu,1,menu_info_x,menu_info_y,menu_info_x_scale,menu_info_y_scale,0,c_white,1)

draw_text_transformed(32, 48, string("menu_tab1_x ") + string(menu_tab1_x), 1, 1, 0);
draw_text_transformed(32, 64, string("menu_tab1_y ") + string(menu_tab1_y), 1, 1, 0);