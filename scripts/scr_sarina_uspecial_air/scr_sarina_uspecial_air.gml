//Upward special for Sarina - airborne
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
//fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;

#region landing lag change if hit
				if (attack_has_hit())   {landing_lag = 3;}
				else                              {landing_lag = 10;}
				#endregion				

//How much EX_meter is gained upon landing the attack.
meter_gain = 4;
meter_gain_magnet = 2;

//Phases
if (run)
	{
	switch(_phase)
		{
			#region Frame 1 + settings
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= spr_sarina_uspecial_airv2
			anim_speed=0;
			anim_frame=0;
			attack_frame=6;
			landing_lag=15;
			
			#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_uspecial_air_ex = false
				if EX_meter >= ex_useage_uspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_uspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_uspecial_air;
				}
				#endregion
			
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
				attack_frame=4;				
				#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_uspecial_air_ex = false
				if EX_meter >= ex_useage_uspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_uspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_uspecial_air;
				}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 3 - hitbox 0
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -10, false, false);	
				if sarina_uspecial_air_ex = true {audio_play_sound(vc_uspecial_ex1,10,false);}
				if sarina_uspecial_air_ex = false {audio_play_sound(vc_uspecial1,10,false);}
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 4 - hitbox 0
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -9.5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 - hitbox 0 
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=2;					
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -9, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				
				}
			break;
			}
			#endregion
	        #region Frame 6 - hitbox 0
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame = 2
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -8.5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion

				}
			break;
			}
			#endregion
			#region Frame 7 - hitbox 1
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame = 2;
                set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -8, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,1);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 8 - hitbox 1
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -7.5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,1);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 9 - hitbox 1
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -7, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,1);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 10 - hitbox 1
		case 8:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -6.5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 11 - hitbox 2
		case 9:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -6, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,2);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 12 - hitbox 2
		case 10:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -5.5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,2);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 13 - hitbox 2
		case 11:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,2);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 14 - hitbox 2 - final multihit
		case 12:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=9;			
				attack_phase++;
				attack_frame=2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, -5, false, false);
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,2,11,0,5,80,2,HITBOX_SHAPE.circle,2);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 15 - check if ex version
		case 13:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = true
					{
				audio_play_sound(vc_uspecial_ex2,10,false);
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame = 2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 1, -10, false, false);
					}
					#endregion
				#region EX version
				if sarina_uspecial_air_ex = false
					{
						
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=10;			
				attack_phase++;
				attack_frame = 2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 1, -10, false, false);
					}
					#endregion
				
				}
			break;
			}
			#endregion			
			#region Frame 16 - hitbox 0 - downward slice
		case 14:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = false
					{
					audio_play_sound(vc_uspecial2,10,false);
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=11;			
				attack_phase++;
				attack_frame = 2;
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 1, -10, false, false);
					}
					#endregion
				#region EX version
				if sarina_uspecial_air_ex = true
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv2
				anim_frame=11;			
				attack_phase++;
				attack_frame = 2;
				audio_play_sound(vc_uspecial2,10,false);
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 1, -15, false, false);
				reset_hitbox_group(collided, 0);
				reset_hitbox_group(collided, 1);
				reset_hitbox_group(collided, 2);
				#region hitbox
				var _hitbox = create_magnetbox(0,0,1,1,1,2,120,-120,8,2,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uspecial_ex_hit);
				#endregion
					}
					#endregion			
				}
			break;
			}
			#endregion			
			#region Frame 17 - hitbox 0 - downward slice
		case 15:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = false
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=12;			
				attack_phase++;
				attack_frame = 2;
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,6,6,1,5,55,2,HITBOX_SHAPE.circle,3);
				_hitbox.sprite_index = spr_sarina_nair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 4;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uspecial_hit);
				#endregion
					}
					#endregion				
				#region EX version
				if sarina_uspecial_air_ex = true
				{
				//Animate
				anim_frame=12;			
				attack_phase++;
				attack_frame = 2;
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,6,4,1,5,-60,2,HITBOX_SHAPE.circle,1);
				_hitbox.sprite_index = spr_sarina_uspecial_airv2_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uspecial_ex_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 17
		case 16:
			{
			if (attack_frame==0)
				{
					#region non EX version
				if sarina_uspecial_air_ex = false
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=13;			
				attack_phase++;
				attack_frame = 2;
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,6,4,1,5,55,2,HITBOX_SHAPE.circle,3);
				_hitbox.sprite_index = spr_sarina_nair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 5;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uspecial_hit);
				#endregion
					}
					#endregion				
					#region EX version
					if sarina_uspecial_air_ex = true
					{
				//Animate
				anim_frame=13;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
					}
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 18
		case 17:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = false
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=14;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
					}
					#endregion				
				#region EX version
				if sarina_uspecial_air_ex = true
				{
				//Animate
				anim_frame=14;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
				}
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 19
		case 18:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = false
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=15;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
					}
					#endregion				
				#region EX version
				if sarina_uspecial_air_ex = true
				{
				//Animate
				anim_frame=15;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
				}
				#endregion
				}
			break;
			}
			#endregion			
			#region Frame 20
		case 19:
			{
			if (attack_frame==0)
				{
				#region non EX version
				if sarina_uspecial_air_ex = false
					{
				//Animate
				anim_sprite = spr_sarina_uspecial_airv3
				anim_frame=16;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
					}
					#endregion				
				#region EX version
				if sarina_uspecial_air_ex = true
				{
				//Animate
				anim_frame=16;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =4}
				#endregion				
				}
				#endregion
				}
			break;
			}
			#endregion			
			
	        #region Finish
		case 20:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=16;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.helpless);				
				run = false;
				}
			break;
			}
			#endregion
		}
	}
//Movement
move_();
	
	
	
	