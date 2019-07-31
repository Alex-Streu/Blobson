///@func parry_trigger(attacker,target)
///@param attacker
///@param target
var _atk = argument[0],
	_tar = argument[1];
	
if ((_atk != noone && _atk.can_be_parried) || _atk == noone)
	{
	with(_atk)
		{
		has_been_parried = true;
		self_hitlag_frame = parry_hitlag;
		}

	with(_tar)
		{
		parry_phase = PHASE.parry;
		parry_frame = parry_trigger_time;
		self_hitlag_frame = parry_hitlag;
		create_fx(spr_fx_parry,1.5,0,18, x +19 * facing,y - 62,1,0);
		audio_play_sound(sfx_parryland,5,false);
		
		// Play animation of the parry
		anim_sprite = my_sprites[?"Parryland"];
		anim_frame = 0;
		anim_speed = ani_speed_parryland;
		}
	}
