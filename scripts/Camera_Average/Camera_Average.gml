//Average of Player positions
//Reset the goal position
cam_x_goal=0;
cam_y_goal=0;
var _num_of_active_players=0;

//Camera zoom effect
if (camera_enable_zoom)
	{
	cam_w = lerp(cam_w, cam_w_goal, 0.5);
	cam_h = lerp(cam_h, cam_h_goal, 0.5);
	camera_set_view_size(cam, round(cam_w), round(cam_h));
	}

//Add up the individual player positions
with(obj_player)
	{
	if (state!=PLAYER_STATE.knocked_out && state!=PLAYER_STATE.lost)
		{
		other.cam_x_goal+=x;
		other.cam_y_goal+=y;
		//Increase the number of active players so that the camera doesn't focus on KO'ed players
		_num_of_active_players+=1;
		}
	}
	
//Divide by the number of active players to get average
if (_num_of_active_players!=0)
	{
	cam_x_goal/=_num_of_active_players;
	cam_y_goal/=_num_of_active_players;
	}
else
	{
	//Center camera if all players are KO'ed
	cam_x_goal=room_width div 2;
	cam_y_goal=room_height div 2;
	}
	
//Subtract half of the dimensions to center
cam_x_goal-=(cam_w div 2);
cam_y_goal-=(cam_h div 2);

//Clamp so the camera doesn't go off the blastzones
cam_x_goal=clamp(cam_x_goal,camera_boundary,room_width-cam_w-camera_boundary);
cam_y_goal=clamp(cam_y_goal,camera_boundary,room_height-cam_h-camera_boundary);

//Camera zoom effect
if (camera_enable_zoom)
	{
	if (obj_background_manager.background_clear_amount > 0)
		{
		cam_w_goal = camera_zoom_width;
		cam_h_goal = camera_zoom_height;
		cam_x = cam_x_goal;
		cam_y = cam_y_goal;
		cam_shake_h=0;
		cam_shake_v=0;
		}
	else
		{
		cam_w_goal = camera_width;
		cam_h_goal = camera_height;
		}
	}