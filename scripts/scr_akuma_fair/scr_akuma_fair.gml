//Forward Aerial for Akuma
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
			attack_frame=3;
			landing_lag = 10;
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
				attack_frame=3;
				}
			break;
			}
			
					//Frame 3 normal/sweet hitbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=4;		
				audio_play_sound(choose(sfx_vc_akuma_attack1,sfx_nothing,sfx_nothing),10,false);
				}
			break;
			}
			
				//Frame 4 normal/sweet hitbox + ex meter
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 2;
				
				#region normal hitbox
				var _hitbox = create_melee(50,-44,1.2,.5,7,7,0.8,12,60,2,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_fx_style,HIT_FX.hit2);
				#endregion

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
				attack_frame=5;
				#region normal hitbox
				var _hitbox = create_melee(50,-44,1.2,.5,4,5,0.8,12,60,5,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_sourhit);
				#endregion
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					landing_lag = 3;
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
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
				attack_frame=6;
			    #region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					landing_lag = 3;
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
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
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					attack_frame = 5
					landing_lag = 3;
					}
				else
					{					
					EX_meter += 0;
					attack_frame = 8
					}
				#endregion 			
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

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}
	
	
	
	