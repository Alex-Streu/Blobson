/// @description Insert description here
// You can write your code in this editor

map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
special_font = font_add_sprite_ext(spr_font1, map_string, true, -0);
draw_set_font(special_font);

#region   Menu Boxes variables
menu_boxes_x_destination = 0;
menu_boxes_y_destination = 0;
menu_boxes_x_spawn = -960;
menu_boxes_y_spawn = 0;
menu_boxes_x = menu_boxes_x_spawn;
menu_boxes_y = menu_boxes_y_spawn;
menu_boxes_x_scale = 1;
menu_boxes_y_scale = 1;
#endregion
#region   Info Variables
menu_info_x_spawn = 0;
menu_info_y_spawn = 240;
menu_info_x_destination = 0;
menu_info_y_destination = 0;
menu_info_x = menu_info_x_spawn;
menu_info_y = menu_info_y_spawn;
menu_info_x_scale = 1;
menu_info_y_scale = 1;

menu_info_hero = 0;
#endregion
#region   Highlight/selection variables
menu_highlight = 1;
menu_selected = 0; //0 = not selected, 1 = selected, 2 = ???
menu_pause_control = true;
#endregion

#region menu tab variables

number_of_tabs = 5;
   #region   Phase 1 - tab 1 multiplayer
   menu_tab1 = true;
   
   menu_tab1_x_destination = 0;
   menu_tab1_y_destination = 48;
   menu_tab1_x_spawn = 920;
   menu_tab1_y_spawn = 0;
   menu_tab1_x = menu_tab1_x_spawn;
   menu_tab1_y = menu_tab1_y_spawn;
   menu_tab1_x_scale = 1;
   menu_tab1_y_scale = 1;
   
   menu_tab1_slideout_x = menu_tab1_x;
   menu_tab1_slideout_y = menu_tab1_y;
   menu_tab1_slideout_x_offset = 0;
   menu_tab1_slideout_y_offset = 10;
   menu_tab1_slideout_xscale = 0;
   menu_tab1_slideout_yscale = 1;
   menu_tab1_slideout_x = menu_tab1_x_spawn;
   menu_tab1_slideout_y = menu_tab1_y_spawn;
   
   menu_tab1_glow = 1; //0 = off, 1 = on
   
   menu_tab1_font_x = menu_tab1_x - 240;
   menu_tab1_font_y = menu_tab1_y - 16;
   menu_tab1_font_xscale = 1;
   menu_tab1_font_yscale = 0;
   
   menu_tab1_icon_xscale = .5;
   menu_tab1_icon_yscale = .5;
   menu_tab1_icon_angle = 0;
   menu_tab1_icon_dangleleft = true;
   menu_tab1_icon_dangleright = false;
   
   //Tab 1 multiplayer
   menu_tab1_color_no = make_colour_hsv(150, 175, 100); //when not highlighted
   menu_tab1_color_yes = make_colour_hsv(150, 220, 255);//when highlighted
   menu_tab1_color = make_colour_hsv(0, 220, 220);//tab 1
   
   #endregion
   #region   Phase 1 - tab 2 solo/co-op
   menu_tab2 = true;
   
   menu_tab2_x_destination = 0;
   menu_tab2_y_destination = 128+16;
   menu_tab2_x_spawn = 920;
   menu_tab2_y_spawn = 0;
   menu_tab2_x = menu_tab2_x_spawn;
   menu_tab2_y = menu_tab2_y_spawn;
   menu_tab2_x_scale = 1;
   menu_tab2_y_scale = 1;
   
   menu_tab2_slideout_x = menu_tab2_x;
   menu_tab2_slideout_y = menu_tab2_y;
   menu_tab2_slideout_x_offset = 0;
   menu_tab2_slideout_y_offset = 10;
   menu_tab2_slideout_xscale = 0;
   menu_tab2_slideout_yscale = 1;
   menu_tab2_slideout_x = menu_tab2_x_spawn;
   menu_tab2_slideout_y = menu_tab2_y_spawn;
   
   menu_tab2_glow = 0; //0 = off, 1 = on
   
   menu_tab2_font_x = menu_tab2_x - 240;
   menu_tab2_font_y = menu_tab2_y - 16;
   menu_tab2_font_xscale = 1;
   menu_tab2_font_yscale = 0;
   
   menu_tab2_icon_xscale = .5;
   menu_tab2_icon_yscale = .5;
   menu_tab2_icon_angle = 0;
   menu_tab2_icon_dangleleft = true;
   menu_tab2_icon_dangleright = false;
   
   menu_tab2_color_no = make_colour_hsv(0, 175, 100); //when not highlighted
   menu_tab2_color_yes = make_colour_hsv(0, 220, 255);//when highlighted
   menu_tab2_color = make_colour_hsv(0, 220, 220);//tab 1
   #endregion
   #region   Phase 1 - tab 3 customization
   menu_tab3 = true;
   
   menu_tab3_x_destination = 0;
   menu_tab3_y_destination = 208+32;
   menu_tab3_x_spawn = 920;
   menu_tab3_y_spawn = 0;
   menu_tab3_x = menu_tab3_x_spawn;
   menu_tab3_y = menu_tab3_y_spawn;
   menu_tab3_x_scale = 1;
   menu_tab3_y_scale = 1;
   
   menu_tab3_slideout_x = menu_tab3_x;
   menu_tab3_slideout_y = menu_tab3_y;
   menu_tab3_slideout_x_offset = 0;
   menu_tab3_slideout_y_offset = 10;
   menu_tab3_slideout_xscale = 0;
   menu_tab3_slideout_yscale = 1;
   menu_tab3_slideout_x = menu_tab3_x_spawn;
   menu_tab3_slideout_y = menu_tab3_y_spawn;
   
   menu_tab3_glow = 0; //0 = off, 1 = on
   #endregion
   #region   Phase 1 - tab 4 extras
   menu_tab4 = true;
   
   menu_tab4_x_destination = 0;
   menu_tab4_y_destination = 288+48;
   menu_tab4_x_spawn = 920;
   menu_tab4_y_spawn = 0;
   menu_tab4_x = menu_tab4_x_spawn;
   menu_tab4_y = menu_tab4_y_spawn;
   menu_tab4_x_scale = 1;
   menu_tab4_y_scale = 1;
   
   menu_tab4_slideout_x = menu_tab4_x;
   menu_tab4_slideout_y = menu_tab4_y;
   menu_tab4_slideout_x_offset = 0;
   menu_tab4_slideout_y_offset = 10;
   menu_tab4_slideout_xscale = 0;
   menu_tab4_slideout_yscale = 1;
   menu_tab4_slideout_x = menu_tab4_x_spawn;
   menu_tab4_slideout_y = menu_tab4_y_spawn;
   
   menu_tab4_glow = 0; //0 = off, 1 = on
   #endregion
   #region   Phase 1 - tab 5 settings
   menu_tab5 = true;
   
   menu_tab5_x_destination = 0;
   menu_tab5_y_destination = 368+64;
   menu_tab5_x_spawn = 920;
   menu_tab5_y_spawn = 0;
   menu_tab5_x = menu_tab5_x_spawn;
   menu_tab5_y = menu_tab5_y_spawn;
   menu_tab5_x_scale = 1;
   menu_tab5_y_scale = 1;
   
   menu_tab5_slideout_x = menu_tab5_x;
   menu_tab5_slideout_y = menu_tab5_y;
   menu_tab5_slideout_x_offset = 0;
   menu_tab5_slideout_y_offset = 10;
   menu_tab5_slideout_xscale = 0;
   menu_tab5_slideout_yscale = 1;
   menu_tab5_slideout_x = menu_tab5_x_spawn;
   menu_tab5_slideout_y = menu_tab5_y_spawn;
   
   menu_tab5_glow = 0; //0 = off, 1 = on
   #endregion

   #region
   
   #endregion


#endregion