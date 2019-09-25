//Downward Aerial for Akuma
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
			#region Frame 1 - start
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Dair"];
			anim_speed=0;
			anim_frame=0;
			attack_frame=3;
			landing_lag = 10;
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
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region Frame 3
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
			#endregion
			#region Frame 4 hitbox strong
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 1;
				
				#region normal hitbox
				var _hitbox = create_melee(80,-58,.3,.3,10,5,1,12,-45,1,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_sweetspot_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 sour hit
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=5;
				#region normal hitbox
				var _hitbox = create_melee(50,-64,.8,.5,4,5,0.8,12,60,5,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_sourhit);
				#endregion
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
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
			#endregion
			#region Frame 6 sour hit
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;
				attack_phase++;
				attack_frame=6;
				#region normal hitbox
				var _hitbox = create_melee(50,-64,.8,.5,4,5,0.8,12,60,5,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_sourhit);
				#endregion
			    #region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
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
			#endregion			
			#region Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;				
				attack_phase++;
				attack_frame = 3;
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
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
			#endregion	
			#region Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
                attack_frame = 3;
				}
			break;
			}
			#endregion	
		    #region Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
                attack_frame = 3;
				}
			break;
			}
			#endregion	
			#region Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=9;				
				attack_phase++;
                attack_frame = 3;
				}
			break;
			}
			#endregion	
			#region Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=10;				
				attack_phase++;
				#region whiif lag
				if (attack_has_hit())   {attack_frame = 4}
				else   {attack_frame = 9;}
				#endregion 			
				}
			break;
			}
			#endregion	
			
		//Finish
		case 10:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=10;
			
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
	
	
	
	