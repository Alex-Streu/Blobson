///Standard_Aerial
//Contains the standard actions for the aerial state.
var run = true;
#region Animation
if (!jump_is_midair_jump)
	{
	//Peak of jump
	if (abs(vsp) < 4)
		{
			anim_speed = ani_speed_jump
		anim_sprite = my_sprites[?"Midair"];
		}
	//Falling
	else if (vsp >= 1)
		{
			anim_speed = ani_speed_jump
		anim_sprite = my_sprites[?"Fall"];
		}
	//Rising
	else if (vsp <= 1)
		{
		anim_speed = ani_speed_jump
		anim_sprite = my_sprites[?"Jump"];
		}
	//Fastfalling
	if (vsp >= fast_fall_speed)
		{
			anim_speed = ani_speed_jump
		anim_sprite = my_sprites[?"Fastfall"];
		}
	}
else
	{		
	//Peak of jump
	if (abs(vsp) < 1)
		{
			anim_speed = ani_speed_jumpdouble
		anim_sprite = my_sprites[?"Doublejumpair"	]
		}
	//Falling
	else if (vsp >= 1)
		{
			anim_speed = ani_speed_jumpdouble
		anim_sprite = my_sprites[?"Fall"];
		}
	//Rising
	else if (vsp <= 1)
		{
		anim_sprite = my_sprites[?"Doublejump"	]
		anim_speed = ani_speed_jumpdouble
		}
	//Fastfalling
	if (vsp >= fast_fall_speed)
		{
			anim_speed = ani_speed_jumpdouble
		anim_sprite = my_sprites[?"Doublejumpfall"]
		}
	}
#endregion
#region Friction and Gravity
//No air friction if you are tilting the stick
var _friction = air_friction;
if (stick_tilted(Lstick, DIR.horizontal))
	{
	_friction = 0;
	}
friction_gravity(_friction, grav, max_fall_speed);
#endregion
#region Landing
if check_landing() run = false;
#endregion
#region Ledge
if run && check_ledge_grab_falling() run = false;
#endregion
#region Airdodging
if run && check_airdodge() run = false;
#endregion
#region Horizontal Movement
if (run) aerial_drift();
#endregion
#region Fastfalling
if (run) fastfall_try();
#endregion
#region Buffered Aerial
if (run && jump_buffer_aerial)
	{
	check_aerials();
	jump_buffer_aerial = false;
	run = false;
	}
#endregion
#region Attacking
if run && check_aerials() run = false;
if run && check_smashes() run = false;
if run && check_specials() run = false;
#endregion
#region Wall Jumping
if (run)
	{
	if (walljump_type == WALLJUMP.rivals)
		{
		if (check_wall_jump()) run = false;
		}
	}
#endregion
#region Double Jumping
//If you have enough jumps
if (run && double_jumps > 0)
	{
	//If jump is being pressed
	var _tap = (scs_tap_jump && stick_flicked(Lstick, DIR.up));
	if (button(INPUT.jump, buff) || _tap)
		{
			anim_frame = 0;
		double_jump();
		run = false;
		}
	}
#endregion
move_();