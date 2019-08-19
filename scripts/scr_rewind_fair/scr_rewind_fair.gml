//Forward Aerial for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Fair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
			attack_frame=4;
			landing_lag=10;
			return;
			}
			
					//Startup -> frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animate
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
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=4;
				var _hitbox = create_melee(45,-80,1,.6,10,6,1,12,50,4,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair_hit);
				
				
				
				}
			break;
			}
			
								//Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 4;
				var _hitbox = create_melee(45,-80,1,.6,4,3,1,8,50,4,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
			
				}
			break;
			}
			
											//Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;
			
				attack_phase++;
				attack_frame=4;

				}
			break;
			}
			
														//Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;
				attack_phase++;
				attack_frame=4;
			
				}
			break;
			}
			
			
					//Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;				
				attack_phase++;
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 2;}
				else                              {attack_frame = 8; landing_lag = 10;}
				}
			break;
			}
					
		
			
		//Finish
		case 6:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=6;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
		}
	}
//Movement
move_();
	
	
	