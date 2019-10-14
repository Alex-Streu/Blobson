///MACROS
#macro version "Beta 0.2.0"
#region Game Constants
#macro debug				false
#macro show_hitboxes		true
#macro show_hurtboxes		false
#macro show_collision_boxes	false

//Max Number of Players
#macro max_players 4

//Game Types
#macro airdodge_type	AIRDODGE.melee
#macro shield_type		SHIELD.rivals
#macro walljump_type	WALLJUMP.rivals

//Camera
#macro camera_width 960 //960
#macro camera_height 540 //540
#macro camera_boundary 256 //120
#macro camera_move_speed 0.15

//Camera Zoom
#macro camera_enable_zoom false
#macro camera_ratio (camera_width / camera_height)
#macro camera_zoom_pad_scale 2
#macro camera_zoom_pad_yscale 0.1
#macro camera_zoom_pad_xscale 0.0
#macro camera_max_width room_width
#macro camera_max_height (room_width / camera_ratio)
#macro camera_min_width 720
#macro camera_min_height 405
#macro camera_zoom_speed 0.03 //0.05

//Finishing Blow Zoom
#macro camera_enable_special_zoom false
#macro camera_special_zoom_width 480
#macro camera_special_zoom_height 270

//Player status
#macro player_status_padding_bottom 54

//Game surface
#macro game_surface_enable false
#macro daynight_cycle_enable false //requires the game surface

//Backgrounds
#macro back_clear -1

//Savefiles
#macro profiles_save "Player_Profiles.sav"

//Countdown Time
#macro count_time 60

