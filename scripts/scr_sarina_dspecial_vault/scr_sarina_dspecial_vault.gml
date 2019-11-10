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
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dspecial_vault_hit);     
				}
			break;
			}
			#endregion
		    #region   Frame 4 - hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(31,-84,1,0.5,6,9,0.5,13,45,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dspecial_vault_hit);   	
				
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(35,-78,1,0.3,4,7,0.5,13,30,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dspecial_vault_sourhit);     
				}
			break;
			}
			#endregion
			#region	 Frame 6 - hitbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(36,-68,1,0.3,4,7,0.5,13,30,3,HITBOX_SHAPE.rectangle,0);		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dspecial_vault_sourhit);     
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3; 
				var _hitbox = create_melee(35,-52,0.8,0.5,3,4,0.5,13,20,3,HITBOX_SHAPE.rectangle,0);		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dspecial_vault_sourhit);     
				}
			break;
			}
		#endregion				
			#region   Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;	
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=6;
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
					attack_frame=6;
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

move_();