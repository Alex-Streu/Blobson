/// @description Insert description here
// You can write your code in this editor

#region Main variables (non-tabs)

//font settings
map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
special_font = font_add_sprite_ext(spr_font1, map_string, true, -0);
draw_set_font(special_font);

menu_phase = 1;

//Animated BG
menu_bg_grid_frame = 0;
#endregion

#region   Main Box variables
menu_mainbox_spawn_x = -960;
menu_mainbox_spawn_y = 285;
menu_mainbox_x = menu_mainbox_spawn_x;
menu_mainbox_y = menu_mainbox_spawn_y;
menu_mainbox_goal_x = 480;
menu_mainbox_goal_y = 285;

menu_mainbox_ads1_x = -960;
menu_mainbox_ads1_y = 161;
menu_mainbox_ads2_x = -960;
menu_mainbox_ads2_y = 271;

#endregion

#region   Tab main variables
number_of_tabs = 6;
tab_highlight = 1;

#endregion

//Tabs____________________________________________________________________________________________________________________________________________________________________________________________________
#region tab general variables
menu_tab_grid_frame = 2;
menu_tab_grid_endframe = 11;

menu_tab2_alpha = 1;
menu_tab3_alpha = 1;
menu_tab4_alpha = 1;
menu_tab5_alpha = 1;
menu_tab6_alpha = 1;
#endregion
#region tab 1 variables
menu_tab1_alpha = 1;
menu_tab1_y_spawn = -256;
menu_tab1_x_spawn = 176;
menu_tab1_x = menu_tab1_x_spawn;
menu_tab1_y = menu_tab1_y_spawn;
menu_tab1_y_goal = 64;
menu_tab1_xscale = 1;
menu_tab1_yscale = 1;
//font
menu_tab1_font_x = menu_tab1_x;
menu_tab1_font_y = menu_tab1_y;
menu_tab1_font_x_offset = -16;
menu_tab1_font_y_offset = -28;
menu_tab1_font_xscale = 1;
menu_tab1_font_yscale = 1;
menu_tab1_font_angle = 0;
//icon
menu_tab1_icon_x = menu_tab1_x;
menu_tab1_icon_y = menu_tab1_y;
menu_tab1_icon_x_offset = 0;
menu_tab1_icon_y_offset = 12;
menu_tab1_icon_xscale = .7;
menu_tab1_icon_yscale = .7;
menu_tab1_icon_angle = 0;
menu_tab1_icon_color = make_colour_hsv(0, 150, 100);// icon's color
menu_tab1_icon_alpha = .75;

menu_tab1_icon_dangleleft = true;
menu_tab1_icon_dangleright = false;
   
   //Tab 1 singleplayer
   menu_tab1_color_no = make_colour_hsv(0, 175, 100); //when not highlighted
   menu_tab1_color_yes = make_colour_hsv(0, 220, 255);//when highlighted
   menu_tab1_color = make_colour_hsv(0, 220, 220);//tab 1
#endregion
#region tab 2 variables
menu_tab2_alpha = 1;
menu_tab2_y_spawn = -256;
menu_tab2_x_spawn = 480;
menu_tab2_x = menu_tab2_x_spawn;
menu_tab2_y = menu_tab2_y_spawn;
menu_tab2_y_goal = 64;
menu_tab2_xscale = 1;
menu_tab2_yscale = 1;
//font
menu_tab2_font_x = menu_tab2_x;
menu_tab2_font_y = menu_tab2_y;
menu_tab2_font_x_offset = 0;
menu_tab2_font_y_offset = -28;
menu_tab2_font_xscale = 1;
menu_tab2_font_yscale = 1;
menu_tab2_font_angle = 0;
//icon
menu_tab2_icon_x = menu_tab2_x;
menu_tab2_icon_y = menu_tab2_y;
menu_tab2_icon_x_offset = -48;
menu_tab2_icon_y_offset = 12;
menu_tab2_icon_xscale = .7;
menu_tab2_icon_yscale = .7;
menu_tab2_icon_angle = 0;
menu_tab2_icon_color = make_colour_hsv(150, 150, 100);// icon's color
menu_tab2_icon_alpha = .75;

