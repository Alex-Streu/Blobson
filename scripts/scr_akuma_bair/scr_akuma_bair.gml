//backward Aerial for Akuma
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
			#region Frame 1 - setting startup
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Bair"];
			anim_speed=0;
			anim_frame=0;
			attack_frame=4;
			landing_lag=10;
			return;
			}
			#endregion
			#region Frame 2
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
			#endregion
			#region Frame 3 - first heavy hit
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=1;	
				
				#region normal hitbox
				var _hitbox = create_melee(-70,-88,.6,.6,9,9,1.3,12,130,1,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair_sweethit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 4 - hitbox second sour hit
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 3;

                #region normal hitbox
				var _hitbox = create_melee(-49,-86,0.9,.6,7,6,1,10,120,3,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 - ex meter
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 5;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
				}
			break;
			}
			#endregion
			#region Frame 6
		case 4:
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
			#endregion			
			#region Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;				
				attack_phase++;
				attack_frame = 3				
				}
			break;
			}
			#endregion		
			#region Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;				
				attack_phase++;
				#region jump cancelable + whiff lag
				if (attack_has_hit())   
				{
					if run && cancel_jump_check()	 run=false; //Jump cancel out of lag
					attack_frame = 5;
					landing_lag = 4;
					}
				else 
				{
					EX_meter += 0;
					attack_frame = 8;
					landing_lag = 7;
					}
				#endregion 			
				}
			break;
			}
			#endregion		
		    #region Finish			
		case 7:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=7;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
			#endregion
		}
	}
//Movement
move_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}
	
	
	
	