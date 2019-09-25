//netural Aerial for Akuma
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
			anim_sprite= my_sprites[?"Nair"];
			anim_speed=0;
			anim_frame=0;
			attack_frame=3;
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
				attack_frame=3;		
				audio_play_sound(choose(sfx_vc_akuma_attack2,sfx_nothing,sfx_nothing),10,false);
				}
			break;
			}
			#endregion
			#region Frame 4 - hitbox first hit
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 2;
				
				#region normal hitbox
				var _hitbox = create_melee(24,-38,.9,.5,5,7,0,12,70,2,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);
				#endregion

				}
			break;
			}
			#endregion
			#region Frame 5 - second hitbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				#region normal hitbox
				var _hitbox = create_melee(24,-38,.8,.5,3,3,0.8,9,70,3,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_sour_hit);
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
			#region Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;
				attack_phase++;
				attack_frame=3;
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
				#region normal hitbox
				var _hitbox = create_melee(24,-38,.8,.5,3,3,0.8,9,70,3,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);
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
				attack_frame = 3
				#region normal hitbox
				var _hitbox = create_melee(24,-38,.8,.5,3,3,0.8,9,70,3,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);
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
				anim_frame=7;				
				attack_phase++;
				attack_frame = 3
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
			#region Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					attack_frame = 5
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
			#endregion		
		    #region Finish			
		case 8:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=8;
			
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
	
	
	
	