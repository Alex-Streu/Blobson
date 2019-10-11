//Downward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 1;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Dtilt" ];
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
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(77,-16,1.3,0.5,6,7,0.5,13,65,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_sweethit);     
				}
			break;
			}
			#endregion
		    #region   Frame 4 - weak hitbox + dash cancel
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=4;	
				
				#region Dash Cancel
				if (attack_has_hit())   { if run && check_dash()    hurtbox.sprite_index =spr_sarina_hurtbox;   run=false; } //Dash cancel			
				#endregion
				
				var _hitbox = create_melee(77,-16,1.3,0.5,6,5,0.5,8,60,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_hit);   
				}
			break;
			}
			#endregion
			#region   Frame 5 - dash cancel
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=3;
				#region Dash Cancel
				if (attack_has_hit())   { if run && check_dash()    hurtbox.sprite_index =spr_sarina_hurtbox;   run=false; } //Dash cancel			
				#endregion
				}
			break;
			}
			#endregion
			#region	 Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
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
					attack_frame=3;
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
		    #region   Finish
		case 7:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=7;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.crouching);
				anim_frame = 4
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

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}