/// @description Insert description here
// You can write your code in this editor
hurtbox_sprite=spr_sarina_hurtbox;
hurtbox=create_hurtbox(hurtbox_sprite);

//invulnerable_type = INV.normal

#region Weight and Gravity
//Weight
weight_multiplier=1.3;
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
		wall_jump_startup = 10;
		wall_jump_time = 7;
		wall_jump_hsp = 7;
		wall_jump_vsp = -13;
		max_wall_jumps = 1;
		can_wall_cling = false;
		}
	default: break;
	}
#endregion
#region Aerial Movment
//Air control
air_accel=0.5;
max_air_speed=5;
max_air_speed_dash = 7;
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
dash_speed=8;
dash_time=8;
dash_accel=4;
//Running
run_speed=18;
run_accel=0.3;
run_turn_time=10;
run_turn_accel=0.8;
run_stop_time=8;
//Rolling
roll_speed=11;
roll_startup=3;
roll_active=20;
roll_endlag=14;
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
ledge_hang_relative_x=-30;
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


character = 0;
state = PLAYER_STATE.entrance;
player_number = 0;
player_color = 0;
name = "";
//State timers, phases, and other variables
jumpsquat_frame = 0;
jump_is_shorthop = false;
jump_buffer_aerial = false;
jump_is_tap_jump = false;
jump_is_midair_jump = false;
jump_is_dash_jump = false;
can_fastfall = true;
walk_turnaround_frame = 0;
walk_turnaround_direction = 1;
walk_to_dash_frame = 0;
dash_frame = 0;
run_turnaround_frame = 0;
run_turnaround_direction = 1;
run_stop_frame = 0;
double_jumps = 1;
air_dodge_frame = 0;
air_dodge_phase = 0;
air_dodges = 1;
waveland_frame = 0;
shield_frame = 0;
shield_break_frame = 0;
shield_shift_x = 0;
shield_shift_y = 0;
parry_frame = 0;
parry_phase = 0;
parry_stun_frame = 0;
parry_stun_time = parry_default_stun_time;
can_be_parried = true;
has_been_parried = false;
rolling_frame = 0;
rolling_phase = 0;
rolling_direction = 0;
spot_dodge_frame = 0;
spot_dodge_phase = 0;
invulnerable_type = INV.normal;
invulnerable_frame = 0;
invulnerable_override = true;
hitlag_frame = 0;
hitstun_frame = 0;
flinch_frame = 0;
lag_frame = 0;
knockdown_frame = 0;
magnet_frame = 0;
magnet_goal_x = 0;
magnet_goal_y = 0;
techrolling_frame = 0;
techrolling_phase = 0;
techrolling_direction = 0;
tech_buffer = tech_lockout_time;
teching_frame = 0;
teching_phase = 0;
ledge_id = 0;
ledge_grab_timeout = 0;
ledge_snap_frame = 0;
ledge_hang_frame = 0;
ledge_getup_frame = 0;
ledge_jump_frame = 0;
ledge_roll_frame = 0;
ledge_attack_frame = 0;
ledge_tether_frame = 0;
ledge_trump_frame = 0;
wall_cling_frame = 0;
wall_cling_timeout = 0;
wall_jump_frame = 0;
wall_jump_timeout = 0;
wall_jump_phase = 0;
wall_jumps = 0;
ko_frame = 0;
respawn_frame = 0;
self_hitlag_frame = 0;
attack_script = -1;
attack_draw_script = -1;
attack_frame = 0;
attack_phase = 0;
charge = 0;
landing_lag = 0;
grab_frame = 0;
grab_release_frame = 0;
grab_hold_x = 0;
grab_hold_y = 0;
grab_hold_id = noone;
grabbed_id = 0;
//Controller cached values
uses_keyboard = false;
cc = [];
controller = -1;
control_states_l = [];
control_states_r = [];
control_tilted_l = 0;
control_tilted_r = 0;
control_flicked_l = 0;
control_flicked_r = 0;
//Fill array for stick buffer
for(var m = 0; m < max_buffer_length; m++)
	{
	//Add in a new entry
	var _new = [];
	_new[@ CONTROL_STICK.xval] = 0;
	_new[@ CONTROL_STICK.yval] = 0;
	_new[@ CONTROL_STICK.dir] = 90;
	_new[@ CONTROL_STICK.dist] = 0;
	_new[@ CONTROL_STICK.spd] = 0;
	control_states_l[m] = _new;
	control_states_r[m] = _new;
	}
//Special control settings
scs_crouch_jump = false;
scs_short_hop_aerial = false;
scs_tap_jump = false;
scs_diagonal_stick_nair = false;
scs_AB_smash = false;
//Make a ds_list to store the last few frames of input (input buffer)
input_buffer = ds_list_create();
for(var i = 0; i < number_of_buttons * 2; i++)//Multiply by 2 for press / hold
	{
	input_buffer[| i] = max_buffer_length;
	}
//Speeds
hsp = 0;
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;
facing = 1; //which direction you're facing
//Damage / Knockback
damage = 0;
kdir = 0;
kspd = 0;
stored_hitstun = 0;
stored_state = PLAYER_STATE.in_hitstun;
ko_property = id; //Determines SD's / normal KO's
stock = 3;
any_hitbox_has_hit = false;
can_hitfall = true;
//My Hitboxes List - Keeps track of all of the user's hitboxes
my_hitboxes = ds_list_create();
//Hitbox Groups - Each group has an array that stores what has been hit
//Two hitboxes in the same group cannot hit the same target
//Prevents multi-hitbox moves from dealing massive damage
collided = ds_list_create();
//Makes a ds_list in each index of the collided list
for(var i = 0; i < hitbox_groups; i++)
	{
	collided[| i] = ds_list_create();
	}
//Animation
anim_sprite = -1;
anim_speed = 0;
anim_frame = 0;
fade_value = 1;
damage_text_random = 0;
damage_text_x = 0;
damage_text_y = 0;
//The state log is for debug use.
//It keeps track of the states the object has been in.
state_log = ds_list_create();
ds_list_add(state_log, state);
//Attacks and sprites
my_attacks = ds_map_create();
my_sprites = ds_map_create();
//Color palettes
uni_l = shader_get_uniform(shd_player, "light_value");
uni_a = shader_get_uniform(shd_player, "alpha_value");
uni_f = shader_get_uniform(shd_player, "fade_value");
uni_s = shader_get_uniform(shd_player, "sample");
uni_r = shader_get_uniform(shd_player, "replace");