//Upward Tilt for Takia
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Utilt"];
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
			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 3 - 1st magnetbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=3;
				
				#region hitbox 1
				//var _hitbox1 = create_melee(-4,-124,2.1,0.7,6,3,0.0,10,100,3,HITBOX_SHAPE.circle,0);	
				//set_hitbox_property(_hitbox1,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				
				var _hitbox1 = create_magnetbox(-4,-124,2.1,0.7,1,6,6,-90,20,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox1,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				set_hitbox_property(_hitbox1,HITBOX_PROPERTY.hit_sfx,snd_hitmulti1);			
				
				#endregion
				
				}
			break;
			}
			#endregion
		    #region   Frame 4 - 2nd magentbox + ex meter
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				
				#region hitbox 2
				var _hitbox2 = create_magnetbox(-4,-124,1.5,0.7,1,2,24,-100,20,2,HITBOX_SHAPE.rectangle,1);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitlag);
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_hitmulti2);		
				#endregion						
                #region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 1;
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
			#region   Frame 5 - 3rd magentbox + ex meter
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;
				#region hitbox 3
				var _hitbox3 = create_magnetbox(-4,-124,1.5,0.7,1,2,-24,-100,20,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox3,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				set_hitbox_property(_hitbox3,HITBOX_PROPERTY.hit_sfx,snd_hitmulti1);		
				#endregion
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 1;
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
			#region	 Frame 6 - 4th magnetbox + ex meter
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				
				#region hitbox 4
				var _hitbox4 = create_magnetbox(-4,-124,1.5,0.7,1,2,24,-100,20,2,HITBOX_SHAPE.rectangle,3);	
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitlag);
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.hit_sfx,snd_hitmulti2);		
				#endregion						
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 1;
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
			#region   Frame 7 - 5th hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				reset_hitbox_groups()
				#region hitbox 1
				var _hitbox5 = create_melee(-4,-124,2.1,0.7,7,6,1,10,80,3,HITBOX_SHAPE.circle,0);	
				set_hitbox_property(_hitbox5,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);				
				//set_hitbox_property(_hitbox5,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				#endregion
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 1;
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
			#region   Frame 8 + ex meter
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;						
				attack_phase++;	
				attack_frame = 3;
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 2;
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
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;		
				attack_frame = 5;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
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
				attack_frame = 5;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
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
				attack_frame = 4;
			    #region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 12 + whiff lag
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame =5
					}
				else
					{					
					attack_frame =8
					}
				#endregion				
				}
			break;
			}
		#endregion				
		    #region Finish
		case 11:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=12;
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
move_grounded_();