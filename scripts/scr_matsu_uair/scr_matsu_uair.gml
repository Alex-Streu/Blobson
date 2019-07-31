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
			anim_sprite= my_sprites[?"Uair"];
			anim_speed=0;
			anim_frame=0;
			landing_lag=10;
			attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
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
				//Normal
				var _hitbox = create_melee(0,0,1,1,8,8,0.7,8,90,4,HITBOX_SHAPE.rectangle,0);
				_hitbox.sprite_index = spr_matsu_uair_hb;
				if (facing == -1) {_hitbox.image_xscale *= -1;}	
				
				}
			break;
			}
			
			                    //Frame 7 (hitbox heavy)
		case 5:
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
			
		//Frame 8 (hitbox lighter)
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;
				
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
					//Frame 9 finish (hitbox lighter)
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
				if (attack_has_hit())   {attack_frame = 3;   landing_lag = 4;}
				else
					{					
					attack_frame = 6;
					}
			break;
				}
			break;
			}
			
			//Frame 8 (hitbox lighter)
		case 8:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=9;
				
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
					
		
			
		//Finish
		case 9:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=9;
			
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
	
	
	
	