/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(0,menu_p1_cursor_deadzone);

gamepad_set_button_threshold(0,menu_p1_cursor_thresh);
menu_p1_cursor_x = -32 + gamepad_axis_value(0,gp_axislh) * menu_p1_cursor_x_distance + 480;
menu_p1_cursor_y = -32 + gamepad_axis_value(0,gp_axislv) * menu_p1_cursor_y_distance + 270;


#region Phase 1
#region highlighting Tab 1 single player
if menu_p1_cursor_x > 50 and menu_p1_cursor_x < 350 and menu_p1_cursor_y < 120
{
	menu_highlight = 1;
	if tab1_sound_refreshed = true   {audio_play_sound(sfx_menu_highlight1,10,false)     tab1_sound_refreshed = false;}
}
else
{
	tab1_sound_refreshed = true;
}
#endregion
#region highlighting Tab 2 multiplayer
if menu_p1_cursor_x < 860 and menu_p1_cursor_x > 500 and menu_p1_cursor_y < 120
{
	menu_highlight = 2;
	if tab2_sound_refreshed = true   {audio_emitter_pitch(sfx_menu_highlight1,1.5) audio_play_sound(sfx_menu_highlight1,10,false)     tab2_sound_refreshed = false;}
}
else
{
	tab2_sound_refreshed = true;
}
#endregion
#region highlighting Tab 3 customize
if menu_p1_cursor_x < 280 and menu_p1_cursor_y > 140 and menu_p1_cursor_y < 390
{
	menu_highlight = 3;
	if tab3_sound_refreshed = true   {audio_play_sound(sfx_menu_highlight1,10,false)     tab3_sound_refreshed = false;}
}
else
{
	tab3_sound_refreshed = true;
}
#endregion
#region highlighting Tab 4 extras
if menu_p1_cursor_x > 660 and menu_p1_cursor_y > 140 and menu_p1_cursor_y < 390
{
	menu_highlight = 4;
	if tab4_sound_refreshed = true   {audio_play_sound(sfx_menu_highlight1,10,false)     tab4_sound_refreshed = false;}
}
else
{
	tab4_sound_refreshed = true;
}
#endregion
#region highlighting Tab 5 settings
if menu_p1_cursor_x < 810 and menu_p1_cursor_x > 600 and menu_p1_cursor_y > 420
{
	menu_highlight = 5;
	if tab5_sound_refreshed = true   {audio_play_sound(sfx_menu_highlight1,10,false)     tab5_sound_refreshed = false;}
}
else
{
	tab5_sound_refreshed = true;
}
#endregion
#region highlighting Tab 6 settings
if menu_p1_cursor_x > 105 and menu_p1_cursor_x < 380 and menu_p1_cursor_y > 405
{
	menu_highlight = 6;
	if tab6_sound_refreshed = true   {audio_play_sound(sfx_menu_highlight1,10,false)     tab6_sound_refreshed = false;}
}
else
{
	tab6_sound_refreshed = true;
}
#endregion

#endregion

