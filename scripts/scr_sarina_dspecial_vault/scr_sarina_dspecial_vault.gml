//Downward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);

if (on_ground())
	{
	friction_gravity(ground_friction, grav, max_fall_speed);
	}
else
	{
	friction_gravity(air_friction, grav, max_fall_speed);
	}

//Canceling
//if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
//edit the meter gain variable in melee_colide
meter_gain = 6;
meter_gain_magnet = 0;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_dspecial_vault
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
					#region Set vault distance depending on stick being held
					
					//low vault
					if stick_tilted(Lstick,DIR.down) {set_speed(15 * facing, -8, false, false);}
					//high vault
					if stick_tilted(Lstick,DIR.up) {set_speed(9 * facing, -13, false, false);}
					//normal vault
					if !stick_tilted(Lstick,DIR.up) 
					and !stick_tilted(Lstick,DIR.down) 
					{set_speed(13 * facing, -10, false, false);}
					#endregion
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(28,-96,1,0.6,6,9,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
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
				var _hitbox = create_melee(31,-84,1,0.5,6,9,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_sweethit);   	
				
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
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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
			#region   Frame 9 - ex jump cancel
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;	
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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
			#region   Frame 10 - ex jump cancel
		case 8:
			{
			if (attack_frame==0)
				{
					
					if (on_ground())
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
                    else
	                {
	                attack_stop(PLAYER_STATE.aerial);
	                }

				}
			break;
			}
		#endregion				
			#region   Frame 11 - ex jump cancel
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;		
				#region EX jump cancel
				if (attack_has_hit())   
				{
					   if (button(INPUT.jump, buff,true))			
					   if EX_meter >= ex_useage_dspecial_slide
				       {
						   audio_play_sound(sfx_ex_useage,10,false);
						   ex_flash = true;
						   ex_flash_timer = 30;
						   EX_meter -= ex_useage_dspecial_slide
						   instance_create_depth(x,y-60,300,obj_effect_ex_flash);
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

move_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}