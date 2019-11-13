//Downward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 1;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_uspecial_ground
			anim_speed=0;
			anim_frame=0;
			attack_frame= 6;
			#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_uspecial_ground_ex = false
				if EX_meter >= ex_useage_uspecial_ground
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_uspecial_ground_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_uspecial_ground;
				}
				#endregion
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
				audio_play_sound(choose(vc_dtilt1,vc_dtilt2,vc_nothing),10,false);
				attack_phase++;
				attack_frame=6;
				#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_uspecial_ground_ex = false
				if EX_meter >= ex_useage_uspecial_ground
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_uspecial_ground_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_uspecial_ground;
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 3 - hitbox L
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 5, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				//reset_hitbox_group(collided, 1); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
		    #region   Frame 4 - hitbox L
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,9,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 5, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				//reset_hitbox_group(collided, 1); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox R
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 5, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region	 Frame 6 - hitbox R
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox L - loop 1
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				reset_hitbox_group(collided, 1); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 8 - hitbox L - loop 1
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;				
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion

				}
			break;
			}
		#endregion				
			#region   Frame 9 - hitbox R - loop 1
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 10 - hitbox R - loop 1
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox L - loop 2
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				reset_hitbox_group(collided, 1); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 8 - hitbox L - loop 2
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;				
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 2, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-90,-16,5,1,HITBOX_SHAPE.rectangle,1)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 9 - hitbox R - loop 2
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 2, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 10 - hitbox R - loop 2
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 3, 0, false, false);
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 2, 0, false, false);
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,90,-16,5,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
			#endregion
            #region   Frame 15 - hitbox
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,1,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				attack_frame=1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,4,-100,-32,5,1,HITBOX_SHAPE.rectangle,3)
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 16 - finish hitbox
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false
				{
				attack_frame=2;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,7,7,0.8,10,130,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 8;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uheavy_hit);
				#endregion   
				}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true
				{				
				attack_frame=3;
				#region reset hitboxes
				reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_melee(0,0,1,1,5,9,1,10,80,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uspecial_ground_hitbox;
				_hitbox.image_index = 8;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion
				}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 17 - endlag
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 18 - endlag
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 19 - endlag
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 20 - endlag
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 21 - endlag
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 22 - endlag
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 23 - endlag
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;			
				attack_phase++;
				#region non EX
				if sarina_uspecial_ground_ex = false   {attack_frame=3;}
				#endregion
				#region EX
				if sarina_uspecial_ground_ex = true   {attack_frame=2;}
				#endregion
				}
			break;
			}
		#endregion						
		    #region   Finish
		case 22:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=14;
			if (attack_frame==0)
				{
				sarina_uspecial_ground_ex = false;
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