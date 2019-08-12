///Sets all of the variables for a single character
name = "Blocky";
//Collision box
mask_index = spr_collision_mask_medium;
//Hurtbox
hurtbox_sprite = spr_hurtbox_small;
hurtbox_crouch_sprite = spr_hurtbox_small_crouch;
hurtbox = create_hurtbox(hurtbox_sprite);
//Color Palettes
palettes = 
	[
	create_palette_rgb($FFFFFF, $00FF00, $000000),
								  	 
	create_palette_rgb($4ce600, $ffea32, $20a35d),
	create_palette_rgb($ff4d4d, $FFBB00, $440044),
	create_palette_rgb($3366ff, $FF00FF, $004400),
	create_palette_rgb($f4c741, $fff5d8, $6b5c31),
	create_palette_rgb($7a5faf, $7631ff, $b6b0c1),
	create_palette_rgb($7a7a7a, $dbdbdb, $3d3d3d),
	create_palette_rgb($dc5be5, $8554d8, $e89be4),
	create_palette_rgb($826844, $db7f00, $493211),
	];
portrait = spr_portrait0;
render = spr_render0;
stock_sprite = spr_stock0;
//Weight
weight_multiplier = 1;
//Gravity
grav = 0.5;
hitstun_grav = 0.5;
//Falling
max_fall_speed = 10;
fast_fall_speed = 14;
//Jumping
jumpsquat_time = 3;
jump_speed = 11.5;
shorthop_speed = 6.5;
double_jump_speed = 10;
max_double_jumps = 1;
land_time = 4;
//Aerial Movment
air_accel = 0.3;
max_air_speed = 5;//5
max_air_speed_dash = 6.5;
air_friction = 0.04;
//Ground Movement
ground_friction = 0.5;
crouch_friction = 1;
slide_friction = 0.35;
hard_landing_friction = 0.6;
//Walking
walk_speed = 3.25;
walk_accel = 0.5;
walk_turn_time = 6;
//Dashing
dash_speed = 8;
dash_time = 10;
dash_accel = 4;
//Running
run_speed = 7;
run_accel = 0.8;
run_turn_time = 10;
run_turn_accel = 0.8;
run_stop_time = 8;
//Ledges
ledge_jump_vsp = 12;
ledge_jump_hsp = 2;
ledge_jump_time = 12;
ledge_jump_finish_x = 40;
ledge_jump_finish_y = -46;
ledge_getup_time = 23;
ledge_getup_finish_x = 48;
ledge_getup_finish_y = -46;
ledge_roll_time = 12;
ledge_roll_finish_x = 40;
ledge_roll_finish_y = -46;
ledge_attack_time = 12;
ledge_attack_finish_x = 40;
ledge_attack_finish_y = -46;
//Some characters would not appear to grab the ledge
//at the right spot due to sprite origin, so these
//variables allow you to add an offset.
ledge_hang_relative_x = -18;
ledge_hang_relative_y = 22;
//Air Dodge Values
switch(airdodge_type)
	{
	//Melee / Rivals Air Dodge
	case AIRDODGE.melee:
		{
		air_dodge_speed = 8;
		air_dodge_startup = 2;
		air_dodge_active = 10;
		air_dodge_endlag = 12;
		waveland_speed_boost = 1;
		waveland_time = 8;
		waveland_friction = 0.12;
		break;
		}
	//Smash 4 Air Dodge
	/*
	case AIRDODGE.smash4:
		{
		air_dodge_startup = 2;
		air_dodge_active = 18;
		air_dodge_endlag = 10;
		air_dodge_land_time = 12;
		air_dodge_accel = 0.2;
		break;
		}
	//*/
	default: break;
	}
//Shield Values
switch(shield_type)
	{
	//Mele Shield
	case SHIELD.melee:
		{
		shield_max_hp = 55;
		shield_hp = shield_max_hp;
		shield_depeletion_rate = 0.14;
		shield_recover_rate = 0.28;
		shield_break_speed = 13;
		shield_break_reset_hp = 25;
		shield_stun = 0;
		shield_size_multiplier = 1;
		shield_shift_amount = 10;
		spot_dodge_startup = 2;
		spot_dodge_active = 20;
		spot_dodge_endlag = 5;
		break;
		}
	//Rivals Parry
	case SHIELD.rivals:
		{
		parry_startup = 2;
		parry_active = 8;
		parry_endlag = 20;
		parry_trigger_time = 15;
		parry_script = parry0;
		break;
		}
	/*
	//Ultimate Shield
	case SHIELD.ultimate:
		{
		shield_hp = 90;
		shield_recover_rate = 0.5;
		shield_jump = 9;
		shield_stun = 0;
		shield_max_hp = 900;
		spot_dodge_startup = 6;
		spot_dodge_active = 12;
		spot_dodge_endlag = 12;
		break;
		}
	//*/
	default: break;
	}
