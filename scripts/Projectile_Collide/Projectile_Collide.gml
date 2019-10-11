///@func Projectile_Collide(id)
///@param id
//All of the actions that happen when a projectile comes into contact with a player

#region orginal script

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
	case INV.normal:
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
		//Effects
		hit_fx_style_create(hit_fx_style,_calc_angle,_hit,_total_kb);
		hit_sfx_play(hit_sfx);
		//Final Hit fade
		if (is_finishing_blow(_total_kb,_hit.x,_hit.y,_calc_angle,_hit.stored_hitstun,_hit))
			{
			background_clear_activate(_total_hl,palette_get_color(owner.palettes[owner.player_color],0));
			}
		//Projectiles destroy on contact
		if impact_destroy = true {destroy=true;}
		break;
		}
	case INV.invincible:
		{
		//No knockback or damage or hitlag
		//Do not add the player to the collided list
		//This is because the opponent should be hit even if their invincibility runs out mid-attack
		break;
		}
	case INV.superarmor:
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
	case INV.shielding:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Deplete other's shield
		_hit.shield_hp-=damage;
		_hit.shield_stun+=calculate_shieldstun(damage,1);
		//Projectiles destroy on contact
		destroy=true;
		//Effects
		hit_fx_style_create(HIT_FX.shield,0,_hit,0);
		hit_sfx_play(hit_sfx);
		break;
		}
	case INV.parry:
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
	#endregion