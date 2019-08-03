/// @description UPDATE

var xx,yy;
var RT,LT;
for(var i = 0; i < max_players; i++)
	{
	//Navigate the menu
	var _controller = global.device_number[i];
	if (_controller != -1)
		{
		xx=gamepad_axis_value(_controller,gp_axislh);
		yy=gamepad_axis_value(_controller,gp_axislv);
		RT=gamepad_button_check_pressed(_controller, gp_shoulderrb)
		LT=gamepad_button_check_pressed(_controller, gp_shoulderlb)
		//Changes custom controls based on stick values
		if (abs(yy)>stick_tilt_amount)
			{
			if (!yPress[i])
				{
				yPress[i]=true;
				cursor[i]+=sign(yy);
				cursor[i]=clamp(cursor[i],0,array_height_2d(button_array)-1);
				}
			}
		else
			{
			yPress[i]=false;
			}
		if (abs(xx)>stick_flick_amount)
			{
			if (!xPress[i])
				{
				xPress[i]=true;
				button_array[@ cursor[i],i+1]+=sign(xx);
				button_array[@ cursor[i],i+1]=clamp(button_array[@ cursor[i],i+1],-1,8);
				}
			}
		else
			{
			xPress[i]=false;
			}
		//If Select is pressed, reset controls
		if (gamepad_button_check_pressed(_controller,gp_select))
			{
			//Reset
			Custom_Controls_Reset(button_array,i);
			}
		//Start the game on training stage
		if (gamepad_button_check_pressed(_controller,gp_start) || keyboard_check_pressed(vk_anykey))
			{
			//Save things
			Custom_Controls_Save(button_array);
			room_goto(rm_Training);
			break;
			}		
			//Start the game on arena stage
		if (gamepad_button_check_pressed(_controller,gp_face1) || keyboard_check_pressed(vk_anykey))
			{
			//Save things
			Custom_Controls_Save(button_array);
			room_goto(rm_Rivals);
			break;
			}	
		}
	}
	
#region Voronoi
/*	
for(var i=0;i<length;i++)
	{
	point_x[@i] += point_hsp[i];
	point_y[@i] += point_vsp[i];
	if (point_x[i] > room_width && point_hsp[i] > 0 ||
		point_x[i] < 0 && point_hsp[i] < 0)
		{
		point_hsp[@i] *= -1;
		}
	if (point_y[i] > room_height && point_vsp[i] > 0 ||
		point_y[i] < 0 && point_vsp[i] < 0)
		{
		point_vsp[@i] *= -1;
		}
	}
*/
#endregion

//debug
if keyboard_check_pressed(vk_anykey) {global.device_number[0] = 0; Custom_Controls_Save(button_array);room_goto_next();}

// PALETTE CODE
current_pal=wrap(current_pal,0,pal_swap_get_pal_count(my_portrait_pal_sprite)-1);

if(keyboard_check_pressed(vk_up))
    current_pal++;
if(keyboard_check_pressed(vk_down))
    current_pal--;