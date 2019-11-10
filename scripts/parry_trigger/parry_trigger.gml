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
		self_hitlag_frame = parry_hitlag + 3;
		}

	with(_tar)
		{	
		audio_play_sound(sfx_parryland,10,false);
		audio_play_sound(vc_parry,10,false);
		EX_meter += 100;
		instance_create_depth(x + 16 * facing,y-64,-100,obj_effect_parry);	
		parry_phase = PHASE.parry;
		parry_frame = parry_trigger_time;
		self_hitlag_frame = parry_hitlag;
		}
	}
