///Sets all of the variables for a single character
name="Blocky";
//Collision box
mask_index=spr_collision_mask_small;
//Hurtbox
hurtbox_sprite=spr_hurtbox_small;
hurtbox=create_hurtbox(hurtbox_sprite);
//Color Palettes
palettes= 
	[
	create_palette_rgb($FFFFFF,$00FF00,$000000),
								   
	create_palette_rgb($4ce600,$ffea32,$20a35d),
	create_palette_rgb($ff4d4d,$FFBB00,$440044),
	create_palette_rgb($3366ff,$FF00FF,$004400),
	create_palette_rgb($f4c741,$fff5d8,$6b5c31),
	create_palette_rgb($7a5faf,$7631ff,$b6b0c1),
	create_palette_rgb($7a7a7a,$dbdbdb,$3d3d3d),
	create_palette_rgb($dc5be5,$8554d8,$e89be4),
	create_palette_rgb($826844,$db7f00,$493211),
	];
portrait=spr_portrait0;
stock_sprite=spr_stock0;
//Weight
weight_multiplier=1;
//Gravity
grav=0.5;
hitstun_grav=0.5;
//Falling
max_fall_speed=10;
fast_fall_speed=14;
//Jumping
jumpsquat_time=3;
jump_speed=11.5;
shorthop_speed=6.5;
double_jump_speed=10;
max_double_jumps=1;
land_time=4;
//Aerial Movment
air_accel=0.3;
max_air_speed=5;
air_friction=0.04;
//Ground Movement
ground_friction=0.5;
crouch_friction=1;
slide_friction=0.35;
hard_landing_friction=0.5;
//Walking
walk_speed=3.25;
walk_accel=0.5;
walk_turn_time=6;
//Dashing
dash_speed=8;
dash_time=10;
dash_accel=4;
//Running
run_speed=7;
run_accel=0.8;
run_turn_time=10;
run_turn_accel=0.8;
run_stop_time=8;
//Ledges
ledge_jump_vsp=12;
ledge_jump_hsp=2;
ledge_jump_time=12;
ledge_jump_finish_x=40;
ledge_jump_finish_y=-46;
ledge_getup_time=23;
ledge_getup_finish_x=48;
ledge_getup_finish_y=-46;
ledge_roll_time=12;
ledge_roll_finish_x=40;
ledge_roll_finish_y=-46;
ledge_attack_time=12;
ledge_attack_finish_x=40;
ledge_attack_finish_y=-46;
//Some characters would not appear to grab the ledge
//at the right spot due to sprite origin, so these
//variables allow you to add an offset.
ledge_hang_relative_x=-18;
ledge_hang_relative_y=22;
//Air Dodge Values
switch(airdodge_type)
	{
	//Melee / Rivals Air Dodge
	case 0:
		{
		air_dodge_speed=8;
		air_dodge_startup=2;
		air_dodge_active=10;
		air_dodge_endlag=12;
		waveland_speed_boost=1;
		waveland_time=8;
		waveland_friction=0.12;
		break;
		}
	//Smash 4 Air Dodge
	/*
	case 1:
		{
		air_dodge_startup=2;
		air_dodge_active=18;
		air_dodge_endlag=10;
		air_dodge_land_time=12;
		air_dodge_accel=0.2;
		break;
		}
	//*/
	default: break;
	}
//Shield Values
switch(shield_type)
	{
	//Smash 4 Shield
	case 0:
		{
		shield_hp=100;
		shield_recover_rate=0.5;
		shield_jump_speed=13;
		shield_stun=0;
		shield_max_hp=100;
		spot_dodge_startup=3;
		spot_dodge_active=20;
		spot_dodge_endlag=10;
		break;
		}
	//Rivals Parry
	case 1:
		{
		parry_startup=2;
		parry_active=8;
		parry_endlag=20;
		parry_trigger_time=15;
		parry_script=parry0;
		break;
		}
	/*
	//Ultimate Shield
	case 2:
		{
		shield_hp=90;
		shield_recover_rate=0.5;
		shield_jump=9;
		shield_stun=0;
		shield_max_hp=900;
		spot_dodge_startup=6;
		spot_dodge_active=12;
		spot_dodge_endlag=12;
		break;
		}
	//*/
	default: break;
	}
