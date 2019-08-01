//Neutral Aerial for character0
//Logic Control Variable
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
aerial_drift();
allow_hitfall();
//Cancels
if run && cancel_ground_check()	run=false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		//Initialize
		case PHASE.start:
			{
			//Animation
			anim_sprite=my_sprites[?"Nair"];
			anim_speed= 0;
			anim_frame=0;
			landing_lag=5;
			attack_frame=1;
			set_speed(0,-1,true,true);
			return;
			}
									//1st frame
			case 0:
			{			
			if (attack_frame==0)
				{
				anim_frame= 0;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
												//2ns frame
			case 1:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			       //3rd frame HITBOX
						case 2:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(20,-50,0.5,.5,5,2,0.9,12,-60,6,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_nair_hit);
				}
			break;
			}
			//4th frame HITBOX
					case 3:
			{			
			if (attack_frame==0)
				{
				anim_frame= 3;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
						//5th frame
			case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=3;
			
				if (attack_has_hit())   {attack_frame = 4;   landing_lag = 4;}
				else
					{					
					attack_frame = 7;
					}
			break;
				}
			}
			

		//Endlag
		case 5:
			{
			if (attack_frame==5)
				{
				anim_frame= 4;
				}
			//Jump cancel out of lag
			if run && cancel_jump_check()	run=false;
			if (attack_frame==0)
				{
				//Revert back to the original state - may be idle, aerial, crouching, etc.
				attack_stop(PLAYER_STATE.idle);
				run=false;
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