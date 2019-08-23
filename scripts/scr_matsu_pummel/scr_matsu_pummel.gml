//Pummel for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
grab_frame=max(--grab_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Grab is released even during pummels
if (run && grab_frame==0)
	{
	grab_release();
	run=false;
	}
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Pummel"];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=2;
			return;
			}
			
					//Pummel Startup - frame 1
		case 0:
			{
			//Animation
			if (attack_frame==2)
				{
				anim_frame=1;
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
								//Pummel Startup - frame 2
		case 1:
			{
			//Animation
			if (attack_frame==2)
				{
				anim_frame=2;
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
		//Pummel Startup - frame 3
		case 2:
			{
			//Animation
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				audio_play_sound(snd_pummel,5,false)
				var _hitbox = create_targetbox(20,5,0.5,0.3,2,5,0.1,8,75,3,HITBOX_SHAPE.circle,0,grabbed_id);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.is_grabbed);
				}
			break;
			}
			
					//Pummel hit - frame 4
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			
		//Pummel Endlag
		case 4:
			{
			//Animation
			anim_frame=4;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.grabbing);
				}
			break;
			}
		}
	}
//Movement
move_grounded_();