//Normal Grab for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Grab"];
			anim_speed=0;
			anim_frame=0;
		    audio_play_sound(snd_grab,10,false);
			attack_frame=5;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=3;
				create_grab(46,-50,0.7,1,40,0,3,HITBOX_SHAPE.rectangle);				
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Second & longer grab hitbox
			if (attack_frame==4)
				{
				//Animation
				anim_frame=2;
				create_grab(52,0,1.2,0.1,40,0,5,HITBOX_SHAPE.rectangle);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=23;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==14)
				{
				anim_frame=3;
				}
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		}
	}
//Movement
move_grounded_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}