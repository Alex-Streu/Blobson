///Standard_Hitstun
//Contains the standard actions for the hitstun state.
var run=true;
//Timer
hitstun_frame=max(--hitstun_frame,0);
#region Animation
if damage   <= 100  
{
	anim_sprite=my_sprites[?"Hitstun"];
	anim_frame=0;
	anim_speed=anim_speed_normal;
	}
if damage > 100  
{
	anim_speed=anim_speed_normal;
	anim_sprite=my_sprites[?"Hitstunheavy" ];
	}


#endregion
#region Friction / Gravity
if (!on_ground())
	{
	friction_gravity(air_friction,hitstun_grav,max_fall_speed);
	}
else
	{
	friction_gravity(ground_friction,hitstun_grav,max_fall_speed);
	}
#endregion
#region End Hitstun - Go to tumble
if (run && hitstun_frame==0)
	{
	//Go to tumble state, which can be canceled to return to normal
	set_state(PLAYER_STATE.in_tumble);
	run=false;
	}
#endregion
#region End Hitstun - Hard Landing
var _current_speed=point_distance(x,y,x+hsp,y+vsp);
if (run && on_ground() && vsp>=0 && _current_speed<=bounce_minimum_speed)
	{
	set_state(PLAYER_STATE.knockdown);
	//Chooses the larger value or remaining hitstun or the hard landing lag
	knockdown_frame=max(hitstun_frame,hard_landing_lag);
	run=false;
	}
#endregion
#region FX
//If you are launched hard enough, create ring effects
if (run && hitstun_frame % 8 == 0 && _current_speed > 10)
	{
	var _fx = create_fx
		(
		spr_hit_fx_ring,
		1,
		0,
		17,
		x,
		y,
		(_current_speed + (hitstun_frame / 50)) / 10,
		point_direction(0,0,hsp,vsp),
		"FX_Layer_Below"
		);
	_fx.image_blend = palette_get_color(palettes[player_color],0);
	}
#endregion
//If you transition to the lag state (hit into the ground), you can't fall of edges or bounce
if (state!=PLAYER_STATE.knockdown)
	{
	move_bounce_();
	}
else
	{
	move_grounded_();
	}