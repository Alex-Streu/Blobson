/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(0,menu_p1_cursor_deadzone);

gamepad_set_button_threshold(0,menu_p1_cursor_thresh);
menu_p1_confirm = gamepad_button_check_pressed(0,gp_face1) or gamepad_button_check_pressed(0,gp_start);

#region if the stick is being used in menu
if menu_p1_stick = true
{
menu_p1_cursor_x = -32 + gamepad_axis_value(0,gp_axislh) * menu_p1_cursor_x_distance + 480;
menu_p1_cursor_y = -32 + gamepad_axis_value(0,gp_axislv) * menu_p1_cursor_y_distance + 270;
}
#endregion
#region if D-pad is being used in menu

//p1 controlling
menu_dpad_left = gamepad_button_check(0,gp_padl); 
menu_dpad_right = gamepad_button_check(0,gp_padr);
menu_dpad_up = gamepad_button_check(0,gp_padu); 
menu_dpad_down = gamepad_button_check(0,gp_padd);
#endregion
#region Switch to D-pad or Stick
//Change to D-pad mode if D-pad is pressed
if gamepad_button_check_pressed(0,gp_padl)         if menu_p1_dpad = false       {menu_p1_stick = false;  menu_p1_dpad = true;}
if gamepad_button_check_pressed(0,gp_padr)         if menu_p1_dpad = false       {menu_p1_stick = false;  menu_p1_dpad = true;}
if gamepad_button_check_pressed(0,gp_padu)         if menu_p1_dpad = false       {menu_p1_stick = false;  menu_p1_dpad = true;}
if gamepad_button_check_pressed(0,gp_padd)         if menu_p1_dpad = false       {menu_p1_stick = false;  menu_p1_dpad = true;}
//Change to stick if stick direction is held
if gamepad_axis_value(0,gp_axislh) != 0   or   gamepad_axis_value(0,gp_axislv) != 0   and    menu_p1_stick = false       {menu_p1_stick = true;  menu_p1_dpad = false;}

if menu_p1_dpad = true
{
menu_p1_cursor_x = 480;
menu_p1_cursor_y = 270;
}
#endregion

#region Phase 1 
#region P1 control
if menu_p1_cursor_active = 1
{
	glow_color = glow_color_p1;
	
#region   D-pad control
	 
	//highlighting single player
	if menu_dpad_up = true and menu_dpad_left = true   {menu_p1_cursor_x = 64;   menu_p1_cursor_y = 50;}
	//highlighting multiplayer
	if menu_dpad_up = true and menu_dpad_right = true   {menu_p1_cursor_x = 700;   menu_p1_cursor_y = 50;}
	//highlighting customization
	if menu_dpad_up = false  and menu_dpad_down = false  and menu_dpad_left = true   {menu_p1_cursor_x = 64;   menu_p1_cursor_y = 240;}
	//highlighting extras
	if menu_dpad_up = false  and menu_dpad_down = false  and menu_dpad_right = true   {menu_p1_cursor_x = 700;   menu_p1_cursor_y = 240;}
	//highlighting exit
	if menu_dpad_down = true and menu_dpad_left = true   {menu_p1_cursor_x = 256;   menu_p1_cursor_y = 460;}
	//highlighting settings
	if menu_dpad_down = true and menu_dpad_right = true   {menu_p1_cursor_x = 700;   menu_p1_cursor_y = 500;}
	
	#endregion
	
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
}
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

#region Confirm seleted tab
if menu_p1_cursor_active = 1
if menu_p1_confirm = 1
{
	     #region    If the multiplayer tab was selected	    
	     if menu_highlight = 2   if menu_selected = 0  
	    {
		menu_selected = 1;   
		menu_transition_timer = menu_transition_timer_max;    
		audio_play_sound(sfx_menu_select1,10,false);   
		menu_tab_selected = 2;
		menu_p1_cursor_active = 0;
		}
		#endregion

}

//lower the timer once selected
 if menu_selected = 1    if menu_transition_timer > 0   {menu_transition_timer -= 1;}
//if timer is or lower than 0, start the transisition
 if menu_selected = 1    if menu_transition_timer <= 0
 {
 menu_transition = true;
 menu_selected = 0;  
 menu_transition_timer = menu_transition_timer_max;
 }
 #region scale the first menu and disable the alpha for some of it to hide it
if  menu_transition = true
{
	icon_alpha = 0;
	tab1_alpha = 0;
	tab2_alpha = 0;
	tab3_alpha = 0;
	tab4_alpha = 0;
	tab5_alpha = 0;
	tab6_alpha = 0;
   //transition
if menu_phase1_scale_x < 6 {menu_phase1_scale_x = menu_phase1_scale_x * 1.15;}
if menu_phase1_scale_y < 6 {menu_phase1_scale_y = menu_phase1_scale_y * 1.15;}
if menu_phase1_scale_x > 6 {menu_phase1_scale_x = 6;   menu_phase1_scale_y = 6;   menu_transition = false;}
}
#endregion

#endregion

#endregion

