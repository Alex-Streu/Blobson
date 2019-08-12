//Average of Player positions
//Reset the goal position
cam_x_goal = 0;
cam_y_goal = 0;
var _num_of_active_players = 0;
var _set = true;
var _player_max_x = 0, _player_min_x = 0, _player_max_y = 0, _player_min_y = 0;

//Get player positions
with(obj_player)
	{
	if (state != PLAYER_STATE.knocked_out && state != PLAYER_STATE.lost)
		{
		other.cam_x_goal += x;
		other.cam_y_goal += y;
		
		//Increase the number of active players so that the camera doesn't focus on KO'ed players
		_num_of_active_players += 1;
		
		//Get min and max
		if (_set)
			{
			_player_max_x = x;
			_player_min_x = x;
			_player_max_y = y;
			_player_min_y = y;
			_set = false;
			}
		else
			{
			_player_max_x = max(_player_max_x, x);
			_player_min_x = min(_player_min_x, x);
			_player_max_y = max(_player_max_y, y);
			_player_min_y = min(_player_min_y, y);
			}
		}
	}
	
//Divide by the number of active players to get average
if (_num_of_active_players != 0)
	{
	cam_x_goal /= _num_of_active_players;
	cam_y_goal /= _num_of_active_players;
	}
else
	{
	//Center camera if all players are KO'ed
	cam_x_goal = room_width div 2;
	cam_y_goal = room_height div 2;
	}

//Calculate camera zoom
if (camera_enable_zoom)
	{
	_player_max_x += _player_min_x * camera_zoom_pad_xscale;
	_player_min_x += _player_min_x *-camera_zoom_pad_xscale;
	_player_max_y += _player_min_y * camera_zoom_pad_yscale;
	_player_min_y += _player_min_y *-camera_zoom_pad_yscale;
	//Calculate longest width
	var _lwidth = _player_max_x - _player_min_x;
	
	//Calculate longest height and corresponding width
	var _lheight = _player_max_y - _player_min_y;
	var _cwidth = _lheight * camera_ratio;
	
	//Get the largest one and use it as the height / width
	var _final_width = max(_lwidth, _cwidth);
	var _final_height = _final_width / camera_ratio;
	
	//Set the camera width and height
	cam_w_goal = clamp(_final_width * camera_zoom_pad_scale, camera_min_width, room_width);
	cam_h_goal = clamp(_final_height * camera_zoom_pad_scale, camera_min_height, room_width / camera_ratio);
	}

//Camera special zoom effect
if (camera_enable_special_zoom)
	{
	if (obj_background_manager.background_clear_amount > 0)
		{
		cam_w_goal = camera_special_zoom_width;
		cam_h_goal = camera_special_zoom_height;
		cam_x = cam_x_goal;
		cam_y = cam_y_goal;
		cam_shake_h = 0;
		cam_shake_v = 0;
		}
	else
		{
		cam_w_goal = camera_width;
		cam_h_goal = camera_height;
		}
	}	

//Camera zooming
if (camera_enable_zoom || camera_enable_special_zoom)
	{
	cam_w = lerp(cam_w, cam_w_goal, camera_zoom_speed);
	cam_h = lerp(cam_h, cam_h_goal, camera_zoom_speed);
	camera_set_view_size(cam, round(cam_w), round(cam_h));
	}

//Subtract half of the dimensions to center
cam_x_goal -= (cam_w div 2);
cam_y_goal -= (cam_h div 2);
	
//Clamp so the camera doesn't go off the blastzones
cam_x_goal = clamp(cam_x_goal, camera_boundary, room_width - cam_w - camera_boundary);
cam_y_goal = clamp(cam_y_goal, camera_boundary, room_height - cam_h - camera_boundary);
	
//Slowly move camera to position inside the room
cam_x = clamp(round(lerp(cam_x, cam_x_goal, camera_move_speed)), 0, room_width - cam_w);
cam_y = clamp(round(lerp(cam_y, cam_y_goal, camera_move_speed)), 0, room_height - cam_h);

//Apply Camera Shake
cam_x += choose(-cam_shake_h, cam_shake_h);
cam_y += choose(-cam_shake_v, cam_shake_v);

//Gradually lower the camera shake amount
cam_shake_h = approach(cam_shake_h, 0, 1);
cam_shake_v = approach(cam_shake_v, 0, 1);

//Set the camera position
camera_set_view_pos(cam, cam_x, cam_y);