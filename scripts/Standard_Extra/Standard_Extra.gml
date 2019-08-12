///Extra code that must be performed no matter what the state is!
//Resetting the jump counter / airdodge counter / wall jumps
if (on_ground())
	{
	double_jumps = max_double_jumps;
	air_dodges = 1;
	if (walljump_type == WALLJUMP.rivals)
		{
		wall_jumps = max_wall_jumps;
		wall_jump_timeout = 0;
		wall_cling_timeout = 0;
		}
	}
	
//Resetting fastfalling
//It gets set to false after dropping through platforms
if (stick_get_value(Lstick, DIR.down) < stick_tilt_amount)
	{
	can_fastfall = true;
	}
	
//Invulnerablility
if (invulnerable_type != INV.normal && invulnerable_frame == 0)
	{
	invulnerable_type = INV.normal;
	invulnerable_override = true;
	}
invulnerable_frame = max(--invulnerable_frame, 0);

//Maximum Damage
if (damage > max_damage)
	{
	damage = max_damage;
	}
	
//Shield Regeneration
if (state != PLAYER_STATE.shielding && state != PLAYER_STATE.shield_break)
	{
	if (shield_type == SHIELD.melee || shield_type == SHIELD.ultimate)
		{
		shield_hp = min(shield_hp + shield_recover_rate, shield_max_hp);
		}
	}
	
//Ledge grab timeout
ledge_grab_timeout = max(--ledge_grab_timeout, 0);

//Wall Cling timeout
wall_cling_timeout = max(--wall_cling_timeout, 0);

//Wall Jump timeout
wall_jump_timeout = max(--wall_jump_timeout, 0);