//VFX
#macro knockback_cloud_trails_enable true
#endregion
#region Player Macros
	#region Control Stick + Input
	//Number of gamepads supported
	#macro number_of_devices 14
	//Input thresholds
	#macro stick_check_frames 3	//To check the stick speed, there has to be a value a certain number of frames before to compare with

	//Control stick general
	#macro Lstick 0
	#macro Rstick 1
	#macro stick_tilt_amount 0.4
	#macro stick_flick_speed 0.55
	#macro stick_flick_amount 0.8
	#macro stick_flick_buff 6
	#macro stick_direction_sensitivity 65//67.5
	
	//Right stick
	#macro rstick_tilt_amount 0.4
	#macro rstick_flick_speed 0.4
	#macro rstick_flick_amount 0.7

	#endregion
	#region Attacking
	
	//Knockback
	#macro knockback_scaling_multiplier 0.12
	
	//Hitstun / Hitlag
	#macro hitstun_multiplier 1 //0.85
	#macro hitstun_base_multiplier 5 //4
	#macro hitstun_weight_multiplier 1
	#macro hitstun_damage_multiplier 0.2 //0.24
	#macro hitstun_knockback_multiplier 6//5
	#macro hitlag_multiplier 1 //0.6
	#macro maximum_hitlag 120
	#macro default_shieldstun_multiplier 4
	#macro base_shieldstun 5
	
	//Crouch cancel
	#macro crouch_cancel_multiplier 0.65
	
	//Damage
	#macro max_damage 999
	
	//DI
	#macro default_knockback_angle 90
	#macro ASDI 4
	#macro DI_Max 15
	#macro drift_DI_accel 0.2
	#macro drift_DI_max 2
	
	//Sakurai angle
	#macro s_angle_knockback_threshold 10
	#macro s_angle_low_angle 0
	#macro s_angle_high_angle 40
	#macro s_angle_aerial_angle 45
	
	//Landing
	#macro hard_landing_lag 20
	#macro default_attack_landing_lag 6
	
	//Hitboxes
	#macro hitbox_groups 4
	
	//Smash Attack
	#macro smash_attack_max_charge 100
	#macro smash_attack_multiplier 0.8
	
	//Hitlag Increasing for super strong hits
	#macro finishing_blow_hitlag_increase 50
	
	//Hit turnaround
	/*Makes it so players face whoever hits them*/
	#macro hit_turnaround true
	
	//Magnetboxes
	#macro magnetbox_snap_speed 30
	
	//Grabbing
	#macro base_grab_time 30
	#macro grab_time_multiplier 0.7
	#macro grab_snap_speed 30
	#macro throw_flick_buff 20
	
	//Grab releases
	#macro grab_release_hsp 4
	#macro grab_release_vsp -8
	#macro grab_release_hitstun 20
	#macro grab_release_damage 3
	
	//Sounds
	#macro hit_sound_default snd_hit_weak
	#macro hit_sound_pitch_variance 0.2
	
	#endregion
	
	#region Collisions
	
	//Platform Collision checking type
	#macro platform_check_type 1
	
	//Platform snap threshold
	#macro platform_snap_threshold 24//Allows characters to snap to platforms with a waveland
	
	//Bouncing
	#macro bounce_minimum_speed 12//characters only bounce while in hitstun if they have enough speed
	#macro bounce_speed_multiplier 1//0.6
	
	#endregion
	
	#region General
	
	//Custom Controls
	#macro number_of_buttons 12

	//Input buffer length
	#macro buff 10
	#macro max_buffer_length 60
	#macro tech_buffer_time 20
	#macro tech_lockout_time 40
	#macro tap (buff - 1)

	//Dashing
	#macro dash_buffer 3 //After the player enters the walk state, there are this many frames to transition to dash. default is 4
	
	//Shielding
	#macro shield_perfect_frame 6
	#macro shield_perfect_invincibility_frame 10
	#macro shield_min_time 3
	#macro shield_into_wavedash true //QoL; allows you to wavedash out of shield startup frames
	#macro shield_break_base_time 300
	#macro shield_break_multiplier 0.2
	#macro shield_plat_drop_speed 0.3
	#macro shield_plat_drop_amount 0.7
	
	//Parrying
	#macro parry_grabs true
	#macro parry_default_stun_time 90
	#macro parry_hitlag 15
	#macro parry_invincible_time 30
	#macro parry_reflect_speed_multiplier 1.5
	
	//Ledges
	#macro ledge_grab_timeout_standard 60
	#macro ledge_snap_speed 16
	#macro ledge_grab_distance 28 //24
	#macro ledge_snap_time 3
	#macro ledge_hang_min_time 10
	#macro ledge_hang_max_time 180
	#macro ledge_invincible_time 60
	#macro ledge_tether_snap_speed 15
	#macro ledge_tether_snap_time 20
	#macro ledge_trump_enable true
	#macro ledge_trump_stun_time 25
	#macro ledge_trump_hsp -6
	#macro ledge_trump_vsp -11
	
	//Wall Jumps
	#macro wall_cling_max_time 60
	#macro wall_cling_normal_timeout 120
	#macro wall_jump_normal_timeout 15

	//Knockouts
	#macro ko_base_time 90
	#macro max_respawn_platform_time 300
	#macro respawning_invulnerable_time 90
	
	//Hitbox drawing
	#macro melee_draw_color c_red
	#macro magnetbox_draw_color c_blue
	#macro projectile_draw_color c_yellow
	#macro hurtbox_draw_color c_lime
	#macro collision_box_draw_color c_purple
	#macro grab_draw_color c_blue
	#macro hitbox_draw_angle_multiplier 8
	
	//Animation
	#macro anim_multiplier 0.3
	#macro anim_speed_normal 1
	#macro fade_max 15
	
	//Camera Shake
	#macro death_cam_shake 15
	
	//Events
	#macro event_step	ev_user0
	#macro event_paused ev_user1
	#macro event_draw	ev_user2
	
	#endregion
#endregion
#region Utility
#macro TIMER_BEGIN \
if (!variable_global_exists("timerstack")) {\
	global.timerstack = ds_stack_create();\
}\
ds_stack_push(global.timerstack,get_timer());
#macro TIMER_END \
show_debug_message("Time: " + string((get_timer() - ds_stack_pop(global.timerstack))));// / 1000))
#endregion
#region Enums
enum GAME_STATE
	{
	startup,
	normal,
	paused,
	ending,
	}
