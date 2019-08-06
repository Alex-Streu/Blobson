//upward Aerial for Matsu
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_try();
//allow_hitfall();
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
			anim_sprite= my_sprites[?"Uairb"];
			anim_speed=0;
			anim_frame=1;
			landing_lag=10;
			attack_frame=5;
			var _magnetbox = create_magnetbox(32,-32,0.3,0.6,3,5,0,-64,6,1,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_magnetbox,HITBOX.base_hitlag,20);	
			return;
			}
			
					//Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;
				create_melee(0,-100,0.6,0.5,5,7,1,1,-55,2,HITBOX_SHAPE.rectangle,0);
				}
			break;
			}
			
			//Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
							
				
		//Finish
		case 5:
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

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}

//attack_frame = attack_has_hit() ? 3 : 10;