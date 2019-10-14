///Sets all of the variables for a single character

name="Sarina";//Fighter name

#region Masks
//Collision box
mask_index=spr_matsu_collision_mask;
//Hurtbox
hurtbox_default = spr_sarina_hurtbox;
hurtbox_sprite=spr_sarina_hurtbox;
hurtbox=create_hurtbox(hurtbox_sprite);
hurtbox_crouch_sprite = spr_sarina_hurtbox_crouch;
#endregion

//Main sizes
sprite_scale= 1;
magnifier_y = 0;

#region portraits, renders, palettes
my_pal_sprite= spr_sarina_pal; //fighter palette
my_portrait_pal_sprite = spr_sarina_pal //fighter's portrait palette
my_current_pallete = 1;
portrait= spr_sarina_hud1;
offscreen_sprite = spr_sarina_offscreen; //When fighter is shown in indicator
stock_sprite= spr_matsu_stock;
render = spr_sarina_render;
victory_theme = sfx_victory_sarina;
#endregion

#region Color Palettes (old)
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
#endregion

//Ex meter
EX_meter = 0;
EX_meter_max = 100;

#region Weight and Gravity
//Weight
weight_multiplier=1.1;
//Gravity
grav=1;
hitstun_grav=0.6;
#endregion
#region Jumping and Falling
//Falling
max_fall_speed=11;
fast_fall_speed=14;
//Jumping
jumpsquat_time=5;
jump_speed=18;
shorthop_speed= 9;
double_jump_speed=16;
max_double_jumps=1;
land_time=5;

#endregion
#region Wall Jump
//Walljump Values
switch(walljump_type)
	{
	//Rivals of Aether
	case WALLJUMP.rivals:
		{
		if instance_exists(obj_crushrush)
		{
		wall_jump_startup = 3;
		wall_jump_time = 7;
		wall_jump_hsp = 14;
		wall_jump_vsp = -20;
		max_wall_jumps = 1;
		can_wall_cling = false;
		}
		if !instance_exists(obj_crushrush)
		{
		wall_jump_startup = 10;
		wall_jump_time = 7;
		wall_jump_hsp = 7;
		wall_jump_vsp = -13;
		max_wall_jumps = 1;
		can_wall_cling = false;
		}
		
		}
	default: break;
	}
