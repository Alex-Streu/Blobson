//Downward heavy for Sarina
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
				
				audio_play_sound(choose(vc_uheavy1,vc_uheavy2,vc_nothing),10,false);
				audio_play_sound(snd_uheavy,10,false);
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
			    attack_frame = 2;
				attack_phase++;
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
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox tipper
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				attack_frame = 2;
				
				var _damage = calculate_smash_damage(5,smash_charge / 2,8,0.3);	
				#region normal hitbox
				var _hitbox = create_melee(-16,-96,.4,.4,_damage,8,1,10,90,2,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper2);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 8 - hitbox tipper
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_frame = 2;
				attack_phase++;
				
				var _damage = calculate_smash_damage(7,smash_charge / 2,8,0.3);	
				#region normal hitbox
				var _hitbox = create_melee(-8,-64,.3,.8,_damage,8,1,10,90,2,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper2);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 9 - splashdown
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_frame = 2;
				attack_phase++;		
				
				#region EX meter
				if (attack_has_hit())   {EX_meter += 10;}
				else                              {EX_meter += 0;}
				#endregion	
				
				//fx_create(spr_sarina_dheavy_hitbox,1,0,11,x,y-16,1,0)
				
				var _damage = calculate_smash_damage(9,smash_charge / 2,8,0.3);	
				#region wave hitbox
				var proj = custom_projectile(obj_sarina_dheavy_splash, 0, 0, 1, 1, _damage, 6, 1, 90, 11, HITBOX_SHAPE.circle, 0, 0);
				proj.base_hitlag = 6;
				proj.hit_sfx = snd_hit_explosion2;
				proj.overlay_scale = 1;
				#endregion
				//audio_play_sound(snd_hit_shot, 10, false);
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
				attack_frame = 2;
				attack_phase++;
				
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
				attack_frame = 2;
				attack_phase++;
				
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
				attack_frame = 2;
				attack_phase++;
				
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
				attack_frame = 2;
				attack_phase++;
				
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
				
				#region whiff lag
				if (attack_has_hit())   {attack_frame = 8;}
				else  {attack_frame = 18;}
				#endregion 			
				attack_phase++;
				
				}
			break;
			}
			#endregion
			#region   Frame 15
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;
				attack_frame = 3;
				attack_phase++;
				
				}
			break;
			}
			#endregion
			#region   Frame 16
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;
				attack_frame = 3;
				attack_phase++;
				
				}
			break;
			}
			#endregion
		    #region   Finish
		case 16:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=15;
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