//State Machine for Players
enum PLAYER_STATE
	{
	idle,
	crouching,
	walking,
	walk_turnaround,
	dashing,
	running,
	run_turnaround,
	run_stop,
	jumpsquat,
	aerial,
	airdodging,
	wavelanding,
	rolling,
	spot_dodging,
	shielding,
	shield_break,
	parrying,
	parry_stun,
	in_hitlag,
	in_hitstun,
	in_tumble,
	helpless,
	magnetized,
	in_flinch,
	in_lag,
	knockdown,
	techrolling,
	teching,
	ledge_snap,
	ledge_hang,
	ledge_attack,
	ledge_getup,
	ledge_roll,
	ledge_jump,
	ledge_tether,
	ledge_trump,
	wall_cling,
	wall_jump,
	knocked_out,
	respawning,
	attacking,
	grabbing,
	is_grabbed,
	pummeling,
	in_grab_release,
	lost,
	entrance,
	}
//Enum for buttons
enum INPUT
	{
	attack,
	special,
	jump,
	shield,
	grab,
	smash,
	taunt,
	pause,
	none,
	length,
	}
//Enum for directions
enum DIR
	{
	//Cardinal
	right,
	left,
	up,
	down,
	//Diagonal
	up_right,
	up_left,
	down_right,
	down_left,
	//Axis
	horizontal,
	vertical,
	any,
	none,
	}
//Enum for invulnerability
enum INV
	{
	normal,
	invincible,
	superarmor,
	shielding,
	parry,
	counter,
	}
//Enum for air dodge type
enum AIRDODGE
	{
	melee,
	smash4,
	ultimate,
	}
//Enum for wall jump type
enum WALLJUMP
	{
	rivals,
	smash,
	}
//Enum for shield
enum SHIELD
	{
	melee,
	ultimate,
	rivals,
	}
//Enums for hitbox properties
enum HITBOX_PROPERTY
	{
	shape,
	sprite_angle,
	lifetime,
	owner,
	overlay_sprite,
	overlay_frame,
	overlay_speed,
	has_hit,
	knockback_state,
	base_hitlag,
	priority,
	angle,
	grounded_angle,
	hit_fx_style,
	hit_sfx,
	EX_meter,
	}
enum HITBOX_SHAPE
	{
	rectangle = -1,
	circle = -2,
	rotation = -3,
	}
//Enum for angle flippers --> apply_angle_flipper()
enum FLIPPER
	{
	fixed,
	standard,
	from_player_center,
	toward_player_center,
	from_player_center_horizontal,
	toward_player_center_horizontal,
	from_hitbox_center,
	toward_hitbox_center,
	from_hitbox_center_horizontal,
	toward_hitbox_center_horizontal,
	sakurai,
	sakurai_reverse,
	}
//Enum for special attack script calls
enum PHASE
	{
	init = -1,
	start = -2,
	stop = -3,
	interrupt = -4,
	on_hit = -5,
	
	parry = -6,
	}
//Enum for background layers
enum BACK
	{
	sprite,
	x,
	y,
	scale,
	parallax_x,
	parallax_y,
	xspd,
	yspd,
	length,
	}
//Enum for profile settings
enum PROFILE
	{
	name,
	wins,
	games_played,
	custom_controls,
	favorite_skins,
	color,
	}
//Enum for on-hit effects
enum HIT_FX
	{
	//Hit FX
	normal_weak,
	normal_strong,
	grab,
	lightning_strong,
	explosion,
	shield,
	hit1,
	hit2,
	//Enum end
	length,
	}
//Enum for AI types
enum AI_TYPE
	{
	idle,
	rush,
	}
//Enum for player data
enum PLAYER_DATA
{
	character,
	color,
	profile,
	controller,
	render,
	palettes,
	victory_theme
	}
//Enum for control stick
enum CONTROL_STICK
	{
	xval,
	yval,
	dir,
	spd,
	dist,
	}
//Enum for replay data categories
enum REPLAY_DATA_TYPE
	{
	meta,
	player,
	none,
	}
//Enum for player numbers
enum PLAYER
{
	P1 = 0,
	P2 = 1,
	P3 = 2,
	P4 = 3,
	P5 = 4,
	P6 = 5,
	P7 = 6,
	P8 = 7
}
#endregion
//--> Game_Init
//--> Player_Init