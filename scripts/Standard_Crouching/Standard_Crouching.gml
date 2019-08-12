///Standard_Crouching
//Contains the standard actions for the crouching state.
var run = true;
#region Animation
anim_sprite=my_sprites[?"Crouch"];
anim_speed=anim_speed_normal;
hurtbox.sprite_index = hurtbox_crouch_sprite;
hurtbox.image_index = anim_frame;
hurtbox.image_speed = 0;
hurtbox.image_xscale = 1;
hurtbox.image_yscale = 1;
hurtbox.image_angle = 0;
#endregion
#region Friction / Gravity
friction_gravity(crouch_friction,grav,max_fall_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run = false;
#endregion
#region Cancel into normal grounded states
//If the control stick is not down
if (run && !stick_tilted(Lstick,DIR.down))
	{
	#region Dashing
	if run && check_dash() run = false;
	#endregion
	#region Walking
	if run && check_walk() run = false;
	#endregion
	#region Idle
	if (run)
		{
		//Change the state to idle and exit the script.
		set_state(PLAYER_STATE.idle);
		run = false;
		}
	#endregion
	}
#endregion
#region Shielding
if run && check_shield() run = false;
#endregion
#region Jumping
//Standard jump. Goes into jumpsquat first.
if run && check_jump() 
	{
	run = false;
	if (scs_crouch_jump)
		{
		jump_is_shorthop=true;
		}
	}
#endregion
#region Rolling
if run && check_rolling() run = false;
#endregion
#region Drop Throughs
if run && check_drop_through() run = false;
#endregion
#region Attacking
if run && check_smashes() run = false;
if run && check_grounds() run = false;
if run && check_specials() run = false;
if run && check_grab() run = false;
#endregion
move_();

//Change hitbox back
if (!run)
	{
	hurtbox_reset();
	}