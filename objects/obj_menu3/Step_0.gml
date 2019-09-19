/// @description Insert description here
// You can write your code in this editor

#region   Controller inputs for menu
menu_confirm = gamepad_button_check_pressed(0,gp_face1) or gamepad_button_check_pressed(1,gp_face1) or gamepad_button_check_pressed(2,gp_face1) or gamepad_button_check_pressed(3,gp_face1)
menu_back = gamepad_button_check_pressed(0,gp_face2) or gamepad_button_check_pressed(1,gp_face2) or gamepad_button_check_pressed(2,gp_face2) or gamepad_button_check_pressed(3,gp_face2)
menu_up = gamepad_button_check_pressed(0,gp_padu)   or   gamepad_button_check_pressed(1,gp_padu) or  gamepad_button_check_pressed(2,gp_padu) or gamepad_button_check_pressed(3,gp_padu)
menu_down = gamepad_button_check_pressed(0,gp_padd)   or   gamepad_button_check_pressed(1,gp_padd) or  gamepad_button_check_pressed(2,gp_padd) or gamepad_button_check_pressed(3,gp_padd)
menu_right = gamepad_button_check_pressed(0,gp_padr)   or   gamepad_button_check_pressed(1,gp_padr) or  gamepad_button_check_pressed(2,gp_padr) or gamepad_button_check_pressed(3,gp_padr)
menu_left= gamepad_button_check_pressed(0,gp_padl)   or   gamepad_button_check_pressed(1,gp_padl) or  gamepad_button_check_pressed(2,gp_padl) or gamepad_button_check_pressed(3,gp_padl)
#endregion

menu_mainbox_x += (menu_mainbox_goal_x - menu_mainbox_x) / 6;
menu_mainbox_ads1_x = menu_mainbox_x + 214;
menu_mainbox_ads2_x = menu_mainbox_x + 214;

#region   Highlighting different tabs on the menu

   #region   Phase 1
   
   #region   Menu Right
   if (menu_right)   and   menu_phase = 1   and tab_highlight != 6
   {
   tab_highlight += 1;   
   audio_play_sound(sfx_menu_highlight1,10,false);
   }
   #endregion
   #region   Menu Left
   if (menu_left)   and   menu_phase = 1
   {
      if (menu_left)   and   menu_phase = 1   and tab_highlight != 1
      {
      tab_highlight -= 1;   
	  audio_play_sound(sfx_menu_highlight1,10,false);
      }
   }
   #endregion
   #region   Menu Down
   if (menu_down)   and   menu_phase = 1
   {
      if tab_highlight = 1 {tab_highlight = 4;   audio_play_sound(sfx_menu_highlight1,10,false);}
	  if tab_highlight = 2 {tab_highlight = 5;   audio_play_sound(sfx_menu_highlight1,10,false);}
	  if tab_highlight = 3 {tab_highlight = 6;   audio_play_sound(sfx_menu_highlight1,10,false);}
   }
   #endregion
   #region   Menu Up
   if (menu_up)   and   menu_phase = 1
   {
      if tab_highlight = 4 {tab_highlight = 1;   audio_play_sound(sfx_menu_highlight1,10,false);}
	  if tab_highlight = 5 {tab_highlight = 2;   audio_play_sound(sfx_menu_highlight1,10,false);}
	  if tab_highlight = 6 {tab_highlight = 3;   audio_play_sound(sfx_menu_highlight1,10,false);}	  
   }
   #endregion
   
   #endregion

if menu_bg_grid_frame != 40 {menu_bg_grid_frame += 1;}
if menu_bg_grid_frame >= 40 {menu_bg_grid_frame = 0;}

#endregion

#region   Tab 1
menu_tab1_y += (menu_tab1_y_goal - menu_tab1_y) / 6;
menu_tab1_font_x =menu_tab1_x + menu_tab1_font_x_offset;
menu_tab1_font_y = menu_tab1_y + menu_tab1_font_y_offset;
menu_tab1_icon_x =menu_tab1_x + menu_tab1_icon_x_offset;
menu_tab1_icon_y = menu_tab1_y + menu_tab1_icon_y_offset;
#endregion
#region   Tab 2
menu_tab2_y += (menu_tab2_y_goal - menu_tab2_y) / 6;
menu_tab2_font_x = menu_tab2_x + menu_tab2_font_x_offset;
menu_tab2_font_y = menu_tab2_y + menu_tab2_font_y_offset;
menu_tab2_icon_x =menu_tab2_x + menu_tab2_icon_x_offset;
menu_tab2_icon_y = menu_tab2_y + menu_tab2_icon_y_offset;
#endregion
#region   Tab 3
menu_tab3_y += (menu_tab3_y_goal - menu_tab3_y) / 6;
menu_tab3_font_x = menu_tab3_x + menu_tab3_font_x_offset;
menu_tab3_font_y = menu_tab3_y + menu_tab3_font_y_offset;
menu_tab3_icon_x =menu_tab3_x + menu_tab3_icon_x_offset;
menu_tab3_icon_y = menu_tab3_y + menu_tab3_icon_y_offset;
#endregion
#region   Tab 4
menu_tab1_y += (menu_tab1_y_goal - menu_tab1_y) / 6;
menu_tab1_font_x =menu_tab1_x + menu_tab1_font_x_offset;
menu_tab1_font_y = menu_tab1_y + menu_tab1_font_y_offset;
menu_tab1_icon_x =menu_tab1_x + menu_tab1_icon_x_offset;
menu_tab1_icon_y = menu_tab1_y + menu_tab1_icon_y_offset;
#endregion
#region   Tab 5
menu_tab5_y += (menu_tab5_y_goal - menu_tab5_y) / 6;
menu_tab5_font_x = menu_tab5_x + menu_tab5_font_x_offset;
menu_tab5_font_y = menu_tab5_y + menu_tab5_font_y_offset;
menu_tab5_icon_x =menu_tab5_x + menu_tab5_icon_x_offset;
menu_tab5_icon_y = menu_tab5_y + menu_tab5_icon_y_offset;
#endregion

if menu_tab_grid_frame < 11 {menu_tab_grid_frame += 1;}
else {menu_tab_grid_frame = 2;}

#region icon 1 Singleplayer
if tab_highlight != 1   {menu_tab1_icon_angle = 0;}
if tab_highlight = 1  if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_angle += (60 - menu_tab1_icon_angle) / 15 }
if tab_highlight = 1  if menu_tab1_icon_dangleright = true   {menu_tab1_icon_angle -= (60 - menu_tab1_icon_angle) / 15 }
if menu_tab1_icon_angle >= 30    if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_dangleright = true;   menu_tab1_icon_dangleleft = false;}
if menu_tab1_icon_angle <= -30   if menu_tab1_icon_dangleright = true   {menu_tab1_icon_dangleright = false;   menu_tab1_icon_dangleleft = true;}
#endregion
#region icon 2 Multiplayer
if tab_highlight != 2   {menu_tab2_icon_angle = 0;}
if tab_highlight = 2  if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_angle += (60 - menu_tab2_icon_angle) / 15 }
if tab_highlight = 2  if menu_tab2_icon_dangleright = true   {menu_tab2_icon_angle -= (60 - menu_tab2_icon_angle) / 15 }
if menu_tab2_icon_angle >= 30    if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_dangleright = true;   menu_tab2_icon_dangleleft = false;}
if menu_tab2_icon_angle <= -30   if menu_tab2_icon_dangleright = true   {menu_tab2_icon_dangleright = false;   menu_tab2_icon_dangleleft = true;}
#endregion