///@func Grab_Collide(id)
///@param id
//All of the actions that happen when a grab comes into contact with a player
//Returns true if the grab succeeds. Can only grab 1 player at a time
//Exit out early if hitting owner
var _hurtbox=argument[0];
var _hit=_hurtbox.player;
if (_hit==noone || _hit==owner) return false;
//Mark the hitbox as having hit something
has_hit=true;
owner.any_hitbox_has_hit=true;
//Check invulnerability
switch(_hit.invulnerable_type)
	{
	//Grabs hit through armor, shields, and normal state
	case INV.shielding:
	case INV.superarmor:
	case INV.normal:
		{
		//Change state of target
		with(_hit)
			{
			set_state(PLAYER_STATE.is_grabbed);
			//Turn to face the attacker
			facing = -other.owner.facing;
			//Pass ID
			grab_hold_id = other.owner;
			//Set grab hold position
			grab_hold_x = other.grab_destination_x;
			grab_hold_y = other.grab_destination_y;
			}
		//Change state of player
		with(owner)
			{
			attack_stop(PLAYER_STATE.grabbing);
			grabbed_id=_hit;
			//Set the grab timer
			grab_frame=calculate_grab_time(_hit.damage);
			}
		//Effects
		hit_fx_style_create(hit_fx_style,point_direction(_hit.x,_hit.y,owner.x,owner.y),_hit,0);
		hit_sfx_play(hit_sfx);
		//Acknowledge the grab
		return true;
		break;
		}
	case INV.invincible:
		{
		//No knockback or damage or hitlag
		//Do not add the player to the collided list
		//This is because the opponent should be hit even if their invincibility runs out mid-attack
		break;
		}
	case INV.parry:
		{
		if (parry_grabs)
			{
			//Activate the other player's parry
			parry_trigger(owner,_hit);
			break;
			}
		}
	default: break;
	}
return false;