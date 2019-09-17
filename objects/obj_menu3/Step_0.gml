/// @description Insert description here

menu_grid_frame += .8;

#region   Controller inputs for menu
menu_confirm = gamepad_button_check_pressed(0,gp_face1) or gamepad_button_check_pressed(1,gp_face1) or gamepad_button_check_pressed(2,gp_face1) or gamepad_button_check_pressed(3,gp_face1)
menu_back = gamepad_button_check_pressed(0,gp_face2) or gamepad_button_check_pressed(1,gp_face2) or gamepad_button_check_pressed(2,gp_face2) or gamepad_button_check_pressed(3,gp_face2)
menu_up = gamepad_button_check_pressed(0,gp_padu)   or   gamepad_button_check_pressed(1,gp_padu) or  gamepad_button_check_pressed(2,gp_padu) or gamepad_button_check_pressed(3,gp_padu)
menu_down = gamepad_button_check_pressed(0,gp_padd)   or   gamepad_button_check_pressed(1,gp_padd) or  gamepad_button_check_pressed(2,gp_padd) or gamepad_button_check_pressed(3,gp_padd)
menu_right = gamepad_button_check_pressed(0,gp_padr)   or   gamepad_button_check_pressed(1,gp_padr) or  gamepad_button_check_pressed(2,gp_padr) or gamepad_button_check_pressed(3,gp_padr)
menu_left= gamepad_button_check_pressed(0,gp_padl)   or   gamepad_button_check_pressed(1,gp_padl) or  gamepad_button_check_pressed(2,gp_padl) or gamepad_button_check_pressed(3,gp_padl)
#endregion

#region background
if menu_bg_number = 1 and menu_bg1_x > menu_bg1_max {menu_bg1_x -= 0.5;}
if menu_bg_number = 1 and menu_bg1_x <= 200 {menu_bg1_alpha -= 0.05;   menu_bg2_alpha = 0;   menu_bg2_x = 1024;   menu_bg_number = 2; }
if menu_bg1_alpha < 0 {menu_bg1_alpha = 0.0;}
if menu_bg_number = 2 and menu_bg2_alpha != 1 {menu_bg2_alpha += 0.05;}
if menu_bg2_alpha > 1 {menu_bg2_alpha = 1;}

if menu_bg_number = 2 and menu_bg2_x > menu_bg2_max {menu_bg2_x -= 0.5;}
if menu_bg_number = 2 and menu_bg2_x <= 200 {menu_bg2_alpha -= 0.05;   menu_bg1_alpha = 0;    menu_bg1_x = 864;   menu_bg_number = 1; }
if menu_bg2_alpha < 0 {menu_bg2_alpha = 0.0;}
if menu_bg_number = 1 and menu_bg1_alpha != 1 {menu_bg1_alpha += 0.05;}
if menu_bg1_alpha > 1 {menu_bg1_alpha = 1;}

if menu_bg_number = 1 and  menu_bg2_alpha != 0  {menu_bg2_alpha -= 0.05;}

#endregion

