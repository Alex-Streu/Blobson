//Downward heavy for Takia
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
			anim_sprite= my_sprites[?"Dheavy"];
			anim_speed=0;
			anim_frame=0;
			
			smash_charge=0;
			attack_frame=smash_attack_max_charge;
			return;
			}						
			#endregion
			
		#region charge heavy attack - frame 1
		case 0:
			{
			//Animation (every 8 frames switch the sprite)
			if (smash_charge % 8 == 0)
				{
				if (anim_frame==0)
					{
					anim_frame=0;
					}
				else
					{
					anim_frame=0;
					}
				}
			
			smash_charge++;
			if (smash_charge>=smash_attack_max_charge || attack_frame==0 || !button_hold(INPUT.smash,1))
				{
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			#endregion		
		
			#region   Frame 2
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=2;
				
				audio_play_sound(choose(vc_dheavy1,vc_dheavy2,vc_nothing),10,false);
				}
			break;
			}
			#endregion
			#region   Frame 3
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 4 - hitbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);		
				var _hitbox = create_melee(96,-20,1,.5,_damage,5,1.5,12,70,2,HITBOX_SHAPE.rectangle,0);			
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 5 - meter
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				#region whiff lag + meter
				if (attack_has_hit())   {attack_frame = 3; EX_meter += 9;}
				else  {attack_frame = 5;}
				#endregion 			
				}
			break;
			}
			#endregion
			#region   Frame 6
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 3;}
				else  {attack_frame = 5;}
				#endregion 			
				}
			break;
			}
			#endregion
			#region   Frame 7
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 3;}
				else  {attack_frame = 5;}
				#endregion 			
				}
			break;
			}
			#endregion
			#region   Frame 8
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 3;}
				else  {attack_frame = 5;}
				#endregion 			
				
				}
			break;
			}
			#endregion
			#region   Frame 9
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 6;}
				else  {attack_frame = 10;}
				#endregion 			
				
				}
			break;
			}
			#endregion
		    #region   Finish
		case 9:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=8;
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