#endregion
#region Aerial Movment
//Air control
air_accel=0.5;
max_air_speed=5;
max_air_speed_dash = 9;
air_friction=0.04;
//Helpless
helpless_accel=0.4;
helpless_max_speed=3;
#endregion
#region Ground movement
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
dash_speed=10;
dash_time=8;
dash_accel=4;
//Running
run_speed=10;
run_accel=0.8;
run_turn_time=10;
run_turn_accel=0.8;
run_stop_time=8;
//Rolling
roll_speed=11;
roll_startup=3;
roll_active=20;
roll_endlag=8;
#endregion
#region Ledges
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
#endregion
#region Airdodge
//Air Dodge Values
switch(airdodge_type)
	{
	//Good Air Dodge
	case AIRDODGE.melee:
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
#endregion
#region Shield/Parry
//Shield Values
switch(shield_type)
	{
	//Smash 4 Shield
	case SHIELD.melee:
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
	case SHIELD.rivals:
		{
		parry_cooldown_default = 30;
		parry_cooldown_timer = 30;
		parry_startup=2;
		parry_active=12;
		parry_endlag=20;
		parry_trigger_time=15;
		parry_script= scr_sarina_parry;
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
#endregion
#region Teching
tech_active=14;
tech_endlag=4;
techroll_speed=10;
techroll_startup=8;
techroll_active=12;
techroll_endlag=14;
#endregion
#region EX meter
ex_sarina_nair = 5;
#endregion
#region UNUSED
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
#endregion

//Character scripts________________________________________________________________________________
#region Attack scripts
my_attacks[?"Jab"   ]= scr_sarina_jab;
my_attacks[?"DashA" ]= scr_takia_dashattack;
my_attacks[?"Ftilt" ]= scr_sarina_ftilt;
my_attacks[?"Utilt" ]= scr_sarina_utilt;
my_attacks[?"Dtilt" ]= scr_sarina_dtilt;
my_attacks[?"Fsmash"]= scr_takia_fheavy;
my_attacks[?"Usmash"]= scr_sarina_uheavy;
my_attacks[?"Dsmash"]= scr_sarina_dheavy;
my_attacks[?"Nair"  ]= scr_sarina_nair;
my_attacks[?"Fair"  ]= scr_sarina_fair;
my_attacks[?"Bair"  ]= scr_sarina_bair_a;
my_attacks[?"Uair"  ]= scr_sarina_uair;
my_attacks[?"Dair"  ]= scr_sarina_dair;
my_attacks[?"Nspec" ]= scr_matsu_fspecial;
my_attacks[?"Fspec" ]= scr_matsu_fspecial;
my_attacks[?"Fspec_success" ]= scr_matsu_fspecial_success;
my_attacks[?"Uspec" ]= scr_matsu_uspecial;
my_attacks[?"Dspec" ]= scr_sarina_dspecial_slide;
my_attacks[?"Grab"	]= scr_matsu_grab;
my_attacks[?"DashG"	]= scr_matsu_dashgrab;
my_attacks[?"Pummel"]= scr_matsu_pummel;
my_attacks[?"Zair"	]= zair0;
my_attacks[?"FThrow"]= scr_matsu_fthrow;
my_attacks[?"BThrow"]=scr_matsu_bthrow;
my_attacks[?"UThrow"]=scr_matsu_uthrow;
my_attacks[?"DThrow"]= scr_matsu_dthrow;
my_attacks[?"LedgeA"]=scr_matsu_ledgeattack;
#endregion
my_attacks[?"Taunt" ]= scr_sarina_taunt1;
//Animations______________________________________________________________________________________

//Animation sprites
#region Animations - main
my_sprites[?"Idle"    ]=spr_sarina_idle;
my_sprites[?"Crouch"  ]=spr_sarina_crouch;
my_sprites[?"Walk"    ]=spr_sarina_walk;
my_sprites[?"Turn"    ]=spr_sarina_turn;
my_sprites[?"Dash"     ]=spr_sarina_runstart;
my_sprites[?"Run"     ]=spr_sarina_run;
my_sprites[?"Run_Stop"]=spr_sarina_runstop;
my_sprites[?"JumpS"   ]=spr_sarina_jumpsquat;
my_sprites[?"Jump"    ]=spr_sarina_jumpup;
my_sprites[?"JumpMid"	] =spr_sarina_midair;
my_sprites[?"Doublejump"] = spr_sarina_doublejump;
my_sprites[?"Doublejumpfall"]=spr_sarina_fall;
my_sprites[?"Doublejumpair"] = spr_sarina_doublejump;
my_sprites[?"Midair"  ]=spr_sarina_midair;
my_sprites[?"Fall"    ]=spr_sarina_fall;
my_sprites[?"Fastfall"]=spr_sarina_fall;
my_sprites[?"Airdodge"]=spr_sarina_airdodge;
my_sprites[?"Waveland"]=spr_sarina_waveland;
my_sprites[?"Rolling" ]=spr_sarina_roll; 
my_sprites[?"Techroll"]=spr_sarina_roll; 
my_sprites[?"Teching" ]=spr_sarina_waveland;
my_sprites[?"Hitlag"  ]=spr_sarina_hitlag1;
my_sprites[?"Hitlag2"]=spr_sarina_hitlag2;
my_sprites[?"Hitlag3"]=spr_sarina_hitlag3;
my_sprites[?"Hitlag4"]=spr_sarina_hitlag2;
my_sprites[?"Flinch"]=spr_sarina_flinch1;
my_sprites[?"Flinch2"]=spr_sarina_flinch2;
my_sprites[?"Flinch3"]=spr_sarina_flinch3;
my_sprites[?"Flinch4"]=spr_sarina_flinch1;
my_sprites[?"Hitstun" ]=spr_sarina_hitstun1;
my_sprites[?"Hitstun2" ]=spr_sarina_hitstun1;
my_sprites[?"Hitstun3" ]=spr_sarina_hitstun1;
my_sprites[?"Hitstun4" ]=spr_sarina_hitstun1;
my_sprites[?"Hitstunheavy" ]=spr_sarina_hitstun_heavy;
my_sprites[?"Tumble"  ]=spr_matsu_tumble;
my_sprites[?"Helpless"]=spr_matsu_freefall;
my_sprites[?"Landlag"]=spr_sarina_landlag;
my_sprites[?"Lag"     ]=spr_sarina_landlag;
my_sprites[?"Grabbed"]=spr_sarina_grabbed; //being grabbed by an enemy
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
my_sprites[?"LedgeTr"	] = spr_ledge_trump0;
my_sprites[?"WallC"		] = spr_wall_cling0;
my_sprites[?"WallJ"		] = spr_sarina_walljump;
my_sprites[?"Grabbing"]=spr_matsu_grab;
my_sprites[?"Entrance"]=spr_sarina_entrance;
my_sprites[?"Taunt"]=spr_sarina_taunt;
#endregion
#region Animations - Attacks
my_sprites[?"Dashattack" ]=spr_takia_dashattack
my_sprites[?"Grab" ]=spr_matsu_grab;
my_sprites[?"Grabbing" ]=spr_matsu_grabbing;
my_sprites[?"Bthrow" ]=spr_matsu_bthrow;
my_sprites[?"Fthrow" ]=spr_matsu_fthrow;
my_sprites[?"Uthrow" ]=spr_matsu_uthrow;
my_sprites[?"Dthrow" ]=spr_matsu_dthrow;
my_sprites[?"Pummel"] = spr_matsu_pummel;
my_sprites[?"Jab1" ]=spr_sarina_jab1;
my_sprites[?"Jab2" ]=spr_sarina_jab2;
my_sprites[?"Jab3" ]=spr_sarina_jab3;
my_sprites[?"Ftilt" ]=spr_sarina_ftilt;
my_sprites[?"Dtilt" ]=spr_sarina_dtilt;
my_sprites[?"Utilt" ]=spr_sarina_utilt;
my_sprites[?"Nair" ]=spr_sarina_nair;
my_sprites[?"Bair" ]=spr_sarina_bair;
my_sprites[?"Bairb"]=spr_sarina_bair2;
my_sprites[?"Fair" ]=spr_sarina_fair;
my_sprites[?"Dair" ]=spr_sarina_dairv2;
my_sprites[?"Uair" ]=spr_sarina_uair;
my_sprites[?"Fheavy" ]=spr_takia_fheavy;
my_sprites[?"Dheavy" ]=spr_sarina_dheavy;
my_sprites[?"Uheavy" ]=spr_sarina_uheavy;
my_sprites[?"Fspecial" ]=spr_matsu_fspecial;
my_sprites[?"Uspecial" ]=spr_matsu_uspecial;
my_sprites[?"Uspecial2" ]=spr_matsu_uspecial2;
#endregion
#region Animation speeds - non attacks
ani_speed_intro = .65;
ani_speed_idle = 1;
ani_speed_crouch = 1;
ani_speed_walk = 1;
ani_speed_dash = .6
ani_speed_run = 1.2;
ani_speed_runstop = .7;
ani_speed_jump = .8;
ani_speed_jumpsquat = 1;
ani_speed_jumpdouble = 1.2
if  instance_exists(obj_crushrush)   {ani_speed_walljump = 2;}
if !instance_exists(obj_crushrush)   {ani_speed_walljump = 1;}

ani_speed_airborne = .8;
ani_speed_airdodge = 1.8;
ani_speed_waveland = 1
ani_speed_tech = .75;
ani_speed_techroll = .9;
ani_speed_ledgegetup = .85;
ani_speed_ledgesnap = .75;
ani_speed_ledgehang = .7;
ani_speed_ledge_jump = .75;
ani_speed_dodgeroll = 1.4;
ani_speed_tumble = 1;
ani_speed_flinch = .5;
ani_speed_hitstun = .75;
ani_speed_hitstun_heavy = 1.2;
ani_speed_parryland = .50;
ani_speed_lag = 1;
ani_speed_helpless = 0.75
ani_speed_grabhold = 0.75
ani_speed_grabbed = 0.75
ani_speed_uspecial_charge = 1;

frame_final_crouch = 7;
frame_final_run_confirm = false;
#endregion
#region Animation Variables
ani_lag_loop = false; //for the flinch, stop at the final frame if false. loop the animation if true.
#endregion

#region Animation Effects

#region Heavy attack flash
heavy_flash_timer_startup = 10;
heavy_flash_timer = heavy_flash_timer_startup;
heavy_flash = false;
#endregion
#region Dodgeroll flash
dodgeroll_sprite = spr_sarina_roll_flash;
dodgeroll_flash = false;
#endregion
#region Airdodge flash
airdodge_sprite = spr_sarina_airdodge_flash;
airdodge_flash = false;
#endregion

#endregion
//Sound effects____________________________________________________________________________________
#region Sounds for everything besides attacks
snd_dash = sfx_dash1;
snd_step1 = sfx_step1;
snd_step2 = sfx_step1;
snd_step3 = sfx_step3;
snd_step4 = sfx_step4;
#endregion
#region Sounds for attacks and effects
snd_grab = sfx_matsu_jab3;
snd_pummel = sfx_hitgrab1;
snd_jab1 = sfx_matsu_jab1;
snd_jab1_hit = sfx_hit_light1;
snd_jab2 = sfx_matsu_jab2;
snd_jab2_hit = sfx_hit_light2;
snd_jab3 = sfx_matsu_jab3;
snd_jab3_hit = sfx_stab1; // med 2
snd_dashattack_hit = sfx_hit_med12;

snd_nair = sfx_swoosh2;
snd_nair_sourhit = sfx_hit_light1;
snd_nair_hit = sfx_hit_light5; // light5 

snd_bair_b = sfx_swoosh2;
snd_bair_b_hit= sfx_hit_med11; // light5 

snd_fair_hit = sfx_stab3;
snd_fair = sfx_swoosh2;

snd_bair1 = sfx_swoosh2;
snd_bair1_hit = sfx_stab3; // med2
snd_bair1_sweethit = sfx_stab1; // light5 


snd_bair_hit = sfx_hit_med11; // med2

snd_dair = sfx_swoosh2;
snd_dair_hit = sfx_stab3; // light5 
snd_dair_sweetspot_hit = sfx_stab4; // light5 

snd_uair_hit = sfx_stab2; // light5 
snd_uair_sourhit = sfx_stab3; // light5 
snd_uair_sweethit = sfx_stab1;; // light5 

snd_ftilt_firsthit = sfx_stab1;
snd_ftilt_hit = sfx_stab2; // light5 
snd_ftilt_endhit = sfx_stab4;
snd_ftilt_loop = sfx_swoosh2;

snd_dtilt_hit = sfx_hit_light4; // light5 
snd_dtilt_sweethit = sfx_hit_med1

snd_utilt_hit = sfx_stab3; // light5 



snd_fheavy_hit = sfx_stab4; // light5 

snd_uheavy = sfx_swoosh2; // light5 
snd_uheavy_hit = sfx_stab3;// light5 

snd_dheavy_hit = sfx_hit_heavy2; // light5 

snd_hitmulti1 = sfx_hit_light1;
snd_hitmulti2 = sfx_hit_light2;

snd_tipper1 = sfx_stab4;
snd_tipper2 = sfx_stab1;
#endregion
//Voices
#region Voice clips
vc_nothing = sfx_nothing;
vc_intro1a = sfx_nothing;
vc_intro1b = sfx_nothing;
vc_intro2a = sfx_nothing;
vc_intro2b = sfx_nothing;


#region Voice attacks - general
vc_jab1 = sfx_nothing;
vc_jab2 = sfx_nothing;
vc_jab3 = sfx_vc_sarina_attack9;
vc_dashattack1 = sfx_nothing;
vc_dashattack2 = sfx_nothing;
vc_ftilt1 = sfx_vc_sarina_attack_ftilt1;
vc_ftilt2 = sfx_vc_sarina_attack_ftilt2;
vc_ftilt3 = sfx_vc_sarina_attack_ftilt3;
vc_dtilt1 = sfx_vc_sarina_action2;
vc_dtilt2 = sfx_nothing;
vc_utilt1 = sfx_nothing;
vc_utilt2 = sfx_nothing;
vc_uair1 = sfx_nothing;
vc_uair2 = sfx_nothing;
vc_dair1 = sfx_nothing;
vc_dair2 = sfx_nothing;
vc_fair1 = sfx_vc_takia_action1;
vc_fair2 = sfx_vc_takia_action2;
vc_bair1 = sfx_nothing;
vc_bair2 = sfx_nothing;
vc_nair1 = sfx_vc_takia_action1;
vc_nair2 = sfx_vc_takia_action1;
vc_fheavy1 = sfx_vc_sarina_attack9;
vc_fheavy2 = sfx_vc_sarina_attack2;
vc_dheavy1 = sfx_vc_sarina_attack9;
vc_dheavy2 = sfx_vc_sarina_attack2;
vc_uheavy1 = sfx_vc_sarina_attack9;
vc_uheavy2 = sfx_vc_sarina_attack2;
vc_uair1 = sfx_nothing;
vc_nspecial1 = sfx_nothing;
vc_nspecial2 = sfx_nothing;
vc_sspecial1 = sfx_vc_akuma_spinkick1;
vc_sspecial2 = sfx_vc_akuma_spinkick2;
vc_uspecial1 = sfx_vc_akuma_spinkick1;
vc_uspecial2 = sfx_vc_akuma_shoyu;
vc_dspecial1 = sfx_nothing;
vc_dspecial2 = sfx_nothing;
vc_grab = sfx_nothing;
#endregion
#region Voice actions - general
vc_jump1 = sfx_vc_sarina_action1;
vc_jump2 = sfx_vc_sarina_action1;
vc_doublejump1 = sfx_nothing;
vc_doublejump2 = sfx_nothing;
vc_walljump1 = sfx_nothing;
vc_walljump2 = sfx_nothing;
vc_parry1 = sfx_nothing;
vc_parry2 = sfx_nothing;
vc_parryland1 = sfx_nothing;
vc_parryland2 = sfx_nothing;
vc_ledgesnap1 = sfx_nothing;
vc_ledgesnap2 = sfx_nothing;
vc_dodgeroll1 = sfx_nothing;
vc_dodgeroll2 = sfx_nothing;
vc_airdodge1 = sfx_nothing;
vc_airdodge2 = sfx_nothing;
#endregion
#region Voice hurt - general
vc_hurt1 = sfx_nothing; //weak hit 1
vc_hurt2 = sfx_nothing; // weak hit 2
vc_hurt3 = sfx_nothing; //weak hit 3
vc_hurtbad1 = sfx_nothing;
vc_hurtbad2 = sfx_nothing;
vc_hurtbad3 = sfx_nothing;
vc_hurtbad4 = sfx_nothing;
vc_hurtbad5 = sfx_nothing;
vc_hurtbad1 = sfx_nothing;
vc_parried1 = sfx_nothing;
vc_parried2 = sfx_nothing;
vc_ko = sfx_vc_takia_ko1;
vc_ko2 = sfx_vc_takia_ko1;
vc_ko3 = sfx_vc_takia_ko1;
#endregion
#endregion
//Custom Step Event
custom_script= scr_sarina_custom();
custom_draw_script = scr_sarina_draw();
custom_step_script = scr_sarina_custom_stepevent();