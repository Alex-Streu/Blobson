/// @description Insert description here


#region   Controller inputs for menu
menu_confirm = gamepad_button_check_pressed(0,gp_face1) or gamepad_button_check_pressed(1,gp_face1) or gamepad_button_check_pressed(2,gp_face1) or gamepad_button_check_pressed(3,gp_face1)
menu_up = gamepad_button_check_pressed(0,gp_padu)   or   gamepad_button_check_pressed(1,gp_padu) or  gamepad_button_check_pressed(2,gp_padu) or gamepad_button_check_pressed(3,gp_padu)
menu_down = gamepad_button_check_pressed(0,gp_padd)   or   gamepad_button_check_pressed(1,gp_padd) or  gamepad_button_check_pressed(2,gp_padd) or gamepad_button_check_pressed(3,gp_padd)
menu_right = gamepad_button_check_pressed(0,gp_padr)   or   gamepad_button_check_pressed(1,gp_padr) or  gamepad_button_check_pressed(2,gp_padr) or gamepad_button_check_pressed(3,gp_padr)
menu_left= gamepad_button_check_pressed(0,gp_padl)   or   gamepad_button_check_pressed(1,gp_padl) or  gamepad_button_check_pressed(2,gp_padl) or gamepad_button_check_pressed(3,gp_padl)
#endregion

#region   Check and list the amount of tabs in the particular menu
if menu_tab1 = true and menu_tab2 = false and menu_tab3 = false and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 1;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = false and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 2;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 3;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = true and menu_tab5 = false   {number_of_tabs = 4;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = true and menu_tab5 = true   {number_of_tabs = 5;}
#endregion

#region   Transiition for the menu
#region   Slide in the Tabs
menu_tab1_y += (menu_tab1_y_destination - menu_tab1_y) / 6
menu_tab2_y += (menu_tab2_y_destination - menu_tab2_y) / 6
menu_tab3_y += (menu_tab3_y_destination - menu_tab3_y) / 6
menu_tab4_y += (menu_tab4_y_destination - menu_tab4_y) / 6
menu_tab5_y += (menu_tab5_y_destination - menu_tab5_y) / 6
#endregion
#region   Slideouts (nameplates for the menus)
menu_tab1_slideout_x = menu_tab1_x;
menu_tab1_slideout_y = menu_tab1_y + menu_tab1_slideout_y_offset;
menu_tab2_slideout_x = menu_tab2_x;
menu_tab2_slideout_y = menu_tab2_y + menu_tab2_slideout_y_offset;
menu_tab3_slideout_x = menu_tab3_x;
menu_tab3_slideout_y = menu_tab3_y + menu_tab3_slideout_y_offset;
menu_tab4_slideout_x = menu_tab4_x;
menu_tab4_slideout_y = menu_tab4_y + menu_tab4_slideout_y_offset;
menu_tab5_slideout_x = menu_tab5_x;
menu_tab5_slideout_y = menu_tab5_y + menu_tab5_slideout_y_offset;
if menu_tab1_slideout_xscale < 1   {menu_tab1_slideout_xscale += 0.05}
if menu_tab2_slideout_xscale < 1   {menu_tab2_slideout_xscale += 0.05}
if menu_tab3_slideout_xscale < 1   {menu_tab3_slideout_xscale += 0.05}
if menu_tab4_slideout_xscale < 1   {menu_tab4_slideout_xscale += 0.05}
if menu_tab5_slideout_xscale < 1   {menu_tab5_slideout_xscale += 0.05}
#endregion

menu_tab1_font_x = menu_tab1_x - 260;
menu_tab1_font_y = menu_tab1_y - 6;

menu_tab2_font_x = menu_tab2_x - 260;
menu_tab2_font_y = menu_tab2_y - 6;

if menu_tab1_font_yscale != 1 {menu_tab1_font_yscale += 0.05;}
if menu_tab2_font_yscale != 1 {menu_tab2_font_yscale += 0.05;}
if menu_tab1_font_yscale != 1 {menu_tab1_font_yscale += 0.05;}
if menu_tab1_font_yscale != 1 {menu_tab1_font_yscale += 0.05;}

#region rotate icons

#region icon 1 multiplayer
if menu_highlight != 1   {menu_tab1_icon_angle = 0;}
if menu_highlight = 1  if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_angle += (60 - menu_tab1_icon_angle) / 15 }
if menu_highlight = 1  if menu_tab1_icon_dangleright = true   {menu_tab1_icon_angle -= (60 - menu_tab1_icon_angle) / 15 }
if menu_tab1_icon_angle >= 30    if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_dangleright = true;   menu_tab1_icon_dangleleft = false;}
if menu_tab1_icon_angle <= -30   if menu_tab1_icon_dangleright = true   {menu_tab1_icon_dangleright = false;   menu_tab1_icon_dangleleft = true;}
#endregion

#endregion

//Slide in the boxes
menu_boxes_x += (menu_boxes_x_destination - menu_boxes_x) / 4
//Slide in the info
menu_info_y += (menu_info_y_destination - menu_info_y) / 4

#endregion
#region   Menu input movement

//Moving down
   if (menu_down)
   {
	 audio_play_sound(sfx_menu_highlight1,10,false);
	 if menu_highlight < number_of_tabs   {menu_highlight += 1;}
	 else   {menu_highlight = 1;}
   }
   //Moving up
   if (menu_up)
   {
	 audio_play_sound(sfx_menu_highlight1,10,false);
	 if menu_highlight > 1   {menu_highlight -= 1;}
	 else   {menu_highlight = number_of_tabs;}
   }

#region   



#endregion

#endregion
#region   make the selected tab glow and change color when selected

#region highlight change color
if menu_highlight = 1   {menu_tab1_color = menu_tab1_color_yes;}   if menu_highlight != 1   {menu_tab1_color = menu_tab1_color_no;}
if menu_highlight = 2   {menu_tab2_color = menu_tab2_color_yes;}   if menu_highlight != 2   {menu_tab2_color = menu_tab2_color_no;}
#endregion
#region highlight change glow
if menu_highlight = 1   {menu_tab1_glow = 1;}   if menu_highlight != 1  {menu_tab1_glow = 0;}
if menu_highlight = 2   {menu_tab2_glow = 1;}   if menu_highlight != 2  {menu_tab2_glow = 0;}
if menu_highlight = 3   {menu_tab3_glow = 1;}   if menu_highlight != 3  {menu_tab3_glow = 0;}
if menu_highlight = 4   {menu_tab4_glow = 1;}   if menu_highlight != 4  {menu_tab4_glow = 0;}
if menu_highlight = 5   {menu_tab5_glow = 1;}   if menu_highlight != 5  {menu_tab5_glow = 0;}
#endregion
#endregion

//Slide back
////menu_boxes_x += (menu_boxes_x_spawn - menu_boxes_x) / 4