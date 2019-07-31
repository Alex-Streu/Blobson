///Extra code that must be performed no matter what the state is!
//Resetting the jump counter / airdodge counter
if (on_ground())
	{
	double_jumps=max_double_jumps;
	air_dodges=1;
	}
//Resetting fastfalling
//It gets set to false after dropping through platforms
if (stick_value(Lstick,DIR.down) < stick_tilt_amount)
	{
	can_fastfall=true;
	}
//Invulnerablility
if (invulnerable_type!=INV.type_normal && invulnerable_frame==0)
	{
	invulnerable_type=INV.type_normal;
	invulnerable_override=true;
	}
invulnerable_frame=max(--invulnerable_frame,0);
//Maximum Damage
if (damage>max_damage)
	{
	damage=max_damage;
	}
//Shield Regeneration
if (state!=PLAYER_STATE.shielding)
	{
	if (shield_type==0 || shield_type==2)
		{
		shield_hp=min(shield_hp+shield_recover_rate,shield_max_hp);
		}
	}
//Ledge grab timeout
ledge_grab_timeout=max(--ledge_grab_timeout,0);