#region   Check and list the amount of tabs in the particular menu
if menu_tab1 = true and menu_tab2 = false and menu_tab3 = false and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 1;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = false and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 2;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = false and menu_tab5 = false   {number_of_tabs = 3;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = true and menu_tab5 = false   {number_of_tabs = 4;}
if menu_tab1 = true and menu_tab2 = true and menu_tab3 = true and menu_tab4 = true and menu_tab5 = true   {number_of_tabs = 5;}
#endregion

#region   Transiition for the menu
#region   Slide in the Tabs for the start
if menu_selected = 0 and menu_returned = 0
{
menu_tab1_y += (menu_tab1_y_destination - menu_tab1_y) / 6
menu_tab2_y += (menu_tab2_y_destination - menu_tab2_y) / 6
menu_tab3_y += (menu_tab3_y_destination - menu_tab3_y) / 6
menu_tab4_y += (menu_tab4_y_destination - menu_tab4_y) / 6
menu_tab5_y += (menu_tab5_y_destination - menu_tab5_y) / 6
}
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
#region   Font names

menu_tab1_font_x = menu_tab1_x - 170;
menu_tab1_font_y = menu_tab1_y + 12;

menu_tab2_font_x = menu_tab2_x - 170;
menu_tab2_font_y = menu_tab2_y + 12;

menu_tab3_font_x = menu_tab3_x - 170;
menu_tab3_font_y = menu_tab3_y + 12;

menu_tab4_font_x = menu_tab4_x - 170;
menu_tab4_font_y = menu_tab4_y + 12;

menu_tab5_font_x = menu_tab5_x - 170;
menu_tab5_font_y = menu_tab5_y + 12;

if menu_tab1_font_yscale != 1 {menu_tab1_font_yscale += 0.05;}
if menu_tab2_font_yscale != 1 {menu_tab2_font_yscale += 0.05;}
if menu_tab3_font_yscale != 1 {menu_tab3_font_yscale += 0.05;}
if menu_tab4_font_yscale != 1 {menu_tab4_font_yscale += 0.05;}
if menu_tab5_font_yscale != 1 {menu_tab5_font_yscale += 0.05;}
#endregion
#region   Rotate icons - phase 1
if menu_phase = 1
{
#region icon 1 multiplayer
if menu_highlight != 1   {menu_tab1_icon_angle = 0;}
if menu_highlight = 1  if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_angle += (60 - menu_tab1_icon_angle) / 15 }
if menu_highlight = 1  if menu_tab1_icon_dangleright = true   {menu_tab1_icon_angle -= (60 - menu_tab1_icon_angle) / 15 }
if menu_tab1_icon_angle >= 30    if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_dangleright = true;   menu_tab1_icon_dangleleft = false;}
if menu_tab1_icon_angle <= -30   if menu_tab1_icon_dangleright = true   {menu_tab1_icon_dangleright = false;   menu_tab1_icon_dangleleft = true;}
#endregion
#region icon 2 singleplayer
if menu_highlight != 2   {menu_tab2_icon_angle = 0;}
if menu_highlight = 2  if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_angle += (60 - menu_tab2_icon_angle) / 15 }
if menu_highlight = 2  if menu_tab2_icon_dangleright = true   {menu_tab2_icon_angle -= (60 - menu_tab2_icon_angle) / 15 }
if menu_tab2_icon_angle >= 30    if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_dangleright = true;   menu_tab2_icon_dangleleft = false;}
if menu_tab2_icon_angle <= -30   if menu_tab2_icon_dangleright = true   {menu_tab2_icon_dangleright = false;   menu_tab2_icon_dangleleft = true;}
#endregion
#region icon 3 customize
if menu_highlight != 3   {menu_tab3_icon_angle = 0;}
if menu_highlight = 3  if menu_tab3_icon_dangleleft = true      {menu_tab3_icon_angle += (60 - menu_tab3_icon_angle) / 15 }
if menu_highlight = 3  if menu_tab3_icon_dangleright = true   {menu_tab3_icon_angle -= (60 - menu_tab3_icon_angle) / 15 }
if menu_tab3_icon_angle >= 30    if menu_tab3_icon_dangleleft = true      {menu_tab3_icon_dangleright = true;   menu_tab3_icon_dangleleft = false;}
if menu_tab3_icon_angle <= -30   if menu_tab3_icon_dangleright = true   {menu_tab3_icon_dangleright = false;   menu_tab3_icon_dangleleft = true;}
#endregion
#region icon 4 extras
if menu_highlight != 4   {menu_tab4_icon_angle = 0;}
if menu_highlight = 4  if menu_tab4_icon_dangleleft = true      {menu_tab4_icon_angle += (60 - menu_tab4_icon_angle) / 15 }
if menu_highlight = 4  if menu_tab4_icon_dangleright = true   {menu_tab4_icon_angle -= (60 - menu_tab4_icon_angle) / 15 }
if menu_tab4_icon_angle >= 30    if menu_tab4_icon_dangleleft = true      {menu_tab4_icon_dangleright = true;   menu_tab4_icon_dangleleft = false;}
if menu_tab4_icon_angle <= -30   if menu_tab4_icon_dangleright = true   {menu_tab4_icon_dangleright = false;   menu_tab4_icon_dangleleft = true;}
#endregion
#region icon 5 settings
if menu_highlight != 5   {menu_tab5_icon_angle = 0;}
if menu_highlight = 5   {menu_tab5_icon_angle -= 3;}
#endregion
}
#endregion
#region   Rotate icons - phase 2
if menu_phase = 2
{
	   #region icon 1 tag-team
if menu_highlight != 1   {menu_tab1_icon_angle = 0;}
if menu_highlight = 1  if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_angle += (60 - menu_tab1_icon_angle) / 15 }
if menu_highlight = 1  if menu_tab1_icon_dangleright = true   {menu_tab1_icon_angle -= (60 - menu_tab1_icon_angle) / 15 }
if menu_tab1_icon_angle >= 30    if menu_tab1_icon_dangleleft = true      {menu_tab1_icon_dangleright = true;   menu_tab1_icon_dangleleft = false;}
if menu_tab1_icon_angle <= -30   if menu_tab1_icon_dangleright = true   {menu_tab1_icon_dangleright = false;   menu_tab1_icon_dangleleft = true;}
#endregion
	   #region icon 2 1v1
