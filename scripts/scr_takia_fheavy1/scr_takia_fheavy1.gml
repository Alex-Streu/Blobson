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
				attack_frame=8;
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
				attack_frame=1;
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
				attack_frame=1;
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
				attack_frame=1;
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
				attack_frame=1;
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
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(8,1,3,2);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 9 - hitbox + ex meter
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(4);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 10 - hitbox + ex meter
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
			
				attack_phase++;
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(4);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 11 - hitbox + ex meter
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
			
				attack_phase++;
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(4);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				
				}
			break;
			}
			#endregion
			#region   Frame 12 - ex meter
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;
			
				attack_phase++;
				attack_frame=2;
				
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
				attack_frame=2;
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
				attack_frame=2;
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
			
				attack_phase++;
				attack_frame=2;
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
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 17
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 18
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 19
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 20
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
		    #region   Finish
		case 20:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=19;
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