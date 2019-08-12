///Standard_Knocked_Out
//Contains the standard actions for the knocked out state.
var run = true;
//Timer
ko_frame = max(--ko_frame, 0);
#region Animation
anim_sprite = -1;
anim_speed = 0;
anim_frame = 0;
#endregion
#region Particle Effect
confetti_burst(x, y, point_direction(x, y, room_width / 2, room_height / 2), 10, 40, max(0, (100 / ko_frame)));
#endregion
#region No values while dead
set_speed(0, 0, false, false);
set_invulnerable(INV.invincible, 1);
kdir = 0;
kspd = 0;
damage = 0;
ko_property = id;
#endregion
#region If you have no stocks left, you lose
if (run && stock <= 0)
	{
	ko_frame = -1;
	stock = 0;
	set_state(PLAYER_STATE.lost);
	run = false;
	}
#endregion
#region Respawn
if (run && ko_frame == 0)
	{
	//Find the first open respawn platform
	if (instance_number(obj_respawn_platform) > 0)
		{
		var _current_respawning = 0;
		with(obj_player)
			{
			if (state == PLAYER_STATE.respawning)
				{
				_current_respawning++;
				}
			}
		var _platform = instance_find(obj_respawn_platform, _current_respawning);
		x = _platform.x;
		y = _platform.y - sprite_height;
		}
	else
		{
		x = xstart;
		y = ystart;
		}
	//Change state
	set_state(PLAYER_STATE.respawning);
	run = false;
	}
#endregion
//No movement