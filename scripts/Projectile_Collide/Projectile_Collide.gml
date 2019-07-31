///@func Projectile_Collide(id)
///@param id
//All of the actions that happen when a projectile comes into contact with a player
//Exit out early if it is the owner
var _hurtbox=argument[0];
var _hit=_hurtbox.player;
if (_hit==noone || _hit==owner) return;
//Mark the hitbox as having hit something
has_hit=true;
//THe hitbox group list is unique to the projectile, not the player
var _col_list=collided;
//Check the id's
//The hitbox cannot hit someone who has already been hit.
//Now loop through the collided list to ensure the target has not been hit already
for(var i=0;i<ds_list_size(_col_list);i++)
	{
	//If the target had been hit before, the whole script ends
	if (_hit==_col_list[| i])
		{
		return;
		}
	}
//Check invulnerability
switch(_hit.invulnerable_type)
	{
	case INV.type_normal:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Knockback and damage
		_hit.damage+=damage;
		_hit.damage_text_random=damage;
		//Hitstun stored for later use when the hitlag ends
		_hit.stored_hitstun=calculate_hitstun(base_knockback,_hit.weight_multiplier,damage,knockback_scaling,hitstun_multiplier);
		//Change state
		with(_hit) 
			{
			set_state(PLAYER_STATE.in_hitlag);
			}
		//Placeholder angle (in case the knockback is zero)
		var _calc_angle=angle;
		//Knockback is applied, unless there is zero knockback
		var _total_kb=0,_total_hl=0;
		if (base_knockback!=0)
			{
			with(_hit)
				{
				//Knockback and hitlag
				_total_kb=calculate_knockback(damage,other.damage,weight_multiplier,other.knockback_scaling,other.base_knockback);
				_total_hl=calculate_hitlag(other.base_hitlag);
				//Calculate angle based on flipper
				var _calc_angle=apply_angle_flipper(other.angle,other.angle_flipper,other,_hit,_total_kb);
				//Finishing blow adds more hitlag
				if (is_finishing_blow(_total_kb,_hit.x,_hit.y,_calc_angle,_hit.stored_hitstun,_hit))
					{
					_total_hl+=finishing_blow_hitlag_increase;
					background_clear_activate(_total_hl,palette_get_color(other.owner.palettes[other.owner.player_color],0));
					}
				apply_knockback(_calc_angle,_total_kb,_total_hl);
				//Turn to face the attacker
				if (hit_turnaround)
					{
					if (x!=other.owner.x)
						{
						facing=sign(other.owner.x-x);
						}
					}
				}
			}
		//Projectiles do not give any hitlag to the owner
		//Visuals
		part_type_direction(global.p1,_calc_angle-15,_calc_angle+15,0,0); //Change the particle direction
		part_type_speed(global.p1,max(7,base_knockback),max(10,base_knockback+3),0,0);
		create_fx(spr_hit_fx_explosion,1,0,18,mean(x,_hit.x),mean(y,_hit.y),3,irandom(360));
		create_fx(spr_hit_fx_direction,0.4,0,9,_hit.x,_hit.y,1.3,_calc_angle);
		create_fx(spr_hit_fx_direction_large,0,irandom(sprite_get_number(spr_hit_fx_direction_large)),15,_hit.x,_hit.y,1,_calc_angle);
		//With the target
		with(_hit)
			{
			//Make hit fx particles
			part_particles_create(global.part_sys,x+(sprite_get_width(anim_sprite)/2),y+(sprite_get_height(anim_sprite)/2),global.p1,max(other.base_knockback div 5,10));
			//If the knockback is strong enough
			if (_total_kb>15)
				{
				//Make more effects!
				with(other)
					{
					create_fx(spr_hit_fx_lines,0,0,15,mean(x,_hit.x),mean(y,_hit.y),1,irandom(360));
					}
				}
			}
		//Camera shake!
		var _shake=(calculate_knockback(_hit.damage,damage,_hit.weight_multiplier,knockback_scaling,base_knockback) div 2);
		camera_shake(_shake);
		fade_value=0.5;
		//Normal Hit fade
		_hit.fade_value=0;
		//Final Hit fade
		if (is_finishing_blow(_total_kb,_hit.x,_hit.y,_calc_angle,_hit.stored_hitstun,_hit))
			{
			background_clear_activate(_total_hl,palette_get_color(owner.palettes[owner.player_color],0));
			}
		//Projectiles destroy on contact
		destroy=true;
		break;
		}
	case INV.type_invincible:
		{
		//No knockback or damage or hitlag
		//Do not add the player to the collided list
		//This is because the opponent should be hit even if their invincibility runs out mid-attack
		break;
		}
	case INV.type_superarmor:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Just damage; no state change
		_hit.damage+=damage;
		_hit.damage_text_random=damage;
		//Hitlag
		_hit.self_hitlag_frame=calculate_hitlag(base_hitlag);
		//Projectiles destroy on contact
		destroy=true;
		break;
		}
	case INV.type_shielding:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Deplete other's shield
		_hit.shield_hp-=damage;
		_hit.shield_stun+=calculate_shieldstun(damage,1);
		//Projectiles destroy on contact
		destroy=true;
		break;
		}
	case INV.type_parry:
		{
		//Change ownership and reflect
		owner=_hit;
		parry_trigger(noone,_hit);
		
		hsp = -hsp * parry_reflect_speed_multiplier;
		vsp = -vsp * parry_reflect_speed_multiplier;
		facing = -facing;
		break;
		}
	default: break;
	}