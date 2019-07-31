///@func apply_angle_flipper(base_angle,flipper,[attacking_player],[target_player],[knockback])
///@param base_angle
///@param flipper
///@param [attacking_player]
///@param [target_player]
///@param [knockback]
///Assumed to be run by a hitbox object
///Base angles should default to facing right
var _angle = argument[0];
var _flipper = argument[1];
var _player = argument_count>2 ? argument[2] : noone;
var _target = argument_count>3 ? argument[3] : noone;
var _knockback = argument_count>4 ? argument[4] : 0;
switch(_flipper)
	{
	case FLIPPER.standard:
		//Flips the angle based on the direction the player is facing
		if (_player.facing == -1)
			_angle = 180 - _angle;
		break;
	case FLIPPER.from_player_center:
		//Hits away from the player's origin
		if (_player.x != _target.x || _player.y != _target.y)
			{
			_angle = point_direction(_player.x, _player.y, _target.x, _target.y);
			}
		else
			{
			_angle = default_knockback_angle;
			}
		break;
	case FLIPPER.toward_player_center:
		//Hits toward the player's origin
		if (_player.x != _target.x || _player.y != _target.y)
			{
			_angle = point_direction(_target.x, _target.y, _player.x, _player.y);
			}
		else
			{
			_angle = default_knockback_angle;
			}
		break;
	case FLIPPER.from_player_center_horizontal:
		//Flips based on the target's position relative to the player
		if (_target.x < _player.x)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.toward_player_center_horizontal:
		//Flips based on the target's position relative to the player
		if (_target.x >= _player.x)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.from_hitbox_center:
		//Hits away from the center of the hitbox
		if (x != _target.x || y != _target.y)
			{
			_angle = point_direction(x, y, _target.x, _target.y);
			}
		else
			{
			_angle = default_knockback_angle;
			}
		break;
	case FLIPPER.toward_hitbox_center:
		//Hits toward the center of the hitbox
		if (x != _target.x || y != _target.y)
			{
			_angle = point_direction(_target.x, _target.y, x, y);
			}
		else
			{
			_angle = default_knockback_angle;
			}
		break;
	case FLIPPER.from_hitbox_center_horizontal:
		//Flips based on the target's position relative to the player
		if (_target.x < x)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.toward_hitbox_center_horizontal:
		//Flips based on the target's position relative to the player
		if (_target.x >= x)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.sakurai:
		with(_target)
			{
			if (on_ground())
				{
				_angle = (_knockback > s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
				}
			else
				{
				_angle = s_angle_aerial_angle;
				}
			}
		//Flip the angle
		if (_player.facing == -1)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.sakurai_reverse:
		with(_target)
			{
			if (on_ground())
				{
				_angle = (_knockback > s_angle_knockback_threshold) ? s_angle_high_angle : s_angle_low_angle;
				}
			else
				{
				_angle = s_angle_aerial_angle;
				}
			}
		//Flip the angle (reversed)
		if (_player.facing == 1)
			{
			_angle = 180 - _angle;
			}
		break;
	case FLIPPER.fixed:
		break;
	default: break;
	}
return _angle;