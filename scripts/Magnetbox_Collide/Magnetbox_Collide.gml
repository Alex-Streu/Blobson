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
	case INV.type_normal:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Knockback and damage
		_hit.damage+=damage;
		_hit.damage_text_random=damage;
		//Change state
		with(_hit)
			{
			set_state(PLAYER_STATE.magnetized);
			//Particle Effects
			//Make hit fx particles
			part_type_direction(global.p1,0,360,0,0); //Change the particle direction
			part_type_speed(global.p1,2,6,0,0);
			part_particles_create(global.part_sys,x+(sprite_get_width(anim_sprite)/2),y+(sprite_get_height(anim_sprite)/2),global.p1,15);
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
			//Audio
		audio_play_sound(snd_hit, 10, false);
		//Camera shake
		var _shake=(2 + ((_hit.damage / 20) * _hit.weight_multiplier) div 2);
		camera_shake(_shake);
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
		owner.self_hitlag_frame=base_hitlag;
		_hit.self_hitlag_frame=base_hitlag;
		break;
		}
	case INV.type_shielding:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Deplete other's shield
		_hit.shield_hp-=damage;
		_hit.shield_stun+=calculate_shieldstun(damage,1);
		//Hitlag
		owner.self_hitlag_frame=base_hitlag;
		//Hit effects
		create_fx(spr_hit_fx_shield,1,0,11,mean(owner.x,_hit.x),mean(owner.y,_hit.y),1,irandom(360));
		break;
		}
	case INV.type_parry:
		{
		//Add the other player to the collided list
		ds_list_add(_col_list,_hit);
		//Activate the other player's parry
		parry_trigger(owner,_hit);
		break;
		}
	default: break;
	}