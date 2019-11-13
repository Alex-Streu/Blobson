///Initializes Player variables
//Check the character scripts for more variables!
//Character
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

if instance_exists(obj_crushrush) {stock = 1;}
if !instance_exists(obj_crushrush) {stock = 3;}
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