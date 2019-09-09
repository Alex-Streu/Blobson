//Forward Tilt for Sarina
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
			anim_sprite= my_sprites[?"Ftilt"];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame= 2;
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
				attack_frame=2;
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
				var _hitbox = create_melee(54,-64,1,0.5,6,5,0.7,10,30,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				}
			break;
			}
			#endregion
		    #region   Frame 4 - add meter
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=4;
                #region ADD EX meter                               (add me in the (attack_frame==0) section
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
			#region   Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=3;
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
		    #region Finish
		case 7:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=7;
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

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}