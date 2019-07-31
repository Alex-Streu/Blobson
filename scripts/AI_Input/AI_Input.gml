///AI_Input
//Fakes inputs for the AI to move around and stuff
enum ai_type
	{
	idle,
	attack,
	rush,
	jump,
	shield,
	}
	
if (!is_AI) return false;

var _mytype=ai_type.idle;

switch(_mytype)
	{
	case ai_type.idle:
	#region IDLE
	if (state == PLAYER_STATE.in_hitlag)
		{
		control_direction_l=irandom(360);
		control_xvalue_l=choose(-1,0,1);
		control_yvalue_l=choose(-1,0,1);
		}
	else
		{
		if (!on_ground())
			{
			if (x<room_width/2)
				{
				input_buffer[|25]=0;
				control_xvalue_l=1;
				control_direction_l=0;
				}
			else
			if (x>room_width/2)
				{
				input_buffer[|25]=0;
				control_xvalue_l=-1;
				control_direction_l=180;
				}
			if (vsp>-1)
				{
				if (double_jumps>0)
					{
					input_buffer[|4]=tap;
					}
				else if (y > obj_solid.bbox_top)
					{
					//Up B
					input_buffer[|0]=tap;
					input_buffer[|25]=0;
					control_yvalue_l=-1;
					control_xvalue_l=sign(room_width/2-x);
					control_direction_l=x>room_width/2 ? 135 : 45;
					}
				}
			}
		else
			{
			input_buffer[|25]=buff;
			input_buffer[|4]=buff;
			input_buffer[|0]=buff;
			}
		}
	break;
	#endregion
	case ai_type.rush:
	#region RUSH
	if (state == PLAYER_STATE.in_hitlag)
		{
		control_direction_l=90;
		}
	else
		{
		if (!on_ground())
			{
			if (x<room_width/2)
				{
				input_buffer[|25]=0;
				control_xvalue_l=1;
				control_direction_l=0;
				}
			else
			if (x>room_width/2)
				{
				input_buffer[|25]=0;
				control_xvalue_l=-1;
				control_direction_l=180;
				}
			if (vsp>-1)
				{
				if (double_jumps>0)
					{
					input_buffer[|4]=tap;
					}
				else if (y > obj_solid.bbox_top)
					{
					//Up B
					input_buffer[|0]=tap;
					input_buffer[|25]=0;
					control_yvalue_l=-1;
					control_xvalue_l=sign(room_width/2-x);
					control_direction_l=x>room_width/2 ? 135 : 45;
					}
				}
			}
		else
			{
			if (x<obj_player.x)
				{
				if (irandom(15)==0)
					input_buffer[|irandom(25)] = tap;
				input_buffer[|24]=tap;
				input_buffer[|25]=tap;
				control_xvalue_l=1;
				control_direction_l=0;
				}
			else
			if (x>obj_player.x)
				{
				if (irandom(15)==0)
					input_buffer[|irandom(25)] = tap;
				input_buffer[|24]=tap;
				input_buffer[|25]=tap;
				control_xvalue_l=-1;
				control_direction_l=180;
				}
			}
		}
	break;
	#endregion
	}