//Walljump Values
/*
switch(walljump_type)
	{
	case 0:
		{
		walljump_hsp=7;
		walljump_vsp=-8;
		}
	default: break;
	}
//*/
//Rolling
roll_speed=9;
roll_startup=3;
roll_active=14;
roll_endlag=8;
//Teching
tech_active=14;
tech_endlag=4;
techroll_speed=10;
techroll_startup=8;
techroll_active=12;
techroll_endlag=14;
//Helpless
helpless_accel=0.4;
helpless_max_speed=3;
//Attacks
my_attacks[?"Jab"   ]= scr_matsu_jab();
my_attacks[?"DashA" ]= scr_matsu_dashattack();
my_attacks[?"Ftilt" ]= scr_matsu_ftilt();
my_attacks[?"Utilt" ]= scr_matsu_utilt();
my_attacks[?"Dtilt" ]= scr_matsu_dtilt();
my_attacks[?"Fsmash"]= scr_matsu_fheavy();
my_attacks[?"Usmash"]= scr_matsu_uheavy();
my_attacks[?"Dsmash"]= scr_matsu_dheavy();
my_attacks[?"Nair"  ]= scr_matsu_nair();
my_attacks[?"Fair"  ]= scr_matsu_fair();
my_attacks[?"Bair"  ]= scr_matsu_bair();
my_attacks[?"Uair"  ]= scr_matsu_uair();
my_attacks[?"Dair"  ]= scr_matsu_dair();
my_attacks[?"Nspec" ]= scr_matsu_nspecial();
my_attacks[?"Fspec" ]= scr_matsu_fspecial();
my_attacks[?"Uspec" ]= scr_matsu_uspecial();
my_attacks[?"Dspec" ]= scr_matsu_dspecial();
my_attacks[?"Grab"	]= scr_matsu_grab();
my_attacks[?"DashG"	]= scr_matsu_dashgrab();
my_attacks[?"Pummel"]= scr_matsu_pummel();
//my_attacks[?"Zair"	]= scr_matsu_
my_attacks[?"FThrow"]=fthrow0;
my_attacks[?"BThrow"]=bthrow0;
my_attacks[?"UThrow"]=uthrow0;
my_attacks[?"DThrow"]=dthrow0;
my_attacks[?"LedgeA"]=ledgeattack0;
my_attacks[?"Taunt" ]=-1;
//Animations / Sprites
sprite_scale=2;
my_sprites[?"Idle"    ]=spr_idle0;
my_sprites[?"Crouch"  ]=spr_crouch0;
my_sprites[?"Walk"    ]=spr_walk0;
my_sprites[?"Run"     ]=spr_run0;
my_sprites[?"Run_Stop"]=spr_run_stop0;
my_sprites[?"JumpS"   ]=spr_jumpsquat0;
my_sprites[?"Jump"    ]=spr_jump0;
my_sprites[?"Midair"  ]=spr_midair0;
my_sprites[?"Fall"    ]=spr_fall0;
my_sprites[?"Fastfall"]=spr_fastfall0;
my_sprites[?"Airdodge"]=spr_airdodge0;
my_sprites[?"Waveland"]=spr_waveland0;
my_sprites[?"Rolling" ]=spr_rolling0; 
my_sprites[?"Techroll"]=spr_rolling0; 
my_sprites[?"Teching" ]=spr_idle0;
my_sprites[?"Hitlag"  ]=spr_hitlag0;
my_sprites[?"Hitstun" ]=spr_hitstun0;
my_sprites[?"Tumble"  ]=spr_tumble0;
my_sprites[?"Helpless"]=spr_helpless0;
my_sprites[?"Lag"     ]=spr_crouch0;
my_sprites[?"Shield"  ]=spr_shield0;
my_sprites[?"ShieldB" ]=spr_shield_break0;
my_sprites[?"ParryS"  ]=spr_parry_stun0;
my_sprites[?"SDodge"  ]=spr_spot_dodge0;
my_sprites[?"LedgeS"  ]=spr_ledge_snap0;
my_sprites[?"Ledge"   ]=spr_ledge_hang0;
my_sprites[?"LedgeG"  ]=spr_ledge_getup0;
my_sprites[?"LedgeJ"  ]=spr_ledge_jump0;
my_sprites[?"LedgeR"  ]=spr_ledge_jump0;
my_sprites[?"LedgeA"  ]=spr_ledge_attack_getup0;
my_sprites[?"LedgeT"  ]=spr_ledge_tether0;
my_sprites[?"Grabbing"]=spr_grabbing0;
my_sprites[?"Entrance"]=spr_idle0;
//Custom Step Event
custom_script=custom0;