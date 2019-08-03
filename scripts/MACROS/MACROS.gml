///MACROS
#region Game Constants
#macro debug				false
#macro show_hitboxes		true
#macro show_hurtboxes		false
#macro show_collision_boxes	false

//Max Number of Players
#macro max_players 8

//Game Types
#macro airdodge_type 0
#macro shield_type 1
#macro walljump_type 1

//Camera
#macro camera_width 1280 //1280
#macro camera_height 720 //720
#macro camera_boundary 120

//Player status
#macro player_status_padding_bottom 54

//Game surface
#macro game_surface_enable false
#macro day_night_cycle_enable false //requires the game surface

//Special Zoom
#macro camera_enable_zoom false
#macro camera_zoom_width 480
#macro camera_zoom_height 272

//Backgrounds
#macro back_clear -1

//Savefiles
#macro profiles_save "Player_Profiles.sav"
#endregion
#region Player Macros
	#region Control Stick + Input
	//Number of gamepads supported
	#macro number_of_devices 14
	//Input thresholds
	#macro stick_check_frames 3	//To check the stick speed, there has to be a value a certain number of frames before to compare with
	#macro menu_navigation_lag 15

	//Control stick general
	#macro Lstick 0
	#macro Rstick 1
	#macro stick_tilt_amount 0.4
	#macro stick_flick_speed 0.7
	#macro stick_flick_amount 0.8
	#macro stick_flick_buff 6
	#macro stick_direction_sensitivity 67.5//22.5	//65 //45-90
	#macro stick_vertical_zone_sensitivity 67.5
	
	//Right stick
	#macro rstick_tilt_amount 0.4
	#macro rstick_flick_speed 0.3
	#macro rstick_flick_amount 0.7

	#endregion
	#region Attacking
	
	//Knockback
	#macro knockback_scaling_multiplier 0.12
	
	//Hitstun / Hitlag
	#macro hitstun_multiplier 0.85 //0.85
	#macro hitstun_base_multiplier 4 //4
	#macro hitstun_weight_multiplier 0.6
	#macro hitstun_damage_multiplier 0.24 //0.24
	#macro hitstun_knockback_multiplier 4
	#macro hitlag_multiplier 1 //0.7
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
	#macro magnetbox_snap_speed 10
	
	//Grabbing
	#macro base_grab_time 30
	#macro grab_time_multiplier 0.7
	#macro grab_snap_speed 70 //20
	
	//Grab releases
	#macro grab_release_hsp 4
	#macro grab_release_vsp -8
	#macro grab_release_hitstun 20
	#macro grab_release_damage 3
	
	#endregion
	#region Collisions
	
	//Platform Collision checking type
	#macro platform_check_type 1
	
	//Platform snap threshold
	#macro platform_snap_threshold 24//Allows characters to snap to platforms with a waveland
	
	//Bouncing
	#macro bounce_minimum_speed 12//characters only bounce while in hitstun if they have enough speed
	#macro bounce_speed_multiplier 0.6 //0.6
	
	#endregion
	#region General
	
	//Custom Controls
	#macro number_of_buttons 13

	//Input buffer length
	#macro buff 6
	#macro max_buffer_length 20
	#macro tech_buffer_time 20
	#macro tech_lockout_time 40
	#macro tap buff-1

	//Dashing
	#macro dash_buffer 4 //After the player enters the walk state, there are this many frames to transition to dash
	
	//Shielding
	#macro shield_perfect_frame 6
	#macro shield_perfect_invincibility_frame 10
	#macro shield_min_time 3
	#macro shield_into_wavedash true //QoL; allows you to wavedash out of shield startup frames
	#macro shield_break_base_time 300
	#macro shield_break_multiplier 0.2
	
	//Parrying
	#macro parry_grabs true
	#macro parry_default_stun_time 60
	#macro parry_hitlag 15
	#macro parry_invincible_time 30
	#macro parry_reflect_speed_multiplier 1.5
	
	//Ledges
	#macro ledge_grab_timeout_standard 60
	#macro ledge_snap_speed 14
	#macro ledge_grab_distance 28 //24
	#macro ledge_snap_time 4
	#macro ledge_hang_min_time 10
	#macro ledge_hang_max_time 180
	#macro ledge_invincible_time 60
	#macro ledge_tether_snap_speed 15
	#macro ledge_tether_snap_time 20

	//Knockouts
	#macro ko_base_time 90
	#macro max_respawn_platform_time 300
	#macro respawning_invulnerable_time 90
	
	//Hitbox drawing
	#macro hitbox_draw_color c_red
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
	
	#endregion
#endregion
#region Utility
#macro TIMER_BEGIN \
if (!variable_global_exists("timerstack")) {\
	global.timerstack = ds_stack_create();\
}\
ds_stack_push(global.timerstack,get_timer())
#macro TIMER_END \
show_debug_message("Time: " + string((get_timer() - ds_stack_pop(global.timerstack)) / 1000))
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
	move,
	none,
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
	}
//Enum for invulnerability
enum INV
	{
	type_normal,
	type_invincible,
	type_superarmor,
	type_shielding,
	type_parry,
	type_counter,
	}
//Enums for hitbox properties
enum HITBOX
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
	snd_hit
	}
enum HITBOX_SHAPE
	{
	rectangle,
	circle,
	rotation,
	sprite,
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
enum FX
	{
	}
#endregion
//--> Game_Init
//--> Player_Init