//Downward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 10;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_dspecial_slide
			anim_speed=0;
			anim_frame=0;
		
			attack_frame= 3;
			return;
			}
			#endregion
			#region   Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
				
				audio_play_sound(choose(vc_dtilt1,vc_dtilt2,vc_nothing),10,false);
			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 3 - hitbox
		case 1:
			{
			if (attack_frame==0)
				{
					set_speed(20 * facing, 0, false, false);
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(0,-16,1,0.5,6,9,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_sweethit);     
				}
			break;
			}
			#endregion
		    #region   Frame 4 - hitbox + ex jump cancel
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(4,-16,1,0.5,6,8,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= 20
				       {
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= 25
						   
					    attack_stop(PLAYER_STATE.jumpsquat);		
					   }
					}
				else
					{					
					}
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox + ex jump cancel
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(4,-16,1,0.5,6,8,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);
				
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= 20
				       {
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= 25
						   
					    attack_stop(PLAYER_STATE.jumpsquat);		
					   }
					}
				else
					{					
					}
				#endregion
				}
			break;
			}
			#endregion
			#region	 Frame 6 - hitbox + ex jump cancel
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(0,-16,1,0.5,6,8,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= 20
				       {
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= 25
						   
					    attack_stop(PLAYER_STATE.jumpsquat);		
					   }
					}
				else
					{					
					}
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox + ex jump cancel
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(0,-16,1,0.5,6,8,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= 20
				       {
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= 25
						   
					    attack_stop(PLAYER_STATE.jumpsquat);		
					   }
					}
				else
					{					
					}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 8 - ex jump cancel
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;	
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= 20
				       {
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= 25
						   
					    attack_stop(PLAYER_STATE.jumpsquat);		
					   }
					}
				else
					{					
					}
				#endregion
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=4;
					}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;				
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=4;
					}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;			
				attack_phase++;				
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=4;
					}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;				
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=4;
					}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;				
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=4;
					}
				#endregion
				}
			break;
			}
		#endregion				
		    #region   Finish
		case 11:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=11;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion
//Movement

move_y();
Speed_Fraction();
move_x_grounded(16); // X movement along with pixel buffer of ledges.

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}