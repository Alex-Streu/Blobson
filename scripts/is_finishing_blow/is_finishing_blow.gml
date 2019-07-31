///@func is_finishing_blow(full_knockback,target_x,target_y,angle,hitstun_frames,target_id)
///@param full_knockback
///@param target_x
///@param target_y
///@param angle
///@param hitstun_frames
///@param target_id
///@desc Tries to calculate if the attack is a guaranteed finisher
///It checks 3 DI angles and walls (possible teching)
var _kb,_tx,_ty,_angle,_stun,_t;
_kb = argument0;
_tx = argument1;
_ty = argument2;
_angle = argument3;
_stun = argument4;
_t = argument5;
var _hsp,_vsp;
var _ko_count = 0;
for(var t = 0; t < 3; t++)
	{
	//Change the angles to be checked
	if (t == 1)
		_angle += DI_Max;
	if (t == 2)
		_angle -= DI_Max * 2;
	_hsp = lengthdir_x(_kb, _angle);
	_vsp = lengthdir_y(_kb, _angle);
	_tx = argument1;
	_ty = argument2;
	//Checks until the hitstun would be over (since you can airdodge to cancel movement)
	for(var i = 0; i < _stun; i++)
		{
		//"Gravity and Friction"
		_hsp = approach(_hsp, 0, _t.air_friction);
		if (_vsp < _t.max_fall_speed)
			_vsp = min(_vsp + _t.hitstun_grav, _t.max_fall_speed);
		//"Movement"
		_tx += _hsp;
		_ty += _vsp;
		//Collisions with blocks
		if (collision_point(_tx, _ty, obj_solid, false, true))
			{
			return false;
			}
		//Out of room check
		if (_tx < 0 || _ty < 0 || _tx > room_width || _ty > room_height)
			{
			_ko_count++;
			break;
			}
		}
	}
if (_ko_count == 3)
	return true;
return false;