//Walljump Values
switch(walljump_type)
	{
	//Rivals of Aether
	case WALLJUMP.rivals:
		{
		wall_jump_startup = 2;
		wall_jump_time = 12;
		wall_jump_hsp = 7;
		wall_jump_vsp = -8;
		max_wall_jumps = 1;
		can_wall_cling = true;
		}
	default: break;
	}
//*/
//Rolling
roll_speed = 9;
roll_startup = 3;
roll_active = 14;
roll_endlag = 8;
//Teching
tech_active = 16;
tech_endlag = 6;
techroll_speed = 10;
techroll_startup = 8;
techroll_active = 12;
techroll_endlag = 16;
//Helpless
helpless_accel = 0.4;
helpless_max_speed = 3;
//Attacks
my_attacks[?"Jab"	] = jab0;
my_attacks[?"DashA" ] = dashattack0;
my_attacks[?"Ftilt" ] = ftilt_angled;
my_attacks[?"Utilt" ] = utilt_firebreath;
my_attacks[?"Dtilt" ] = dtilt_belmont;
my_attacks[?"Fsmash"] = fsmash0;
my_attacks[?"Usmash"] = usmash0;
my_attacks[?"Dsmash"] = dsmash0;
my_attacks[?"Nair"	] = nair_ike;
my_attacks[?"Fair"	] = fair0;
my_attacks[?"Bair"	] = bair_fox;
my_attacks[?"Uair"	] = uair_ivysaur;
my_attacks[?"Dair"	] = dair0;
my_attacks[?"Nspec" ] = [nspec_charge_shot, nspec_charge_shot_draw];
my_attacks[?"Fspec" ] = fspec_falcon;
my_attacks[?"Uspec" ] = uspec_bowser;
my_attacks[?"Dspec" ] = dspec0;
my_attacks[?"Grab"	] = grab0;
my_attacks[?"DashG"	] = dash_grab0;
my_attacks[?"Pummel"] = pummel0;
my_attacks[?"Zair"	] = zair0;
my_attacks[?"FThrow"] = fthrow0;
my_attacks[?"BThrow"] = bthrow0;
my_attacks[?"UThrow"] = uthrow0;
my_attacks[?"DThrow"] = dthrow0;
my_attacks[?"LedgeA"] = ledgeattack0;
my_attacks[?"Taunt" ] = -1;
//Animations / Sprites
sprite_scale = 2;
my_sprites[?"Idle"		] = spr_idle0;
my_sprites[?"Crouch"	] = spr_crouch0;
my_sprites[?"Walk"		] = spr_walk0;
my_sprites[?"Run"		] = spr_run0;
my_sprites[?"Run_Stop"	] = spr_run_stop0;
my_sprites[?"JumpS"		] = spr_jumpsquat0;
my_sprites[?"Jump"		] = spr_jump0;
my_sprites[?"JumpMid"	] = spr_jump_midair0;
my_sprites[?"Midair"	] = spr_midair0;
my_sprites[?"Fall"		] = spr_fall0;
my_sprites[?"Fastfall"	] = spr_fastfall0;
my_sprites[?"Airdodge"	] = spr_airdodge0;
my_sprites[?"Waveland"	] = spr_waveland0;
my_sprites[?"Rolling"	] = spr_rolling0; 
my_sprites[?"Techroll"	] = spr_rolling0; 
my_sprites[?"Teching"	] = spr_idle0;
my_sprites[?"Hitlag"	] = spr_hitlag0;
my_sprites[?"Hitstun"	] = spr_hitstun0;
my_sprites[?"Tumble"	] = spr_tumble0;
my_sprites[?"Helpless"	] = spr_helpless0;
my_sprites[?"Lag"		] = spr_crouch0;
my_sprites[?"Shield"	] = spr_shield0;
my_sprites[?"ShieldB"	] = spr_shield_break0;
my_sprites[?"ParryS"	] = spr_parry_stun0;
my_sprites[?"SDodge"	] = spr_spot_dodge0;
my_sprites[?"LedgeS"	] = spr_ledge_snap0;
my_sprites[?"Ledge"		] = spr_ledge_hang0;
my_sprites[?"LedgeG"	] = spr_ledge_getup0;
my_sprites[?"LedgeJ"	] = spr_ledge_jump0;
my_sprites[?"LedgeR"	] = spr_ledge_jump0;
my_sprites[?"LedgeA"	] = spr_ledge_attack_getup0;
my_sprites[?"LedgeT"	] = spr_ledge_tether0;
my_sprites[?"LedgeTr"	] = spr_ledge_trump0;
my_sprites[?"WallC"		] = spr_wall_cling0;
my_sprites[?"WallJ"		] = spr_wall_jump0;
my_sprites[?"Grabbing"	] = spr_grabbing0;
my_sprites[?"Entrance"	] = spr_idle0;
//Custom Step Event
custom_script = custom0;