menu_tab2_icon_dangleleft = false;
menu_tab2_icon_dangleright = false;
   
   //Tab 2 multiplayer
   menu_tab2_color_no = make_colour_hsv(150, 175, 100); //when not highlighted
   menu_tab2_color_yes = make_colour_hsv(150, 220, 255);//when highlighted
   menu_tab2_color = make_colour_hsv(150, 220, 255);//tab 1
#endregion
#region tab 3 variables
menu_tab3_alpha = 1;
menu_tab3_y_spawn = -256;
menu_tab3_x_spawn = 780;
menu_tab3_x = menu_tab3_x_spawn;
menu_tab3_y = menu_tab3_y_spawn;
menu_tab3_y_goal = 64;
menu_tab3_xscale = 1;
menu_tab3_yscale = 1;
//font
menu_tab3_font_x = menu_tab3_x;
menu_tab3_font_y = menu_tab3_y;
menu_tab3_font_x_offset = 16;
menu_tab3_font_y_offset = -28;
menu_tab3_font_xscale = 1;
menu_tab3_font_yscale = 1;
menu_tab3_font_angle = 0;
//icon
menu_tab3_icon_x = menu_tab3_x;
menu_tab3_icon_y = menu_tab3_y;
menu_tab3_icon_x_offset = -48;
menu_tab3_icon_y_offset = 12;
menu_tab3_icon_xscale = .6;
menu_tab3_icon_yscale = .6;
menu_tab3_icon_angle = 0;
menu_tab3_icon_color = make_colour_hsv(40, 150, 100);// icon's color
menu_tab3_icon_alpha = .75;

menu_tab3_icon_dangleleft = false;
menu_tab3_icon_dangleright = false;
   
   //Tab 3 customize
   menu_tab3_color_no = make_colour_hsv(40, 175, 100); //when not highlighted
   menu_tab3_color_yes = make_colour_hsv(40, 220, 255);//when highlighted
   menu_tab3_color = make_colour_hsv(40, 220, 255);//tab 1
#endregion
#region tab 5 variables
menu_tab5_alpha = 1;
menu_tab5_y_spawn = 796;
menu_tab5_x_spawn = 480;
menu_tab5_x = menu_tab5_x_spawn;
menu_tab5_y = menu_tab5_y_spawn;
menu_tab5_y_goal = 472;
menu_tab5_xscale = 1;
menu_tab5_yscale = 1;
//font
menu_tab5_font_x = menu_tab5_x;
menu_tab5_font_y = menu_tab5_y;
menu_tab5_font_x_offset = 0;
menu_tab5_font_y_offset = -28;
menu_tab5_font_xscale = 1;
menu_tab5_font_yscale = 1;
menu_tab5_font_angle = 0;
//icon
menu_tab5_icon_x = menu_tab5_x;
menu_tab5_icon_y = menu_tab5_y;
menu_tab5_icon_x_offset = -48;
menu_tab5_icon_y_offset = 12;
menu_tab5_icon_xscale = .5;
menu_tab5_icon_yscale = .5;
menu_tab5_icon_angle = 0;
menu_tab5_icon_color = make_colour_hsv(90, 150, 100);// icon's color
menu_tab5_icon_alpha = .75;

menu_tab5_icon_dangleleft = false;
menu_tab5_icon_dangleright = false;
   
   //Tab 5 extra
   menu_tab5_color_no = make_colour_hsv(90, 175, 100); //when not highlighted
   menu_tab5_color_yes = make_colour_hsv(90, 220, 200);//when highlighted
   menu_tab5_color = make_colour_hsv(90, 220, 200);//tab 1
#endregion