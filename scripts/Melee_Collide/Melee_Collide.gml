///@func Melee_Collide(id)
///@param id
//All of the actions that happen when a melee hitbox comes into contact with a hurtbox
//Exit out early if it is the owner or if it is a detached hurtbox
var _hurtbox=argument[0];
var _hit=_hurtbox.player;
if (_hit==noone || _hit==owner) return;
//Mark the hitbox as having hit something
has_hit=true;
owner.any_hitbox_has_hit=true;
//Get the hitbox group list
var _col_list=owner.collided[| hitbox_group];
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
		//Stored knockback state
		_hit.stored_state=knockback_state;
		//Knockback and hitlag
		var _total_kb=0,_total_hl=0;
		_total_kb=calculate_knockback(_hit.damage,damage,_hit.weight_multiplier,knockback_scaling,base_knockback);
		_total_hl=calculate_hitlag(base_hitlag);
		//Change state
		with(_hit) 
			{
			set_state(PLAYER_STATE.in_hitlag);
			//Calculate angle based on flipper
			var _calc_angle = 90;
			if (on_ground())
				{
				_calc_angle=apply_angle_flipper(other.grounded_angle,other.angle_flipper,other.owner,id,_total_kb);
				}
			else
				{
				_calc_angle=apply_angle_flipper(other.angle,other.angle_flipper,other.owner,id,_total_kb);
				}
			}
		//Knockback is applied, unless there is zero knockback
		if (base_knockback!=0)
			{
			with(_hit)
				{
				//Finishing blow adds more hitlag
				if (is_finishing_blow(_total_kb,_hit.x,_hit.y,_calc_angle,_hit.stored_hitstun,_hit))
					{
					_total_hl+=finishing_blow_hitlag_increase;
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
		//Attacking player gets the same hitlag
		owner.self_hitlag_frame=_total_hl;
		//Effects
		hit_fx_style_create(hit_fx_style,_calc_angle,_hit,_total_kb);
		hit_sfx_play(hit_sfx);
		//Final Hit fade
		if (is_finishing_blow(_total_kb,_hit.x,_hit.y,_calc_angle,_hit.stored_hitstun,_hit))
			{
			background_clear_activate(_total_hl,palette_get_color(owner.palettes[owner.player_color],0));
			}
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
		owner.self_hitlag_frame=base_hitlag;
		_hit.self_hitlag_frame=base_hitlag;
		break;
		}
	case INV.shielding:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Deplete other's shield
		_hit.shield_hp-=damage;
		_hit.shield_stun+=calculate_shieldstun(damage,1);
		//Hitlag
		owner.self_hitlag_frame=base_hitlag;
		//Effects
		hit_fx_style_create(HIT_FX.shield,0,_hit,0);
		hit_sfx_play(hit_sfx);
		break;
		}
	case INV.parry:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Activate the other player's parry
		parry_trigger(owner,_hit);
		break;
		}
	default: break;
	}