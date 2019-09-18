/// @description Insert description here
// You can write your code in this editor

#region Main variables (non-tabs)
map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
special_font = font_add_sprite_ext(spr_font1, map_string, true, -0);
draw_set_font(special_font);

menu_phase = 1;
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