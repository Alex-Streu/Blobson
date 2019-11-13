//Upward heavy for Takia
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
				attack_frame=3;
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
				attack_frame=3;
				
				audio_play_sound(choose(vc_uheavy1,vc_uheavy2,vc_nothing),10,false);
				audio_play_sound(snd_uheavy,10,false);
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitboxes
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				attack_frame = 2;
				var _damage = calculate_smash_damage(6,smash_charge / 2,8,0.3);		
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,_damage + 3,8,1.2,17,80,2,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_sarina_uheavy_tipper;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,_damage,6,0.8,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uheavy_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 6 - hitboxes
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				attack_frame = 2;
				var _damage = calculate_smash_damage(6,smash_charge / 2,8,0.3);
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,_damage + 3,8,1.2,17,80,2,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_sarina_uheavy_tipper;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,_damage,6,0.8,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uheavy_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitboxes
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				attack_frame = 2;
				var _damage = calculate_smash_damage(6,smash_charge / 2,8,0.3);
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,_damage + 3,8,1.2,17,80,2,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_sarina_uheavy_tipper;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,_damage,6,0.8,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uheavy_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
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
				if (attack_has_hit())   {attack_frame = 4;}
				else  {attack_frame = 6;}
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
				if (attack_has_hit())   {attack_frame = 4;}
				else  {attack_frame = 6;}
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
				if (attack_has_hit())   {attack_frame = 4;}
				else  {attack_frame = 6;}
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
				if (attack_has_hit())   {attack_frame = 4;}
				else  {attack_frame = 6;}
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
				if (attack_has_hit())   {attack_frame = 4;}
				else  {attack_frame = 6;}
				#endregion 			
				
				}
			break;
			}
			#endregion
		    #region   Finish
		case 12:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=11;
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

//How much EX_meter is gained upon landing the attack.
meter_gain = 5 + round(smash_charge / 5);
meter_gain_magnet = 1;
