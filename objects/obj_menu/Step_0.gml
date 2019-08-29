/// @description Insert description here
// You can write your code in this editor

//If solo tab is highlighted

#region Change solo tab color/alpha
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
#region Change multiplayer tab color/alpha
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



if gamepad_button_check_pressed(0,gp_padl)   {menu_highlight = 1;      audio_play_sound(sfx_menu_highlight1,10,false);}
if gamepad_button_check_pressed(0,gp_padr)   {menu_highlight = 2;      audio_play_sound(sfx_menu_highlight1,10,false);}