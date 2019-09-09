/// @description Insert description here
// You can write your code in this editor

map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
special_font = font_add_sprite_ext(spr_font1, map_string, true, -0);
draw_set_font(special_font);

menu_phase = 1;



#region   menu background variables
menu_bg = spr_background_arena_main;
menu_bg_number = 1;

menu_bg1 = spr_background_arena_main;
menu_bg1_max = 100;
menu_bg1_alpha = 1;

menu_bg1_x = 864;
menu_bg1_y = 160;


menu_bg2 = spr_bg_trainingA;
menu_bg2_max = 100;

menu_bg2_x = 1024;
menu_bg2_y = 160;



menu_bg2_alpha = 0;

#endregion

#region   Menu Boxes variables
menu_boxes_x_destination = 279;
menu_boxes_y_destination = 0;
menu_boxes_x_spawn = -960;
menu_boxes_y_spawn = 158;
menu_boxes_x = menu_boxes_x_spawn;
menu_boxes_y = menu_boxes_y_spawn;
menu_boxes_x_scale = 1;
menu_boxes_y_scale = 1;
menu_boxes_blackness = 0;
#endregion
#region   Info Variables
menu_info_x_spawn = 0;
menu_info_y_spawn = 158;
menu_info_x_destination = 279;
menu_info_y_destination = 158;
menu_info_x = menu_info_x_spawn;
menu_info_y = menu_info_y_spawn;
menu_info_x_scale = 1;
menu_info_y_scale = 1;

menu_info_hero = 0;
#endregion
#region   Highlight/selection variables
menu_highlight = 1;
menu_selected = 0;             //0 = not selected, 1 = selected, 2 = Transistioning 
menu_selected_set_timer = 45;
menu_selected_timer = menu_selected_set_timer;

menu_returned = 0;
menu_final_trans = false;

#endregion

#region menu tab variables

number_of_tabs = 5;
   #region   Phase 1 - tab 1 multiplayer
   menu_tab1 = true;
   
   menu_tab1_x_destination = 0;
   menu_tab1_y_destination = 48;
   menu_tab1_x_spawn = 920;
   menu_tab1_y_spawn = -256;
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
   
   menu_tab1_font_x = menu_tab1_x - 160;
   menu_tab1_font_y = menu_tab1_y + 24;
   menu_tab1_font_xscale = 1;
   menu_tab1_font_yscale = 0;
   
   menu_tab1_icon_xscale = .5;
   menu_tab1_icon_yscale = .5;
   menu_tab1_icon_angle = 0;
   menu_tab1_icon_dangleleft = true;
   menu_tab1_icon_dangleright = false;
   menu_tab1_icon_color = make_colour_hsv(150, 150, 0);// icon's color
   
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
   menu_tab2_y_spawn = -356;
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
   menu_tab2_icon_color = make_colour_hsv(0, 150, 0);// icon's color
   
   menu_tab2_color_no = make_colour_hsv(0, 175, 100); //when not highlighted
   menu_tab2_color_yes = make_colour_hsv(0, 220, 255);//when highlighted
   menu_tab2_color = make_colour_hsv(0, 220, 220);//tab 1
   #endregion
   #region   Phase 1 - tab 3 customization
   menu_tab3 = true;
   
   menu_tab3_x_destination = 0;
   menu_tab3_y_destination = 208+32;
   menu_tab3_x_spawn = 920;
   menu_tab3_y_spawn = -456;
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
   
   menu_tab3_font_x = menu_tab3_x - 240;
   menu_tab3_font_y = menu_tab3_y - 16;
   menu_tab3_font_xscale = 1;
   menu_tab3_font_yscale = 0;
   
   menu_tab3_icon_xscale = .4;
   menu_tab3_icon_yscale = .4;
   menu_tab3_icon_angle = 0;
   menu_tab3_icon_dangleleft = true;
   menu_tab3_icon_dangleright = false;
   menu_tab3_icon_color = make_colour_hsv(40, 150, 0);// icon's color
   
   menu_tab3_color_no = make_colour_hsv(40, 175, 100); //when not highlighted
   menu_tab3_color_yes = make_colour_hsv(40, 220, 255);//when highlighted
   menu_tab3_color = make_colour_hsv(0, 220, 220);//tab 1
   #endregion
   #region   Phase 1 - tab 4 extras
   menu_tab4 = true;
   
   menu_tab4_x_destination = 0;
   menu_tab4_y_destination = 288+48;
   menu_tab4_x_spawn = 920;
   menu_tab4_y_spawn = -556;
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
   
   menu_tab4_font_x = menu_tab4_x - 240;
   menu_tab4_font_y = menu_tab4_y - 16;
   menu_tab4_font_xscale = 1;
   menu_tab4_font_yscale = 0;
   
   menu_tab4_icon_xscale = .4;
   menu_tab4_icon_yscale = .4;
   menu_tab4_icon_angle = 0;
   menu_tab4_icon_dangleleft = true;
   menu_tab4_icon_dangleright = false;
   menu_tab4_icon_color = make_colour_hsv(90, 220, 0)
   
   menu_tab4_color_no = make_colour_hsv(90, 175, 100); //when not highlighted
   menu_tab4_color_yes = make_colour_hsv(90, 220, 255);//when highlighted
   menu_tab4_color = make_colour_hsv(90, 220, 220);//tab 1
   #endregion
   #region   Phase 1 - tab 5 settings
   menu_tab5 = true;
   
   menu_tab5_x_destination = 0;
   menu_tab5_y_destination = 368+64;
   menu_tab5_x_spawn = 920;
   menu_tab5_y_spawn = -666;
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
   
   menu_tab5_font_x = menu_tab5_x - 240;
   menu_tab5_font_y = menu_tab5_y - 16;
   menu_tab5_font_xscale = 1;
   menu_tab5_font_yscale = 0;
   
   menu_tab5_icon_xscale = .4;
   menu_tab5_icon_yscale = .4;
   menu_tab5_icon_angle = 0;
   menu_tab5_icon_dangleleft = true;
   menu_tab5_icon_dangleright = false;
   menu_tab5_icon_color = make_colour_hsv(190, 220, 0)
   
   menu_tab5_color_no = make_colour_hsv(190, 175, 100); //when not highlighted
   menu_tab5_color_yes = make_colour_hsv(190, 255, 255);//when highlighted
   menu_tab5_color = make_colour_hsv(190, 220, 220);//tab 1
   #endregion

   #region
   
   #endregion


#endregion