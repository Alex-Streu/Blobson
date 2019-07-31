///@func Update_Input_Buffer(buffer_index,keyboard,count)
///@param buffer_index
///@param keyboard
///@param count
///Can only be called by players
var b;
b=argument[0];
//Update input buffer
#region Input Buffer Count
if (argument[2])
	{
	//Counts for each input
	for(var i=0;i<(number_of_buttons*2);i++)
		{
		b[| i]=min(++b[| i],max_buffer_length);
		}
	}
#endregion
#region Keyboard
if (argument[1])
	{
	//Buttons
	if keyboard_check_pressed(ord("S")) b[| 0]=0;
	if keyboard_check(ord("S")) b[| 1]=0;
	if keyboard_check_pressed(ord("A")) b[| 2]=0;
	if keyboard_check(ord("A")) b[| 3]=0;
	if keyboard_check_pressed(ord("D")) b[| 4]=0;
	if keyboard_check(ord("D")) b[| 5]=0;
	if keyboard_check_pressed(ord("F")) b[| 6]=0;
	if keyboard_check(ord("F")) b[| 7]=0;
	//Back buttons
	if keyboard_check_pressed(ord("Z")) b[| 8]=0;
	if keyboard_check(ord("Z")) b[| 9]=0;
	if keyboard_check_pressed(ord("X")) b[| 10]=0;
	if keyboard_check(ord("X")) b[| 11]=0;
	if keyboard_check_pressed(ord("C")) b[| 12]=0;
	if keyboard_check(ord("C")) b[| 13]=0;
	if keyboard_check_pressed(ord("V")) b[| 14]=0;
	if keyboard_check(ord("V")) b[| 15]=0;
	//Pausing
	if keyboard_check_pressed(vk_enter) b[| 16]=0;
	if keyboard_check(vk_enter) b[| 17]=0;
	if keyboard_check_pressed(vk_shift) b[| 18]=0;
	if keyboard_check(vk_shift) b[| 19]=0;
	//Dpad
	if keyboard_check_pressed(ord("G")) b[| 20]=0;
	if keyboard_check(ord("G")) b[| 21]=0;
	//Rstick - replicate a "pressed" function
	//Cache Stick Values
	Stick_Cache_Values(Rstick,keyboard_check(ord("L"))-keyboard_check(ord("J")),keyboard_check(ord("K"))-keyboard_check(ord("I")));
	var cxr=control_xprevious_r[stick_check_frames-1];
	var cyr=control_yprevious_r[stick_check_frames-1];
	if ((point_distance(0,0,control_xvalue_r,control_yvalue_r)>rstick_flick_amount) &&
		point_distance(cxr,cyr,control_xvalue_r,control_yvalue_r)>rstick_flick_speed)
		{
		b[| 22]=0;
		}
	if (point_distance(0,0,control_xvalue_r,control_yvalue_r)>rstick_tilt_amount)
		{
		b[| 23]=0;
		}
	//Lstick - same as rstick
	//Cache Stick Values
	Stick_Cache_Values(Lstick,keyboard_check(vk_right)-keyboard_check(vk_left),keyboard_check(vk_down)-keyboard_check(vk_up));
	var cxl=control_xprevious_l[stick_check_frames-1];
	var cyl=control_yprevious_l[stick_check_frames-1];
	if ((point_distance(0,0,control_xvalue_l,control_yvalue_l)>stick_flick_amount) &&
		point_distance(cxl,cyl,control_xvalue_l,control_yvalue_l)>stick_flick_speed)
		{
		b[| 24]=0;
		}
	if (point_distance(0,0,control_xvalue_l,control_yvalue_l)>stick_tilt_amount)
		{
		b[| 25]=0;
		}
	}
#endregion 
#region Controller
else
	{
	//Buttons
	if (gamepad_button_check_pressed(controller,gp_face1)) b[| 0]=0;
	if (gamepad_button_check(controller,gp_face1)) b[| 1]=0;
	if (gamepad_button_check_pressed(controller,gp_face2)) b[| 2]=0;
	if (gamepad_button_check(controller,gp_face2)) b[| 3]=0;
	if (gamepad_button_check_pressed(controller,gp_face3)) b[| 4]=0;
	if (gamepad_button_check(controller,gp_face3)) b[| 5]=0;
	if (gamepad_button_check_pressed(controller,gp_face4)) b[| 6]=0;
	if (gamepad_button_check(controller,gp_face4)) b[| 7]=0;
	//Back buttons
	if (gamepad_button_check_pressed(controller,gp_shoulderl)) b[| 8]=0;
	if (gamepad_button_check(controller,gp_shoulderl)) b[| 9]=0;
	if (gamepad_button_check_pressed(controller,gp_shoulderr)) b[| 10]=0;
	if (gamepad_button_check(controller,gp_shoulderr)) b[| 11]=0;
	if (gamepad_button_check_pressed(controller,gp_shoulderlb)) b[| 12]=0;
	if (gamepad_button_check(controller,gp_shoulderlb)) b[| 13]=0;
	if (gamepad_button_check_pressed(controller,gp_shoulderrb)) b[| 14]=0;
	if (gamepad_button_check(controller,gp_shoulderrb)) b[| 15]=0;
	//Pausing
	if (gamepad_button_check_pressed(controller,gp_start)) b[| 16]=0;
	if (gamepad_button_check(controller,gp_start)) b[| 17]=0;
	if (gamepad_button_check_pressed(controller,gp_select)) b[| 18]=0;
	if (gamepad_button_check(controller,gp_select)) b[| 19]=0;
	//Dpad
	if (gamepad_button_check_pressed(controller,gp_padd)) b[| 20]=0;
	if (gamepad_button_check(controller,gp_padd)) b[| 21]=0;
	
	//Rstick - replicate a "pressed" function
	//Cache Stick Values
	Stick_Cache_Values(Rstick,gamepad_axis_value(controller,gp_axisrh),gamepad_axis_value(controller,gp_axisrv));
	var cxr=control_xprevious_r[stick_check_frames-1];
	var cyr=control_yprevious_r[stick_check_frames-1];
	if ((point_distance(0,0,control_xvalue_r,control_yvalue_r)>rstick_flick_amount) &&
		point_distance(cxr,cyr,control_xvalue_r,control_yvalue_r)>rstick_flick_speed)
		{
		b[| 22]=0;
		}
	if (point_distance(0,0,control_xvalue_r,control_yvalue_r)>rstick_tilt_amount)
		{
		b[| 23]=0;
		}
	
	//Lstick - same as rstick
	//Cache Stick Values
	Stick_Cache_Values(Lstick,gamepad_axis_value(controller,gp_axislh),gamepad_axis_value(controller,gp_axislv));
	var cxl=control_xprevious_l[stick_check_frames-1];
	var cyl=control_yprevious_l[stick_check_frames-1];
	if ((point_distance(0,0,control_xvalue_l,control_yvalue_l)>stick_flick_amount) &&
		point_distance(cxl,cyl,control_xvalue_l,control_yvalue_l)>stick_flick_speed)
		{
		b[| 24]=0;
		}
	if (point_distance(0,0,control_xvalue_l,control_yvalue_l)>stick_tilt_amount)
		{
		b[| 25]=0;
		}
	}
#endregion
//Tech Input
Register_Tech_Input(argument[2]);