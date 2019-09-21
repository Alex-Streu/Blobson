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
			anim_sprite= my_sprites[?"Uheavy"];
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
				attack_frame=3;
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
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion
				#region tipper hitbox
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,10,1.3,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_sweetbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				attack_phase++;
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion
				#region tipper hitbox
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,10,1.3,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_sweetbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion
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
				attack_frame=2;
				
				#region normal hitbox
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion
				#region tipper hitbox
				var _damage = calculate_smash_damage(8);	
				var _hitbox = create_melee(0,0,1,1,_damage,9,1,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uheavy_sweetbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
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
				attack_frame=3;
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
				if (attack_has_hit())   {attack_frame=3;} //if attack landed
				else{attack_frame=5;} //if attack has missed
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
				if (attack_has_hit())   {attack_frame=3;} //if attack landed
				else{attack_frame=5;} //if attack has missed
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
				if (attack_has_hit())   {attack_frame=3;} //if attack landed
				else{attack_frame=5;} //if attack has missed
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
				if (attack_has_hit())   {attack_frame=5;} //if attack landed
				else{attack_frame=8;} //if attack has missed
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