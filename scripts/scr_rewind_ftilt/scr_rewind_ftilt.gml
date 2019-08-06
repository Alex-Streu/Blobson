//Forward Tilt for character0
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
			anim_sprite= my_sprites[?"Ftilt"];
			audio_play_sound(sfx_rewind_swish2,10,false);
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=3;
			return;
			}
			
					//Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				set_speed(facing*12,0,false,false);
				anim_frame=1;
				attack_phase++;
				attack_frame=4;
				
				}
			break;
			}
			
								//Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=5;
				var _hitbox = create_melee(50,-86,0.7,0.5,7,6,0.7,10,30,5,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_ftilt_hit);
				}
			break;
			}
			
		
		//Frame 4 hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=4;
                
				
				}
			break;
			}
			
											//Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				
				if (attack_has_hit())   {attack_frame=4;}
				else   {					attack_frame = 14;}
				}
			break;
			}
		
						
		//Finish
		case 4:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=5;
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