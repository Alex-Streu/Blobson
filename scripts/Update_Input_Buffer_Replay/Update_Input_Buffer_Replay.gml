///@func Update_Input_Buffer_Replay(buffer_index,count)
///@param buffer_index
///@param count
///Can only be called by players
var _buffer, _cc, _count;
_buffer = argument[0];
_cc = cc;
_count = argument[1];
//Update input buffer
#region Input Buffer Count
if (_count)
	{
	//Counts for each input
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		_buffer[| i] = min(++_buffer[| i], max_buffer_length);
		}
	}
#endregion
#region Check the replay data
//Get the buffer
var _load = global.game_replay[| player_number];

//Make sure that there was any input at all during the frame
var _any_input = buffer_read(_load, buffer_bool);
#endregion
#region Update
//Loop through the inputs
if (_any_input)
	{
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		if (buffer_read(_load, buffer_bool) == true)
			{
			_buffer[| i] = 0;
			}
		}
	}

//Control stick
var _lx = buffer_read(_load, buffer_s8) * 0.01,
	_ly = buffer_read(_load, buffer_s8) * 0.01,
	_rx = buffer_read(_load, buffer_s8) * 0.01,
	_ry = buffer_read(_load, buffer_s8) * 0.01;
	
Stick_Cache_Values(Rstick, _rx, _ry, _count);
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
Stick_Cache_Values(Lstick, _lx, _ly, _count);
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
#endregion
#region Debug
//X and Y
/*
var _x = buffer_read(_load, buffer_s16);
var _y = buffer_read(_load, buffer_s16);
var _s = buffer_read(_load, buffer_u8);
var _t = buffer_read(_load, buffer_u8);
if (x != _x || y != _y || state != _s || tech_buffer != _t)
	{
	show_message(to_string
		(
		"A desync has occured. Frame: ", obj_game.current_frame, 
		". State: ", Get_Player_State_Name(state), ", should be ", Get_Player_State_Name(_s), 
		". Player number: ", player_number, 
		". X: ", x, " Y: ", y, ", should be ", _x, ", ", _y,
		". TECH: ", tech_buffer, ", should be ", _t, "."
		));
	}
//*/
#endregion