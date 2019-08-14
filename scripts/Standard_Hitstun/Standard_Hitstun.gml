///Standard_Hitstun
//Contains the standard actions for the hitstun state.
var run = true;
//Timer
hitstun_frame = max(--hitstun_frame, 0);
#region Animation
anim_sprite = my_sprites[?"Hitstun"];
anim_speed = ani_speed_hitstun;
#endregion
#region Friction / Gravity
if (!on_ground())
	{
	friction_gravity(air_friction, hitstun_grav, max_fall_speed);
	}
else
	{
	friction_gravity(ground_friction, hitstun_grav, max_fall_speed);
	}
#endregion
#region End Hitstun - Go to tumble
if (run && hitstun_frame == 0)
	{
	//Go to tumble state, which can be canceled to return to normal
	set_state(PLAYER_STATE.in_tumble);
	run = false;
	}
#endregion
#region End Hitstun - Hard Landing
var _current_speed = point_distance(x, y, x + hsp, y + vsp);
if (run && on_ground() && vsp >= 0 && _current_speed <= bounce_minimum_speed)
	{
	set_state(PLAYER_STATE.knockdown);
	//Chooses the larger value or remaining hitstun or the hard landing lag
	knockdown_frame = max(hitstun_frame, hard_landing_lag);
	run = false;
	}
#endregion
#region FX
//If you are launched hard enough, create ring effects
if (run && hitstun_frame % 8 == 0 && _current_speed > 10)
	{
	var _fx = fx_create
		(
		spr_hit_fx_ring,
		1,
		0,
		17,
		x,
		y,
		(_current_speed + (hitstun_frame / 50)) / 10,
		point_direction(0, 0, hsp, vsp),
		"FX_Layer_Below"
		);
	_fx.image_blend = palette_get_color(palettes[player_color], 0);
	}
//Cloud trails
if (run && knockback_cloud_trails_enable)
	{
	var _scale = clamp((_current_speed + (hitstun_frame / 50)) / 10, 1, 2);
	var _cloud = instance_create_layer(x, y, "FX_Layer_Below", obj_dust_cloud);
	with(_cloud)
		{
		fx_index = choose(spr_dust_cloud,spr_dust_cloud1);
		fx_speed = 1;
		fx_frame = 0;
		lifespan = 17;
		fx_xs = _scale;
		fx_ys = _scale;
		fx_ang = point_direction(0, 0, other.hsp, other.vsp) + random_range(-5, 5);
		total_life = lifespan;
		var _dir = irandom(360); //fx_ang - 180 + random_range(-15, 15);
		var _spd = random_range(0, _scale * 2);
		hsp = lengthdir_x(_spd, _dir);
		vsp = lengthdir_y(_spd, _dir);
		var _color = palette_get_color(other.palettes[other.player_color], 0);
		color =
			[
			color_get_red(_color) / 255,
			color_get_green(_color) / 255,
			color_get_blue(_color) / 255,
			];
		}
	}
#endregion
//If you transition to the lag state (hit into the ground), you can't fall of edges or bounce
if (state != PLAYER_STATE.knockdown)
	{
	move_bounce_();
	}
else
	{
	move_grounded_();
	}