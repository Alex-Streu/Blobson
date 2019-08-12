//Up Aerial
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run = false;

//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_uair_ivysaur;
			anim_speed = 0;
			anim_frame = 0;
			landing_lag = 3;
			set_speed(0, -1, true, true);
			attack_frame = 5;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame == 3)
				anim_frame = 1;
				
			if (attack_frame == 0)
				{
				anim_frame = 2;
			
				attack_phase++;
				attack_frame = 10;
				set_speed(0, 3, true, true);
				var _hitbox = create_melee(2, -50, 0.5, 0.5, 10, 8, 1, 12, 90, 1, HITBOX_SHAPE.circle, 0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, [snd_hit_strong, snd_hit_strong2]);
				var _hitbox = create_melee(2, -50, 1.5, 1.5, 9, 9, 0.4, 6, 90, 3, HITBOX_SHAPE.circle, 0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, [snd_hit_weak, snd_hit_weak2]);
				var _snd = audio_play_sound(snd_hit_explosion2, 9, false);
				audio_sound_gain(_snd, 0.5, 0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame == 7)
				anim_frame = 3;
			if (attack_frame == 4)
				anim_frame = 4;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 5;
			
				attack_phase++;
				attack_frame = attack_has_hit() ? 6 : 12;
				}
			break;
			}
		//Finish
		case 2:
			{
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();