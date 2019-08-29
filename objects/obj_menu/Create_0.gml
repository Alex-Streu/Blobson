/// @description main variables

#region menu variables
menu_phase = 1;
menu_highlight = 1; //the current menu tab highlighted
menu_select_pause = false; //While selecting a menu. Pause the ability to control it while it moves.
menu_selected = 0;
#endregion
#region menu phase 1 variables

#region singleplayer tab/icon/etc
icon_solo_x_destination = 152;
icon_solo_x_spawn = -96;
icon_solo_x = icon_solo_x_spawn;
icon_solo_y = 88;

icon_solo_color = make_colour_hsv(0, 200, 100);

//Tab 1 Singleplayer SOLO
tab_solo_color_no = make_colour_hsv(228, 52, 25); //when not highlighted
tab_solo_color_yes = make_colour_hsv(0, 220, 220);//when highlighted
tab_solo_color = make_colour_hsv(0, 220, 220);//tab 1
#endregion
#region multiplayer tab/icon/etc
icon_multiplayer_x_destination = 750;
icon_multiplayer_x_spawn = 1100;
icon_multiplayer_x = icon_multiplayer_x_spawn;
icon_multiplayer_y = 88;
icon_multiplayer_color = make_colour_hsv(150, 200, 100);

//Tab 2 multiplayer
tab_multiplayer_color_no = make_colour_hsv(150, 52, 25); //when not highlighted
tab_multiplayer_color_yes = make_colour_hsv(150, 220, 220);//when highlighted
tab_multiplayer_color = make_colour_hsv(0, 220, 220);//tab 1
#endregion

//Tab glower
tab1_alpha = 1;
tab2_alpha = 0;
tab3_alpha = 0;
tab4_alpha = 0;
tab5_alpha = 0;
tab6_alpha = 0;


menu_highlight = 1; //the current menu tab highlighted
menu_select_pause = false; //While selecting a menu. Pause the ability to control it while it moves.
menu_selected = 0;
#endregion