if menu_highlight != 2   {menu_tab2_icon_angle = 0;}
if menu_highlight = 2  if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_angle += (60 - menu_tab2_icon_angle) / 15 }
if menu_highlight = 2  if menu_tab2_icon_dangleright = true   {menu_tab2_icon_angle -= (60 - menu_tab2_icon_angle) / 15 }
if menu_tab2_icon_angle >= 30    if menu_tab2_icon_dangleleft = true      {menu_tab2_icon_dangleright = true;   menu_tab2_icon_dangleleft = false;}
if menu_tab2_icon_angle <= -30   if menu_tab2_icon_dangleright = true   {menu_tab2_icon_dangleright = false;   menu_tab2_icon_dangleleft = true;}
#endregion
       #region icon 3 2v2
if menu_highlight != 3   {menu_tab3_icon_angle = 0;}
if menu_highlight = 3  if menu_tab3_icon_dangleleft = true      {menu_tab3_icon_angle += (60 - menu_tab3_icon_angle) / 15 }
if menu_highlight = 3  if menu_tab3_icon_dangleright = true   {menu_tab3_icon_angle -= (60 - menu_tab3_icon_angle) / 15 }
if menu_tab3_icon_angle >= 30    if menu_tab3_icon_dangleleft = true      {menu_tab3_icon_dangleright = true;   menu_tab3_icon_dangleleft = false;}
if menu_tab3_icon_angle <= -30   if menu_tab3_icon_dangleright = true   {menu_tab3_icon_dangleright = false;   menu_tab3_icon_dangleleft = true;}
#endregion
	   #region icon 4 crew
if menu_highlight != 4   {menu_tab4_icon_angle = 0;}
if menu_highlight = 4  if menu_tab4_icon_dangleleft = true      {menu_tab4_icon_angle += (60 - menu_tab4_icon_angle) / 15 }
if menu_highlight = 4  if menu_tab4_icon_dangleright = true   {menu_tab4_icon_angle -= (60 - menu_tab4_icon_angle) / 15 }
if menu_tab4_icon_angle >= 30    if menu_tab4_icon_dangleleft = true      {menu_tab4_icon_dangleright = true;   menu_tab4_icon_dangleleft = false;}
if menu_tab4_icon_angle <= -30   if menu_tab4_icon_dangleright = true   {menu_tab4_icon_dangleright = false;   menu_tab4_icon_dangleleft = true;}
#endregion
}
#endregion

//Slide in the boxes
menu_boxes_x += (menu_boxes_x_destination - menu_boxes_x) / 4
//Slide in the info
menu_info_y += (menu_info_y_destination - menu_info_y) / 4
menu_info_x += (menu_info_x_destination - menu_info_x) / 4

#endregion
#region   Menu input movement
if menu_selected = 0   if menu_returned = 0
{
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
}
#region   



#endregion

#endregion
#region   make the selected tab glow and change color when selected

#region highlight change color
if menu_highlight = 1   {menu_tab1_color = menu_tab1_color_yes;}   if menu_highlight != 1   {menu_tab1_color = menu_tab1_color_no;}
if menu_highlight = 2   {menu_tab2_color = menu_tab2_color_yes;}   if menu_highlight != 2   {menu_tab2_color = menu_tab2_color_no;}
if menu_highlight = 3   {menu_tab3_color = menu_tab3_color_yes;}   if menu_highlight != 3   {menu_tab3_color = menu_tab3_color_no;}
if menu_highlight = 4   {menu_tab4_color = menu_tab4_color_yes;}   if menu_highlight != 4   {menu_tab4_color = menu_tab4_color_no;}
if menu_highlight = 5   {menu_tab5_color = menu_tab5_color_yes;}   if menu_highlight != 5   {menu_tab5_color = menu_tab5_color_no;}
#endregion
#region highlight change glow
if menu_highlight = 1   {menu_tab1_glow = 1;}   if menu_highlight != 1  {menu_tab1_glow = 0;}
if menu_highlight = 2   {menu_tab2_glow = 1;}   if menu_highlight != 2  {menu_tab2_glow = 0;}
if menu_highlight = 3   {menu_tab3_glow = 1;}   if menu_highlight != 3  {menu_tab3_glow = 0;}
if menu_highlight = 4   {menu_tab4_glow = 1;}   if menu_highlight != 4  {menu_tab4_glow = 0;}
if menu_highlight = 5   {menu_tab5_glow = 1;}   if menu_highlight != 5  {menu_tab5_glow = 0;}
#endregion
#endregion

