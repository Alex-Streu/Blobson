///@func grab_release()
///@desc Attacking player goes into grab release, the defending player goes into hitstun
if (grabbed_id.state == PLAYER_STATE.is_grabbed)
	{
	with(grabbed_id)
		{
		grab_release_held();
		}
	}
//Grabber goes into a lag state
set_state(PLAYER_STATE.in_grab_release);
grab_release_frame = grab_release_hitstun;
damage += grab_release_damage;