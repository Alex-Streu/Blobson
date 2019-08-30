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
#region customization tab/icon/etc
icon_customization_x_destination = 80;
icon_customization_x_spawn = -256;
icon_customization_x = icon_customization_x_spawn;
icon_customization_y = 312;
icon_customization_color = make_colour_hsv(30, 200, 100);

//Tab 3 customization
tab_customization_color_no = make_colour_hsv(30, 52, 25); //when not highlighted
tab_customization_color_yes = make_colour_hsv(30, 220, 220);//when highlighted
tab_customization_color = tab_customization_color_no;
#endregion
#region Extras/Stats tab/icon/etc
icon_extras_x_destination = 760;
icon_extras_x_spawn = 1100;
icon_extras_x = icon_extras_x_spawn;
icon_extras_y = 312;
icon_extras_color = make_colour_hsv(90, 200, 100);

//Tab 4 extras/stats
tab_extras_color_no = make_colour_hsv(90, 52, 25); //when not highlighted
tab_extras_color_yes = make_colour_hsv(90, 220, 220);//when highlighted
tab_extras_color = tab_extras_color_no;
#endregion
#region settings tab/icon/etc
icon_settings_x_destination = 750;
icon_settings_x_spawn = 1100;
icon_settings_x = icon_settings_x_spawn;
icon_settings_y = 480;
icon_settings_color = make_colour_hsv(140, 200, 100);

//Tab 5 settings
tab_settings_color_no = make_colour_hsv(140, 52, 25); //when not highlighted
tab_settings_color_yes = make_colour_hsv(140, 220, 220);//when highlighted
tab_settings_color = tab_settings_color_no;
#endregion
#region exit tab/icon/etc
icon_exit_x_destination = 152;
icon_exit_x_spawn = -96;
icon_exit_x = icon_exit_x_spawn;
icon_exit_y = 480;
icon_exit_color = make_colour_hsv(200, 200, 100);

//Tab 6 settings
tab_exit_color_no = make_colour_hsv(200, 52, 25); //when not highlighted
tab_exit_color_yes = make_colour_hsv(200, 220, 220);//when highlighted
tab_exit_color = tab_exit_color_no;
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

#region p1 control stick /dpad
//Stick
menu_p1_cursor_x = 480;
menu_p1_cursor_y = 270;
menu_p1_cursor_x_distance = 420;
menu_p1_cursor_y_distance = 240;
menu_p1_cursor_active = true;
menu_p1_cursor_confirm = false;
menu_p1_cursor_return = false;
menu_p1_cursor_deadzone = 0;
menu_p1_cursor_thresh = 0.5;
//dpad
menu_dpad_right = false;
menu_dpad_left = false;
menu_dpad_down= false;
menu_dpad_up= false;
#endregion

tab1_sound_refreshed = true;
tab2_sound_refreshed = true;
tab3_sound_refreshed = true;
tab4_sound_refreshed = true;
tab5_sound_refreshed = true;
tab6_sound_refreshed = true;

menu_stick_right_returned = true;


