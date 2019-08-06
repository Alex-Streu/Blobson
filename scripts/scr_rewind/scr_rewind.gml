///Sets all of the variables for a single character
name="Rewind";
//Collision box
mask_index=spr_rewind_collision;
//Hurtbox
hurtbox_sprite=spr_rewind_hurtbox;
hurtbox=create_hurtbox(hurtbox_sprite);
//Main sizes
sprite_scale= 1;

//Palettes
my_pal_sprite= spr_rewind_pal; //fighter palette
my_portrait_pal_sprite = spr_matsu_portrait_pal //fighter's portrait palette
my_current_pallete = 1;

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
portrait= spr_matsu_portrait;
stock_sprite= spr_matsu_stock;


//Ex meter
EX_meter = 0;
EX_meter_max = 154;
//Weight
weight_multiplier=1.1;
//Gravity
grav=1;
hitstun_grav=0.7;
//Falling
max_fall_speed=11;
fast_fall_speed=14;
//Jumping
jumpsquat_time=3;
jump_speed=18;
shorthop_speed= 9;
double_jump_speed=16;
max_double_jumps=1;
land_time=3;
//Aerial Movment
air_accel=0.5;
max_air_speed=5;
air_friction=0.04;
//Ground Movement
ground_friction= 1;
crouch_friction=1;
slide_friction=0.5;
hard_landing_friction=0.5;
//Walking
walk_speed= 4;
walk_accel=0.5;
walk_turn_time=6;
//Dashing
dash_speed=8;
dash_time=8;
dash_accel=4;
//Running
run_speed=12;
run_accel=0.8;
run_turn_time=10;
run_turn_accel=0.8;
run_stop_time=8;
//Ledges
ledge_jump_vsp=17;
ledge_jump_hsp=3.5;
ledge_jump_time=16;
ledge_jump_finish_x=-8;
ledge_jump_finish_y=-128;
ledge_getup_time=22;
ledge_getup_finish_x=24;
ledge_getup_finish_y= -127;
ledge_roll_time=12;
ledge_roll_finish_x=10;
ledge_roll_finish_y=-127;
ledge_attack_time=21;
ledge_attack_finish_x=24;
ledge_attack_finish_y=-127;
//Some characters would not appear to grab the ledge
//at the right spot due to sprite origin, so these
//variables allow you to add an offset.
ledge_hang_relative_x=-22;
ledge_hang_relative_y= 126;
//Air Dodge Values
switch(airdodge_type)
	{
	//Good Air Dodge
	case 0:
		{
		air_dodge_speed=10;
		air_dodge_startup=2;
		air_dodge_active=10;
		air_dodge_endlag=12;
		waveland_speed_boost=1;
		waveland_time=8;
		waveland_friction=0.12;
		break;
		}
	//Shitty Air Dodge
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
		parry_script= scr_matsu_parry;
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
roll_active=24;
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
my_attacks[?"Jab"   ]= scr_matsu_jab;
my_attacks[?"DashA" ]= scr_matsu_dashattack;
my_attacks[?"Ftilt" ]= scr_rewind_ftilt;
my_attacks[?"Utilt" ]= scr_matsu_utilt;
my_attacks[?"Dtilt" ]= scr_rewind_dtilt;
my_attacks[?"Fsmash"]= scr_matsu_fheavy;
my_attacks[?"Usmash"]= scr_matsu_uheavy;
my_attacks[?"Dsmash"]= scr_matsu_dheavy;
my_attacks[?"Nair"  ]= scr_matsu_nair;
my_attacks[?"Fair"  ]= scr_matsu_fair;
my_attacks[?"Bair"  ]= scr_matsu_bair;
my_attacks[?"Uair"  ]= scr_matsu_uair;
my_attacks[?"Uair_success"  ]= scr_matsu_uair_success;
my_attacks[?"Dair"  ]= scr_matsu_dair;
my_attacks[?"Nspec" ]= scr_matsu_nspecial;
my_attacks[?"Fspec" ]= scr_matsu_fspecial;
my_attacks[?"Fspec_success" ]= scr_matsu_fspecial_success;
my_attacks[?"Uspec" ]= scr_matsu_uspecial;
my_attacks[?"Dspec" ]= scr_matsu_dspecial;
my_attacks[?"Grab"	]= scr_matsu_grab;
my_attacks[?"DashG"	]= scr_matsu_dashgrab;
my_attacks[?"Pummel"]= scr_matsu_pummel;
my_attacks[?"Zair"	]= zair0;
my_attacks[?"FThrow"]= scr_matsu_fthrow;
my_attacks[?"BThrow"]=scr_matsu_bthrow;
my_attacks[?"UThrow"]=scr_matsu_uthrow;
my_attacks[?"DThrow"]= scr_matsu_dthrow;
my_attacks[?"LedgeA"]=scr_matsu_ledgeattack;
my_attacks[?"Taunt" ]=-1;
//Animations / Sprites

my_sprites[?"Idle"    ]=spr_rewind_idle;
my_sprites[?"Crouch"  ]=spr_rewind_crouch;
my_sprites[?"Walk"    ]=spr_rewind_walk;
my_sprites[?"Run"     ]=spr_rewind_run;
my_sprites[?"Run_Stop"]=spr_rewind_runstop;
my_sprites[?"JumpS"   ]=spr_rewind_jumpsquat;
my_sprites[?"Jump"    ]=spr_rewind_jump;
my_sprites[?"Doublejump"]=spr_rewind_doublejump;
my_sprites[?"Doublejumpfall"]=spr_rewind_doublejump;
my_sprites[?"Doublejumpair"] = spr_rewind_airborne
my_sprites[?"Midair"  ]=spr_rewind_airborne;
my_sprites[?"Fall"    ]=spr_rewind_fall;
my_sprites[?"Fastfall"]=spr_rewind_fall;
my_sprites[?"Airdodge"]=spr_rewind_airdodge;
my_sprites[?"Waveland"]=spr_rewind_landlag;
my_sprites[?"Rolling" ]=spr_rewind_dodgeroll; 
my_sprites[?"Techroll"]=spr_rewind_dodgeroll; 
my_sprites[?"Teching" ]=spr_rewind_idle;
my_sprites[?"Hitlag"  ]=spr_rewind_hitlag1;
my_sprites[?"Hitlag2"  ]=spr_rewind_hitlag1;
my_sprites[?"Hitlag3"  ]=spr_rewind_hitlag1;
my_sprites[?"Hitlag4"  ]=spr_rewind_hitlag1;
my_sprites[?"Hitstun" ]=spr_rewind_hitstun1;
my_sprites[?"Hitstun2" ]=spr_rewind_hitstun1;
my_sprites[?"Hitstun3" ]=spr_rewind_hitstun1;
my_sprites[?"Hitstun4" ]=spr_rewind_hitstun1;
my_sprites[?"Hitstunheavy" ]=spr_rewind_hitstun1;
my_sprites[?"Tumble"  ]=spr_rewind_hitstun1;
my_sprites[?"Helpless"]=spr_rewind_hitstun1;
my_sprites[?"Landlag"]=spr_rewind_landlag;
my_sprites[?"Lag"     ]=spr_rewind_landlag;
my_sprites[?"Grabbed"]=spr_rewind_hitlag1; //being grabbed by an enemy
my_sprites[?"Shield"  ]=spr_matsu_parrystart;
my_sprites[?"ShieldB" ]=spr_matsu_parrystart;
my_sprites[?"Tech" ]=spr_matsu_tech;
my_sprites[?"Parry" ]=spr_matsu_parrystart;
my_sprites[?"ParryS"  ]=spr_matsu_parried;
my_sprites[?"Parryland"]=spr_matsu_parryland;
my_sprites[?"SDodge"  ]=spr_matsu_parrystart;
my_sprites[?"LedgeS"  ]=spr_matsu_ledgesnap;
my_sprites[?"Ledge"   ]=spr_matsu_ledgehang;
my_sprites[?"LedgeG"  ]=spr_matsu_ledge_getup;
my_sprites[?"LedgeJ"  ]=spr_matsu_ledge_getup;
my_sprites[?"LedgeR"  ]=spr_matsu_ledge_getup;
my_sprites[?"LedgeA"  ]=spr_matsu_ledge_getup;
my_sprites[?"LedgeT"  ]=spr_ledge_tether0;
my_sprites[?"Grabbing"]=spr_matsu_grab;
my_sprites[?"Entrance"]=spr_rewind_entrance;
//Animations for attacks
my_sprites[?"Dashattack" ]=spr_matsu_dashattack
my_sprites[?"Grab" ]=spr_matsu_grab;
my_sprites[?"Grabbing" ]=spr_matsu_grabbing;
my_sprites[?"Bthrow" ]=spr_matsu_bthrow;
my_sprites[?"Fthrow" ]=spr_matsu_fthrow;
my_sprites[?"Uthrow" ]=spr_matsu_uthrow;
my_sprites[?"Dthrow" ]=spr_matsu_dthrow;
my_sprites[?"Pummel"] = spr_matsu_pummel;
my_sprites[?"Jab1" ]=spr_matsu_jab1;
my_sprites[?"Jab2" ]=spr_matsu_jab2;
my_sprites[?"Jab3" ]=spr_matsu_jab3;
my_sprites[?"Ftilt" ]=spr_rewind_ftilt;
my_sprites[?"Dtilt" ]=spr_rewind_dtilt;
my_sprites[?"Utilt" ]=spr_matsu_utilt;
my_sprites[?"Nair" ]=spr_matsu_nair;
my_sprites[?"Bair" ]=spr_matsu_bair;
my_sprites[?"Fair" ]=spr_matsu_fair;
my_sprites[?"Dair" ]=spr_matsu_dairb;
my_sprites[?"Uair" ]=spr_matsu_uair;
my_sprites[?"Uairb" ]=spr_matsu_uairb;
my_sprites[?"Fheavy" ]=spr_matsu_fheavy;
my_sprites[?"Dheavy" ]=spr_matsu_dheavy;
my_sprites[?"Uheavy" ]=spr_matsu_uheavy;
my_sprites[?"Fspecial" ]=spr_matsu_fspecial;
my_sprites[?"Uspecial" ]=spr_matsu_uspecial;
my_sprites[?"Uspecial2" ]=spr_matsu_uspecial2;
//Animation speed (non attacks)
ani_speed_intro = .6;
ani_speed_idle = .2;
ani_speed_crouch = 1;
ani_speed_walk = 1.3;
ani_speed_run = .7;
ani_speed_runstop = .7;
ani_speed_jump = .8;
ani_speed_airborne = .8;
ani_speed_airdodge = .8;
ani_speed_tech = .75;
ani_speed_techroll = .9;
ani_speed_getup = .85;
ani_speed_ledge_jump = .75;
ani_speed_dodgeroll = 1;
ani_speed_tumble = 1;
ani_speed_hitstun = 1;
ani_speed_parryland = .50;

ani_speed_uspecial_charge = 1;

frame_final_crouch = 2;
frame_final_run_confirm = true;
frame_final_run = 2;
//Sound effects
snd_grab = sfx_matsu_jab3;
snd_pummel = sfx_hitgrab1;
snd_dash = sfx_dash1;
snd_jab1 = sfx_matsu_jab1;
snd_jab1_hit = sfx_hit_light1;
snd_jab2 = sfx_matsu_jab2;
snd_jab2_hit = sfx_hit_light2;
snd_jab3 = sfx_matsu_jab3;
snd_jab3_hit = sfx_hit_med3; // med 2
snd_dashattack_hit = sfx_hit_med12; // med 2
snd_nair_hit = sfx_hit_light5; // light5 
snd_fair_hit = sfx_hit_light1; // light5 
snd_bair_hit = sfx_hit_med11; // med2
snd_dair_hit = sfx_hit_med8; // light5 
snd_dair_sweetspot_hit = sfx_hit_heavy1; // light5 
snd_uair_hit = sfx_hit_med4; // light5 
snd_ftilt_hit = sfx_hit_med15; // light5 
snd_dtilt_hit = sfx_rewind_hit1; // light5 
snd_utilt_hit = sfx_hit_light5; // light5 
snd_fheavy1_hit = sfx_hit_light1; // light5 
snd_fheavy2_hit = sfx_hit_light2; // light5 
snd_fheavy3_hit = sfx_hit_heavy4; // light5 
snd_uheavy_hit = sfx_hit_heavy3; // light5 
snd_dheavy_hit = sfx_hit_heavy2; // light5 
//Custom Step Event
custom_script= scr_rewind_custom();