///@func hit_fx_style_create(fx_style,angle,target,knockback,[layer])
///@param fx_style
///@param angle
///@param target
///@param knockback
///@param [layer]
var _style = argument[0],
	_angle = argument[1],
	_hit = argument[2],
	_knock = argument[3],
	_layer = argument_count > 4 ? argument[4] : "FX_Layer";
	
switch(_style)
	{
	#region Normal Weak
	case HIT_FX.normal_weak:
		//Direction Burst
		var _fx = fx_create(spr_hit_fx_direction_burst, 1, 0, 13, _hit.x, _hit.y, 1, _angle, _layer);
		_fx.image_xscale *= choose(-1, 1);

		//With the target
		with(_hit)
			{
			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x + (sprite_get_width(anim_sprite) / 2), y + (sprite_get_height(anim_sprite) / 2), global.p1, max(_knock / 5, 10));
			
			//Powerful Knockback
			if (_knock > 16)
				{
				//Make more effects
				fx_create(spr_hit_fx_screen_lines, 0, 0, 15, x, y, 2, 0, _layer);
				}
			}

		//Camera shake
		camera_shake(_knock div 2);
		
		//Hit fade
		_hit.fade_value = 0.3;
		break;
	#endregion
	#region Normal Strong
	case HIT_FX.normal_strong:
		//Direction Burst
		fx_create(spr_hit_fx_strong_initial_hit, 1, 0, 4, mean(owner.x, _hit.x), mean(owner.y, _hit.y), 1.5, irandom(360), _layer);
		var _fx1 = fx_create(spr_hit_fx_direction_burst, 1, 0, 13, _hit.x, _hit.y, 1, _angle, _layer);
		_fx1.image_xscale *= choose(-1, 1);
		var _fx2 = fx_create(spr_hit_fx_strong_hit, 1, 0, 10, _hit.x, _hit.y, 3, _angle, _layer);
		_fx2.image_xscale *= choose(-1, 1);
		
		//With the target
		with(_hit)
			{
			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x + (sprite_get_width(anim_sprite) / 2), y + (sprite_get_height(anim_sprite) / 2), global.p1, max(_knock / 5, 10));
			
			//Powerful Knockback
			if (_knock > 15)
				{
				//Make more effects
				fx_create(spr_hit_fx_screen_lines, 0, 0, 15, x, y, 2, 0, _layer);
				fx_create(spr_hit_fx_strong_lightning, 1, 0, 7, x, y, 2, _angle, _layer);
				fx_create(spr_hit_fx_circle, 1, 0, 17, x, y, 1, irandom(360), _layer);
				}
			}
			
		//Camera shake
		camera_shake(_knock div 2);
		
		//Hit fade
		_hit.fade_value = 0.4;
		break;
	#endregion
	#region Grab
	case HIT_FX.grab:
		//With the target
		with(_hit)
			{
			//Particle Effects
			part_type_direction(global.p1, 0, 360, 0, 0);
			part_type_speed(global.p1, 3, 6, 0, 0);
			part_particles_create(global.part_sys, x + (sprite_get_width(anim_sprite) / 2), y + (sprite_get_height(anim_sprite) / 2), global.p1, 15);
			}

		//Camera shake
		var _shake = (2 + ((_hit.damage / 20) * _hit.weight_multiplier) div 2);
		camera_shake(_shake);
		break;
	#endregion
	#region Explosion
	case HIT_FX.explosion:
		//Directional Burst
		var _fx2 = fx_create(spr_hit_fx_strong_hit, 1, 0, 10, _hit.x, _hit.y, 3, _angle, _layer);
		_fx2.image_xscale *= choose(-1, 1);
		
		//With the target
		with(_hit)
			{
			//Particle Effects
			part_type_direction(global.p1, 0, 360, 0, 0);
			part_type_speed(global.p1, 3, 6, 0, 0);
			part_particles_create(global.part_sys, x + (sprite_get_width(anim_sprite) / 2), y + (sprite_get_height(anim_sprite) / 2), global.p1, 15);
			fx_create(spr_hit_fx_strong_lightning, 1, 0, 7, x, y, 2, _angle, _layer);
			fx_create(spr_hit_fx_circle, 1, 0, 17, x, y, 1, irandom(360), _layer);
			}

		//Camera shake
		camera_shake(clamp(_knock div 1.8, 1, 15));
		break;
	#endregion
	
	#region Shield
	case HIT_FX.shield:
		//Hit effects
		fx_create(spr_hit_fx_shield, 1, 0, 11, mean(owner.x, _hit.x), mean(owner.y, _hit.y), 1, irandom(360));
		break;
	#endregion
	}