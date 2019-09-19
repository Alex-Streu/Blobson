/// @description Insert description here
// You can write your code in this editor



//bg
draw_sprite_ext(spr_menu_bg_grid,menu_bg_grid_frame,0,300,1,1,0,c_white,1);

//main boxes
draw_sprite_ext(spr_menu_main_tab,1,480,menu_mainbox_y,1,1,0,c_white,1);
draw_sprite_ext(spr_menu_ads,0,menu_mainbox_ads1_x,menu_mainbox_ads1_y,1,1,0,c_white,1); //ad top
draw_sprite_ext(spr_menu_ads,0,menu_mainbox_ads2_x,menu_mainbox_ads2_y,1,1,0,c_white,1); //ad bottom
draw_sprite_ext(spr_menu_main_tab,0,menu_mainbox_x,menu_mainbox_y,1,1,0,c_white,1);


//boarder top left highlighted
draw_set_font(special_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//tab1
if tab_highlight = 1    {draw_sprite_ext(spr_menu_tab_tl,menu_tab_grid_frame,menu_tab1_x,menu_tab1_y,menu_tab1_xscale,menu_tab1_yscale,0,menu_tab1_color,menu_tab1_alpha);}
if tab_highlight != 1   {draw_sprite_ext(spr_menu_tab_tl,2,menu_tab1_x,menu_tab1_y,menu_tab1_xscale,menu_tab1_yscale,0,menu_tab1_color_no,menu_tab1_alpha);}
draw_sprite_ext(spr_menu_icons,0,menu_tab1_icon_x,menu_tab1_icon_y,menu_tab1_icon_xscale,menu_tab1_icon_yscale,menu_tab1_icon_angle,menu_tab1_icon_color,menu_tab1_icon_alpha);
draw_sprite_ext(spr_menu_tab_tl,0,menu_tab1_x,menu_tab1_y,menu_tab1_xscale,menu_tab1_yscale,0,c_white,menu_tab1_alpha);
//tab2
if tab_highlight = 2    {draw_sprite_ext(spr_menu_tab_tm,menu_tab_grid_frame,menu_tab2_x,menu_tab2_y,menu_tab2_xscale,menu_tab2_yscale,0,menu_tab2_color,menu_tab2_alpha);}
if tab_highlight != 2   {draw_sprite_ext(spr_menu_tab_tm,2,menu_tab2_x,menu_tab2_y,menu_tab2_xscale,menu_tab2_yscale,0,menu_tab2_color_no,menu_tab2_alpha);}
draw_sprite_ext(spr_menu_icons,1,menu_tab2_icon_x,menu_tab2_icon_y,menu_tab2_icon_xscale,menu_tab2_icon_yscale,menu_tab2_icon_angle,menu_tab2_icon_color,menu_tab2_icon_alpha);
draw_sprite_ext(spr_menu_icons,2,menu_tab2_icon_x + 96,menu_tab2_icon_y,menu_tab2_icon_xscale,menu_tab2_icon_yscale,menu_tab2_icon_angle,menu_tab2_icon_color,menu_tab2_icon_alpha);
draw_sprite_ext(spr_menu_tab_tm,0,menu_tab2_x,menu_tab2_y,menu_tab2_xscale,menu_tab2_yscale,0,c_white,menu_tab2_alpha);
//tab3
if tab_highlight = 3    {draw_sprite_ext(spr_menu_tab_tr,menu_tab_grid_frame,menu_tab3_x,menu_tab3_y,menu_tab3_xscale,menu_tab3_yscale,0,menu_tab3_color,menu_tab3_alpha);}
if tab_highlight != 3   {draw_sprite_ext(spr_menu_tab_tr,3,menu_tab3_x,menu_tab3_y,menu_tab3_xscale,menu_tab3_yscale,0,menu_tab3_color_no,menu_tab3_alpha);}
draw_sprite_ext(spr_menu_icons,3,menu_tab3_icon_x,menu_tab3_icon_y,menu_tab3_icon_xscale,menu_tab3_icon_yscale,menu_tab3_icon_angle,menu_tab3_icon_color,menu_tab3_icon_alpha);
draw_sprite_ext(spr_menu_icons,4,menu_tab3_icon_x + 96,menu_tab3_icon_y,menu_tab3_icon_xscale,menu_tab3_icon_yscale,menu_tab3_icon_angle,menu_tab3_icon_color,menu_tab3_icon_alpha);
draw_sprite_ext(spr_menu_tab_tr,0,menu_tab3_x,menu_tab3_y,menu_tab3_xscale,menu_tab3_yscale,0,c_white,menu_tab3_alpha);//boarder
//tab5
if tab_highlight = 5    {draw_sprite_ext(spr_menu_tab_bm,menu_tab_grid_frame,menu_tab5_x,menu_tab5_y,menu_tab5_xscale,menu_tab5_yscale,0,menu_tab5_color,menu_tab5_alpha);}
if tab_highlight != 5   {draw_sprite_ext(spr_menu_tab_bm,3,menu_tab5_x,menu_tab5_y,menu_tab5_xscale,menu_tab5_yscale,0,menu_tab5_color_no,menu_tab5_alpha);}
draw_sprite_ext(spr_menu_icons,5,menu_tab5_icon_x,menu_tab5_icon_y,menu_tab5_icon_xscale,menu_tab5_icon_yscale,menu_tab5_icon_angle,menu_tab5_icon_color,menu_tab5_icon_alpha);
draw_sprite_ext(spr_menu_icons,6,menu_tab5_icon_x + 96,menu_tab5_icon_y,menu_tab5_icon_xscale,menu_tab5_icon_yscale,menu_tab5_icon_angle,menu_tab5_icon_color,menu_tab5_icon_alpha);
draw_sprite_ext(spr_menu_tab_bm,0,menu_tab5_x,menu_tab5_y,menu_tab5_xscale,menu_tab5_yscale,0,c_white,menu_tab5_alpha);//boarder

draw_text_transformed_color(menu_tab1_font_x, menu_tab1_font_y, string("Singleplayer"), menu_tab1_font_xscale * .25, menu_tab1_font_yscale * .25, menu_tab1_font_angle,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(menu_tab2_font_x, menu_tab2_font_y, string("Multiplayer"), menu_tab2_font_xscale * .25, menu_tab2_font_yscale * .25, menu_tab2_font_angle,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(menu_tab3_font_x, menu_tab3_font_y, string("Customization"), menu_tab3_font_xscale * .25, menu_tab3_font_yscale * .25, menu_tab3_font_angle,c_white,c_white,c_white,c_white,1);

draw_text_transformed_color(menu_tab5_font_x, menu_tab5_font_y, string("Extra"), menu_tab5_font_xscale * .25, menu_tab5_font_yscale * .25, menu_tab5_font_angle,c_white,c_white,c_white,c_white,1);

draw_text_transformed(128, 256, string("tab highlight") + string(tab_highlight), .3, .3, 0);


