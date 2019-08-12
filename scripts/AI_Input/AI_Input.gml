///@func AI_Input(count)
///@param count
//Fakes inputs for the AI to move around and do things	
if (!is_AI) return false;

var _mytype = AI_TYPE.idle;

#region Input Buffer Count
if (argument[0])
	{
	//Counts for each input
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		input_buffer[| i] = min(++input_buffer[| i], max_buffer_length);
		}
	}
#endregion
#region Inputs
switch(_mytype)
	{
	case AI_TYPE.idle:
		#region IDLE
		Stick_Cache_Values(Lstick, 0, 0, argument[0]);
		Stick_Cache_Values(Rstick, 0, 0, argument[0]);
		var _sxl = 0, _syl = 0, _sxr = 0, _syr = 0;
		if (state == PLAYER_STATE.in_hitlag)
			{
			_sxl = 0;
			_syl = 0;
			}
		else if (state == PLAYER_STATE.in_hitstun)
			{
			input_buffer[| INPUT.shield] = 0;
			_syl = -1;
			}
		else
			{
			if (!on_ground())
				{
				if (x < room_width / 2)
					{
					_sxl = 1;
					}
				else
				if (x > room_width / 2)
					{
					_sxl = -1;
					}
				if (vsp > -1)
					{
					if (double_jumps > 0)
						{
						input_buffer[| INPUT.jump] = 0;
						}
					else if (y > obj_solid.bbox_top)
						{
						//Up B
						input_buffer[| INPUT.special] = 0;
						_sxl = sign(room_width / 2 - x);
						_syl = -1;
						}
					}
				}
			else
				{
				_sxl = 0;
				_syl = 0;
				}
			}
		Stick_Cache_Values(Lstick, _sxl, _syl, false);
		var _dist = stick_get_distance(Lstick);
		if (_dist > stick_flick_amount &&
			stick_get_speed(Lstick) > stick_flick_speed)
			{
			control_flicked_l = 0;
			}
		if (_dist > stick_tilt_amount)
			{
			control_tilted_l = 0;
			}
		Stick_Cache_Values(Rstick, _sxr, _syr, false);
		var _dist = stick_get_distance(Rstick);
		if (_dist > rstick_flick_amount &&
			stick_get_speed(Rstick) > rstick_flick_speed)
			{
			control_flicked_r = 0;
			}
		if (_dist > rstick_tilt_amount)
			{
			control_tilted_r = 0;
			}
		break;
		#endregion
	}
#endregion