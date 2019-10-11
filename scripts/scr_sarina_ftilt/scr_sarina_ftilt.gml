//Forward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 1;
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
			anim_sprite= my_sprites[?"Ftilt"];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame= 2;
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
				attack_frame=2;
				}
			break;
			}
			#endregion
		    #region   Frame 4
		case 2:
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
				attack_frame=3;
				
				audio_play_sound(choose(vc_ftilt1,vc_ftilt2,vc_ftilt3),10,false);
				
				var _hitbox = create_magnetbox(32,-64,1.3,0.5,2,5,112,-8,10,3,HITBOX_SHAPE.rectangle,0)
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_firsthit);
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
				attack_frame=1;
				#region magnet box first one
				var _hitbox = create_magnetbox(0,0,1,1,1,6,112,-16,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_firsthit);
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
				attack_frame = 3;
				audio_play_sound(snd_ftilt_loop,10,false);
				}
			break;
			}
		#endregion				
			#region   Frame 9 - hitbox A
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;				
				attack_frame = 1;
			
				
				#region reset hitboxes
				reset_hitbox_group(collided, 1); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 10 - hitbox A
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 11 - Hitbox B
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;				
				attack_frame = 1;
				
				audio_play_sound(snd_ftilt_loop,10,false);
				
				#region reset hitboxes
				reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 12 - Hitbox B
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 13 - Hitbox A
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;			
				attack_phase++;				
				attack_frame = 1;
				
				audio_play_sound(snd_ftilt_loop,10,false);
				
				#region reset hitboxes
				reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 14 - Hitbox A
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;			
				attack_phase++;				
				attack_frame = 1;
				
				audio_play_sound(snd_ftilt_loop,10,false);
				
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 15 - Hitbox B
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;			
				attack_phase++;				
				attack_frame = 1;
				
				audio_play_sound(snd_ftilt_loop,10,false);
				
				#region reset hitboxes
				reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 16 - Hitbox B
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,20,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 17 - Hitbox A
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_group(collided, 0); //reset hitbox so next one can connect
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,1,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 18 - Hitbox A
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,1,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 19 - Hitbox B
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,1,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 20 - Hitbox B
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,1,1,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 21 - start super fast hits
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 22
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;			
				attack_phase++;				
				attack_frame = 1;
				
				audio_play_sound(snd_ftilt_loop,10,false);
				
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 23
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=22;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 24
		case 22:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=23;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 25
		case 23:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=24;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-16,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 26
		case 24:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=25;			
				attack_phase++;				
				attack_frame = 1;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_magnetbox(0,0,1,1,1,2,112,-2,1,1,HITBOX_SHAPE.rectangle,2)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 27 - final hit
		case 25:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=26;			
				attack_phase++;				
				attack_frame = 2;
				#region reset hitboxes
				reset_hitbox_groups()
				var _hitbox = create_melee(0,0,1,1,1,7,1,8,45,2,HITBOX_SHAPE.rectangle,0)
				_hitbox.sprite_index = spr_sarina_ftilt_hitbox;
				_hitbox.image_index = anim_frame;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_endhit);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 28
		case 26:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=27;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else   {attack_frame =6}
				#endregion			
				
				#region Dash Cancel
				if (attack_has_hit())   { if run && check_dash()    hurtbox.sprite_index =spr_sarina_hurtbox;   run=false; } //Dash cancel			
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 29
		case 27:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=28;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else   {attack_frame =6}
				#endregion				
				
				if (attack_has_hit())   { if run && check_dash() run=false;} //Dash cancel
				}
			break;
			}
			#endregion
			#region   Frame 30
		case 28:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else   {attack_frame =6}
				#endregion				
				}
			break;
			}
			#endregion
			#region   Frame 31
		case 29:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=30;
			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else   {attack_frame =6}
				#endregion				
				}
			break;
			}
			#endregion
		    #region Finish
		case 30:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=0;
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