//Upward Tilt for Akuma
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
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
		    #region   Frame 4 - hitbox upward hit
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=3;	
				#region med hitbox (have me above sweetbox
				var _hitbox = create_melee(55,-116,.6,0.7,5,6,1,10,75,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit1);
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
				attack_frame=2;				
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
				attack_frame=2;				
				}
			break;
			}
			#endregion
			#region   Frame 7 - downward hit
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				#region hitbox
				var _hitbox = create_melee(96,-90,.7,0.6,5,5,1,12,-70,2,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit2);
				#endregion
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
				if (attack_has_hit())   {attack_frame = 1;}
				else  {attack_frame = 3;}
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
				if (attack_has_hit())   {attack_frame = 1;}
				else  {attack_frame = 3;}
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
				if (attack_has_hit())   {attack_frame = 1;}
				else  {attack_frame = 3;}
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
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 7;}
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
				if (attack_has_hit())   {attack_frame = 1;}
				else  {attack_frame = 3;}
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