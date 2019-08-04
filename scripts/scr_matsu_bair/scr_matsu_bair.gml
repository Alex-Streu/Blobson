//Neutral Back Aerial for character0
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
			anim_sprite=my_sprites[?"Bair"];
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
			
															//3rd frame
			case 2:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;
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
				attack_frame=2;
                var _hitbox = create_melee(-45,-30,1.2,.7,10,5,1,12,50,2,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_bair_hit);
				}
			break;
			}
			//5th frame HITBOX
					case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=5;
				 var _hitbox = create_melee(-42,-30,1,.7,7,5,1,12,50,5,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_bair_hit);
				}
			break;
			}
			
			//7th frame
			case 5:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
						//8th frame
			case 6:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=3;
			
				if (attack_has_hit())   {attack_frame = 7;   landing_lag = 4;}
				else
					{					
					attack_frame = 10;
					}
			break;
				}
			}
			

		//Endlag
		case 7:
			{
			if (attack_frame==5)
				{
				anim_frame=6;
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