#region   If back button is pressed
if (menu_back) and menu_returned = 0 and menu_selected = 0 and menu_tab1_y > 47
{
   if menu_phase = 2   
   {
   audio_play_sound(sfx_menu_cancel1,10,false);
   menu_returned = 1;
   menu_selected_timer = menu_selected_set_timer;
   }


}

#endregion
#region   Confirm selected tab
if (menu_confirm) and menu_selected = 0 and menu_tab1_y > 47 and menu_returned = 0
{
	   #region   Confirm multiplayer tab - move on to phase 2 (multiplayer selection)
	   if menu_highlight = 1 and menu_phase = 1
	   {
		   audio_play_sound(sfx_menu_select1,10,false);
		   menu_selected = 1;
		   menu_selected_timer = menu_selected_set_timer;
	   }
	   #endregion
	   #region   Confirm 1vs1 tab - move on to fighter select
	   if menu_highlight = 2 and menu_phase = 2
	   {
		   audio_play_sound(sfx_menu_select1,10,false);
		   menu_selected = 1;
		   menu_selected_timer = menu_selected_set_timer;
		   menu_final_trans = true;
	   }
	   #endregion
	   
}
#endregion

#region   Transistions and timers
//select timer
if menu_selected = 1 and menu_selected_timer > 0     {menu_selected_timer -= 1;}
if menu_selected = 1 and menu_selected_timer <= 0   {menu_selected_timer = 0;   menu_selected = 2;}
//return timer
if menu_returned = 1 and menu_selected_timer > 0     {menu_selected_timer -= 1;}
if menu_returned = 1 and menu_selected_timer <= 0   {menu_selected_timer = 0;   menu_returned = 2;}

    #region   selected
    if menu_selected = 2 and menu_returned = 0
   {
   menu_tab1_y += (menu_tab1_y_spawn - menu_tab1_y) / 6
   menu_tab2_y += (menu_tab2_y_spawn - menu_tab2_y) / 6
   menu_tab3_y += (menu_tab3_y_spawn - menu_tab3_y) / 6
   menu_tab4_y += (menu_tab4_y_spawn - menu_tab4_y) / 6
   menu_tab5_y += (menu_tab5_y_spawn - menu_tab5_y) / 6

     if menu_tab1_y < -110   
    {
	menu_selected = 0;   
	menu_highlight = 1;
	
	      if menu_highlight = 1 and menu_phase = 1 and menu_final_trans = false
	      {
		   menu_phase = 2;
		   menu_tab1 = true;
		   menu_tab2 = true;
	       menu_tab3 = true;
		   menu_tab4 = true;
		   menu_tab5 = false;
		   number_of_tabs = 4;
	      }	
	
		  
		  
	   }
   }	
	#endregion
	#region   select final tab
			  
		  if menu_selected_timer = 0 and menu_highlight = 2 and menu_phase = 2 and menu_final_trans = true
	      {
			menu_phase = 10;
	      }
		  
		 if menu_phase = 10
		 {
			//menu_boxes_x_scale += .05;
			menu_boxes_x_scale *= 1.1
			menu_boxes_y_scale *= 1.1
			if menu_boxes_blackness < 1 {menu_boxes_blackness += .0625}
			if menu_boxes_blackness >= 1   if menu_phase = 10 {menu_phase = 11   alarm_set(0,15);}
            //menu_boxes_y_scale += .05;
		 }
		 
	#endregion
	#region   return to phase 1
    if menu_returned = 2 and menu_selected = 0
   {
   menu_tab1_y += (menu_tab1_y_spawn - menu_tab1_y) / 6
   menu_tab2_y += (menu_tab2_y_spawn - menu_tab2_y) / 6
   menu_tab3_y += (menu_tab3_y_spawn - menu_tab3_y) / 6
   menu_tab4_y += (menu_tab4_y_spawn - menu_tab4_y) / 6
   menu_tab5_y += (menu_tab5_y_spawn - menu_tab5_y) / 6
   
   menu_phase = 1;
   menu_tab1 = true;
   menu_tab2 = true;
   menu_tab3 = true;
   menu_tab4 = true;
   menu_tab5 = true;
   number_of_tabs = 5;

        if menu_tab1_y < -110   
        {
	    menu_returned = 0;   
	    menu_highlight = 1;
	    }
		
   }
	#endregion
	#endregion