///@func Magnetbox_Collide(id)
///@param id
//All of the actions that happen when a magnetbox comes into contact with a player
//Exit out early if hitting owner
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
		//add meter
		owner.EX_meter += owner.meter_gain_magnet;
		//Knockback and damage
		_hit.damage+=damage;
		_hit.damage_text_random=damage;
		//Change state
		with(_hit)
			{
			set_state(PLAYER_STATE.magnetized);
			}
		_hit.magnet_goal_x=magnet_goal_x;
		_hit.magnet_goal_y=magnet_goal_y;
		_hit.magnet_frame=magnet_frame+base_hitlag;
		//Attacking player gets some hitlag
		owner.self_hitlag_frame=base_hitlag;
		//Turn to face the attacker
		if (hit_turnaround)
			{
			if (_hit.x!=owner.x)
				{
				_hit.facing=sign(owner.x-_hit.x);
				}
			}
		//Effects
		hit_fx_style_create(hit_fx_style, point_direction(_hit.x, _hit.y, magnet_goal_x, magnet_goal_y), _hit, damage);
		hit_sfx_play(hit_sfx);
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