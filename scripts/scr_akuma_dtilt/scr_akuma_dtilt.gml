//Downward for Akuma
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
			anim_sprite= my_sprites[?"Dtilt"];
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
		    #region   Frame 4 - hitbox heavy hit
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=1;	
				#region med hitbox (have me above sweetbox
				var _hitbox = create_melee(66,-16,1,0.4,5,6,1,10,45,1,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				#region heavy hitbox (have me below normal hitbox
				var _hitbox = create_melee(114,-16,.3,0.4,7,9,1,10,75,1,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_sweethit);
				#endregion
                
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox med hit
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;				
				#region med hitbox
				var _hitbox = create_melee(80,-16,1.2,0.4,5,6,1,10,45,2,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region	 Frame 6 - hitbox med hit 2
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				#region med hitbox
				var _hitbox = create_melee(80,-16,1.2,0.4,5,6,1,10,45,2,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_hit);
				#endregion
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
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 1;}
				else  {attack_frame = 3;}
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
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 5;}
				#endregion 			
				}
			break;
			}
		#endregion				
		    #region Finish
		case 9:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=10;
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