#region Change Singleplayer tab color/alpha/animation
//Update alpha and color on singleplayer tab
if menu_phase = 1    if menu_highlight = 1
{
tab_solo_color = tab_solo_color_yes;   //make color red if highlighted
if tab1_alpha != 1    {tab1_alpha += 0.15;} //make glow appear smoothly
if tab1_alpha > 1    {tab1_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_solo_x += (icon_solo_x_destination - icon_solo_x) / 4
}
else
{
tab_solo_color = tab_solo_color_no; //make color dark if not highlighted
if tab1_alpha != 0    {tab1_alpha -= 0.15;} //make glow appear smoothly
if tab1_alpha < 0    {tab1_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_solo_x += (icon_solo_x_spawn - icon_solo_x) / 4
}
#endregion
#region Change multiplayer tab color/alpha/animation
//Update alpha and color on ,ultiplayer tab
if menu_phase = 1    if menu_highlight = 2
{
tab_multiplayer_color = tab_multiplayer_color_yes;   //make color red if highlighted
if tab2_alpha != 1    {tab2_alpha += 0.15;} //make glow appear smoothly
if tab2_alpha > 1    {tab2_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_multiplayer_x += (icon_multiplayer_x_destination - icon_multiplayer_x) / 4
}
else
{
tab_multiplayer_color = tab_multiplayer_color_no; //make color dark if not highlighted
if tab2_alpha != 0    {tab2_alpha -= 0.15;} //make glow appear smoothly
if tab2_alpha < 0    {tab2_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_multiplayer_x += (icon_multiplayer_x_spawn - icon_multiplayer_x) / 4
}
#endregion
#region Change customization tab color/alpha/animation
//Update alpha and color on ,ultiplayer tab
if menu_phase = 1    if menu_highlight = 3
{
tab_customization_color = tab_customization_color_yes;   //make color red if highlighted
if tab3_alpha != 1    {tab3_alpha += 0.15;} //make glow appear smoothly
if tab3_alpha > 1    {tab3_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_customization_x += (icon_customization_x_destination - icon_customization_x) / 4
}
else
{
tab_customization_color = tab_customization_color_no; //make color dark if not highlighted
if tab3_alpha != 0    {tab3_alpha -= 0.15;} //make glow appear smoothly
if tab3_alpha < 0    {tab3_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_customization_x += (icon_customization_x_spawn - icon_customization_x) / 4
}
#endregion
#region Change extras tab color/alpha/animation
//Update alpha and color on ,ultiplayer tab
if menu_phase = 1    if menu_highlight = 4
{
tab_extras_color = tab_extras_color_yes;   //make color red if highlighted
if tab4_alpha != 1    {tab4_alpha += 0.15;} //make glow appear smoothly
if tab4_alpha > 1    {tab4_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_extras_x += (icon_extras_x_destination - icon_extras_x) / 4
}
else
{
tab_extras_color = tab_extras_color_no; //make color dark if not highlighted
if tab4_alpha != 0    {tab4_alpha -= 0.15;} //make glow appear smoothly
if tab4_alpha < 0    {tab4_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_extras_x += (icon_extras_x_spawn - icon_extras_x) / 4
}
#endregion
#region Change settings tab color/alpha/animation
//Update alpha and color on ,ultiplayer tab
if menu_phase = 1    if menu_highlight = 5
{
tab_settings_color = tab_settings_color_yes;   //make color red if highlighted
if tab5_alpha != 1    {tab5_alpha += 0.15;} //make glow appear smoothly
if tab5_alpha > 1    {tab5_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_settings_x += (icon_settings_x_destination - icon_settings_x) / 4
}
else
{
tab_settings_color = tab_settings_color_no; //make color dark if not highlighted
if tab5_alpha != 0    {tab5_alpha -= 0.15;} //make glow appear smoothly
if tab5_alpha < 0    {tab5_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_settings_x += (icon_settings_x_spawn - icon_settings_x) / 4
}
#endregion
#region Change exit tab color/alpha/animation
//Update alpha and color on ,ultiplayer tab
if menu_phase = 1    if menu_highlight = 6
{
tab_exit_color = tab_exit_color_yes;   //make color red if highlighted
if tab6_alpha != 1    {tab6_alpha += 0.15;} //make glow appear smoothly
if tab6_alpha > 1    {tab6_alpha = 1;} //make sure glow stays at max value

//Slide in the icon
icon_exit_x += (icon_exit_x_destination - icon_exit_x) / 4
}
else
{
tab_exit_color = tab_exit_color_no; //make color dark if not highlighted
if tab6_alpha != 0    {tab6_alpha -= 0.15;} //make glow appear smoothly
if tab6_alpha < 0    {tab6_alpha = 0;}//make sure glow stays at minvalue

//Slide in the icon
icon_exit_x += (icon_exit_x_spawn - icon_exit_x) / 4
}
#endregion