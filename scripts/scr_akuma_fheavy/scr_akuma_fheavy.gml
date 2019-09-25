//Forward heavy for Takia
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
			anim_sprite= my_sprites[?"Fheavy"];
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
				
				audio_play_sound(choose(vc_fheavy1,vc_fheavy2,vc_nothing),10,false);
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
			#region   Frame 4
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 5
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;
				set_speed(5*facing,0);
				}
			break;
			}
			#endregion
			#region   Frame 6 - hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				attack_frame=1;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);		
				var _hitbox = create_melee(66,-96,.7,.7,_damage,5,1.5,12,45,1,HITBOX_SHAPE.rectangle,0);			
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				attack_frame=1;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);		
				var _hitbox = create_melee(80,-102,.7,.7,_damage,5,1.5,12,45,1,HITBOX_SHAPE.rectangle,0);			
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 8 - hitbox
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_phase++;
				attack_frame=1;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);		
				var _hitbox = create_melee(96,-96,.7,.7,_damage,5,1.5,12,45,1,HITBOX_SHAPE.rectangle,0);			
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 9 - hitbox
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=1;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);		
				var _hitbox = create_melee(88,-80,.7,.6,_damage,5,1.5,12,45,1,HITBOX_SHAPE.rectangle,0);			
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 10
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 4;}
				#endregion 			
				
				}
			break;
			}
			#endregion
			#region   Frame 11
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 4;}
				#endregion 				
				
				}
			break;
			}
			#endregion
			#region   Frame 12
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 4;}
				#endregion 			
				
				}
			break;
			}
			#endregion
			#region   Frame 13
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 2;}
				else  {attack_frame = 4;}
				#endregion 			
				}
			break;
			}
			#endregion
			#region   Frame 14
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 5;}
				else  {attack_frame = 9;}
				#endregion 			
				}
			break;
			}
			#endregion
		    #region   Finish
		case 14:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=13;
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