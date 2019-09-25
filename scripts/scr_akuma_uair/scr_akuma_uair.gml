//upward Aerial for Akuma
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
			anim_sprite= my_sprites[?"Uair"];
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
				}
			break;
			}
			#endregion
			#region Frame 4 - light hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 3;

                #region light hitbox
				var _hitbox = create_melee(36,-64,0.5,.7,3,5,0,9,80,3,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 - ending hitbox + jump boost
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				
				#region ADD EX meter + jump boost
				if (attack_has_hit())   
				{
					EX_meter += 5;
					set_speed(0,-6)
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
				#region hitbox
				// reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_melee(10,-102,0.4,.8,8,8,1.2,13,80,3,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit2);
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
				
			#region ADD EX meter + jump boost
				if (attack_has_hit())   
				{
					EX_meter += 3;
					set_speed(0,-11)
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
				attack_frame = 3
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;} //Jump cancel out of lag
				else {EX_meter += 0;}
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
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;} //Jump cancel out of lag
				else {EX_meter += 0;}
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
	
	
	
	