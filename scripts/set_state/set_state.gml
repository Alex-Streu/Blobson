///@func set_state(state)
///@param state
///@desc Sets the state of the player and then performs initializing actions
state = argument[0];
switch(state)
	{
	case PLAYER_STATE.aerial:
		//Animation
		anim_speed=anim_speed_normal;
		if (!jump_is_midair_jump)
			{
			//Peak of jump
			if (abs(vsp) < 1)
				{
				anim_sprite = my_sprites[?"Midair"];
				}
			//Falling
			else if (vsp >= 1)
				{
				anim_sprite = my_sprites[?"Fall"];
				}
			//Rising
			else if (vsp <= 1)
				{
				anim_sprite = my_sprites[?"Jump"];
				}
			//Fastfalling
			if (vsp >= fast_fall_speed)
				{
				anim_sprite = my_sprites[?"Fastfall"];
				}
			}
		else
			{
			//Peak of jump
			if (abs(vsp) < 1)
				{
				anim_sprite = my_sprites[?"Midair"];
				}
			//Falling
			else if (vsp >= 1)
				{
				anim_sprite = my_sprites[?"Fall"];
				}
			//Rising
			else if (vsp <= 1)
				{
				anim_sprite = my_sprites[?"JumpMid"];
				}
			//Fastfalling
			if (vsp >= fast_fall_speed)
				{
				anim_sprite = my_sprites[?"Fastfall"];
				}
			}
		break;
	case PLAYER_STATE.airdodging:
		//Animation
		anim_sprite = my_sprites[?"Airdodge"];
		anim_speed = anim_speed_normal;
		anim_frame = 0;
		//Speeds
		var spd, dir;
		//Choose a control stick to use
		var _stick = Choose_Stick_By_Input(INPUT.shield);
		//Default direction is straight upwards
		if (stick_tilted(_stick))
			{
			spd = air_dodge_speed;
			dir = stick_get_direction(_stick);
			}
		else
			{
			spd = 0;
			dir = 90;
			}
		set_speed(lengthdir_x(spd, dir), lengthdir_y(spd, dir), false, false);
		//Timers
		air_dodge_frame = air_dodge_startup;
		air_dodge_phase = 0;
		break;
	case PLAYER_STATE.attacking:
		break;
	case PLAYER_STATE.crouching:
		//Animation
		anim_sprite=my_sprites[?"Crouch"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.dashing:
		//Animation
		anim_sprite=my_sprites[?"Run"];
		anim_speed=anim_speed_normal;
		//Timers
		dash_frame=dash_time;
		break;
	case PLAYER_STATE.entrance:
		//Animation
		anim_sprite=my_sprites[?"Entrance"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//No speed
		set_speed(0,0,false,false);
	case PLAYER_STATE.grabbing:
		//Animation
		anim_sprite=my_sprites[?"Grabbing"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.helpless:
		//Animation
		anim_sprite=my_sprites[?"Helpless"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.idle:
		//Animation
		anim_sprite=my_sprites[?"Idle"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.in_flinch:
		//Animation
		anim_sprite=my_sprites[?"Lag"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.in_grab_release:
		//Animation
		anim_sprite=my_sprites[?"Lag"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.in_hitlag:
		//Animation
		anim_sprite=my_sprites[?"Hitlag"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.in_hitstun:
		//Animation
		anim_sprite=my_sprites[?"Hitstun"];
		anim_speed=anim_speed_normal;;
		anim_frame=0;
		break;
	case PLAYER_STATE.in_lag:
		//Animation
		anim_sprite=my_sprites[?"Lag"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		break;
	case PLAYER_STATE.in_tumble:
		anim_sprite=my_sprites[?"Tumble"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.is_grabbed:
		//Animation
		anim_sprite=my_sprites[?"Hitstun"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.jumpsquat:
		anim_sprite=my_sprites[?"JumpS"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		break;
	case PLAYER_STATE.knockdown:
		//Animation
		anim_sprite=my_sprites[?"Lag"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		break;
	case PLAYER_STATE.knocked_out:
		//Animation
		anim_sprite=-1;
		anim_speed=0;
		anim_frame=0;
		//Timer
		ko_frame=ko_base_time;
		break;
	case PLAYER_STATE.ledge_attack:
		//Animation
		anim_sprite=my_sprites[?"LedgeA"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Invincible
		set_invulnerable(INV.invincible,1);
		//Timer
		ledge_attack_frame=ledge_attack_time;
		break;
	case PLAYER_STATE.ledge_getup:
		//Animation
		anim_sprite=my_sprites[?"LedgeG"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Invincible
		set_invulnerable(INV.invincible,1);
		//Timer
		ledge_getup_frame=ledge_getup_time;
		break;
	case PLAYER_STATE.ledge_hang:
		//Animation
		anim_sprite=my_sprites[?"Ledge"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//No speeds
		set_speed(0,0,false,false);
		//Invincible
		set_invulnerable(INV.invincible,ledge_invincible_time);
		break;
	case PLAYER_STATE.ledge_jump:
		//Animation
		anim_sprite=my_sprites[?"LedgeJ"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Invincible
		set_invulnerable(INV.invincible,1);
		//Timer
		ledge_jump_frame=ledge_jump_time;
		break;
	case PLAYER_STATE.ledge_roll:
		//Animation
		anim_sprite=my_sprites[?"LedgeR"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Invincible
		set_invulnerable(INV.invincible,1);
		//Timer
		ledge_roll_frame=ledge_roll_time;
		break;
	case PLAYER_STATE.ledge_snap:
		//Animation
		anim_sprite=my_sprites[?"LedgeS"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Allow for "2 frame" punish
		set_invulnerable(INV.normal,0);
		break;
	case PLAYER_STATE.ledge_tether:
		//Animation
		anim_sprite=my_sprites[?"LedgeT"];
		anim_speed=anim_speed_normal;
		//Superarmor!
		set_invulnerable(INV.superarmor,1);
		break;
	case PLAYER_STATE.ledge_trump:
		//Animation
		anim_sprite=my_sprites[?"LedgeTr"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		break;
	case PLAYER_STATE.lost:
		//Invulnerability
		set_invulnerable(INV.invincible,1);
		break;
	case PLAYER_STATE.magnetized:
		//Animation
		anim_sprite=my_sprites[?"Hitstun"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.parry_stun:
		//Animation
		if (on_ground())
			{
			anim_sprite=my_sprites[?"ParryS"];
			}
		else
			{
			anim_sprite=my_sprites[?"Tumble"];
			}
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.parrying:
		//Run the start phase of the parry script, which handles animation
		script_execute(parry_script,PHASE.start);
		break;
	case PLAYER_STATE.respawning:
		//Animation
		anim_sprite=my_sprites[?"Idle"];
		anim_speed=1;
		//Invulnerability
		set_invulnerable(INV.invincible,respawning_invulnerable_time);
		//Timer
		respawn_frame=max_respawn_platform_time;
		break;
	case PLAYER_STATE.rolling:
		//Animation
		anim_sprite=my_sprites[?"Rolling"];
		anim_speed=0;
		anim_frame=0;
		//Speeds
		set_speed(0,0,false,false);
		//Timers
		rolling_frame=roll_startup;
		rolling_phase=0;
		break;
	case PLAYER_STATE.run_stop:
		//Animation
		anim_sprite=my_sprites[?"Run_Stop"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		break;
	case PLAYER_STATE.run_turnaround:
		//Animation
		anim_sprite=my_sprites[?"Run"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.running:
		//Animation
		anim_sprite=my_sprites[?"Run"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.shielding:
		//Animation
		anim_sprite=my_sprites[?"Shield"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Shield type
		switch(shield_type)
			{
			case SHIELD.melee:
				{
				set_invulnerable(INV.shielding,1);
				break;
				}
			}
		break;
	case PLAYER_STATE.shield_break:
		//Animation
		anim_sprite=my_sprites[?"Tumble"];
		anim_speed=anim_speed_normal;
		anim_frame=0;
		//Invulnerable
		set_invulnerable(INV.invincible,1);
		break;
	case PLAYER_STATE.spot_dodging:
		//Animation
		anim_sprite=my_sprites[?"SDodge"];
		anim_speed=0;
		anim_frame=0;
		//No invulnerability
		set_invulnerable(INV.normal,0);
		break;
	case PLAYER_STATE.teching:
		break;
	case PLAYER_STATE.techrolling:
		//Animation
		anim_sprite=my_sprites[?"Techroll"];
		anim_speed=0;
		anim_frame=0;
		break;
	case PLAYER_STATE.walk_turnaround:
		//Animation
		anim_sprite=my_sprites[?"Walk"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.walking:
		//Animation
		anim_sprite=my_sprites[?"Walk"];
		anim_speed=anim_speed_normal;
		//Dash Cancel Frame
		walk_to_dash_frame=dash_buffer;
		break;
	case PLAYER_STATE.wall_cling:
		//Animation
		anim_sprite=my_sprites[?"WallC"];
		anim_speed=anim_speed_normal;
		break;
	case PLAYER_STATE.wall_jump:
		//Animation
		anim_sprite=my_sprites[?"WallJ"];
		anim_speed=0;
		anim_frame=0;
		//Phase
		wall_jump_phase = 0;
		break;
	case PLAYER_STATE.wavelanding:
		//Animation
		anim_sprite=my_sprites[?"Waveland"];
		anim_speed=anim_speed_normal;
		break;
	default:
		show_debug_message("The player has been assigned a nonexistent state!");
		break;
	}