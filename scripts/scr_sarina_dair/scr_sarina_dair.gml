//Downward Aerial for Sarina - full power
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 0;

//Phases
if (run)
	{
	switch(_phase)
		{
			#region Frame 1 + settings
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Dair"];
			anim_speed=0;
			anim_frame=0;
			attack_frame=4;
			landing_lag=10;
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
				audio_play_sound(choose(vc_fair1,vc_fair2,sfx_nothing),10,false);
				}
			break;
			}
			#endregion
			#region Frame 3 - sour hitboxes
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=2;
				
                audio_play_sound(snd_dair,10,false);

				}
			break;
			}
			#endregion
			#region Frame 4 - hitboxes
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;			
				attack_phase++;
				attack_frame=2;
	
	            #region hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_dair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 3;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_dair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 3;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				
				}
			break;
			}
			#endregion
			#region Frame 5 - hitboxes (tipper)
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=2;					
				
				#region tipper
				var _hitbox = create_melee(0,0,1,1,10,6,1,15,70,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_dair_tipper;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 0;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_sweetspot_hit);
				#endregion
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_dair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 4;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_dair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 4;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				
				}
			break;
			}
			#endregion
	        #region Frame 6 - hitboxes
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame = 2
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_dair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 5;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_dair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 5;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 7 - sour hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_dair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 6;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;			
				attack_phase++;
				
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2;   landing_lag = 3;}
				else                              {attack_frame =3;   landing_lag = 10;}
				#endregion				
				
				}
			break;
			}
			#endregion
			#region Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion
			#region Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=9;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=10;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=11;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 13
		case 11:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=12;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 14
		case 12:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=13;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=14;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 16
		case 14:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=15;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
			#region Frame 17
		case 15:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=16;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				}
			break;
			}
			#endregion			
	        #region Finish
		case 16:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=16;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
			#endregion
		}
	}
//Movement
move_();
	
	
	
	