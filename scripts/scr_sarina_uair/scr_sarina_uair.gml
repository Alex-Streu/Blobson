//Upward Aerial for Sarina - full power
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
meter_gain = 7;
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
			anim_sprite= my_sprites[?"Uair"];
			anim_speed=0;
			anim_frame=0;
			attack_frame=3;
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
				attack_frame=3;
				audio_play_sound(choose(vc_fair1,vc_fair2,sfx_nothing),10,false);
				}
			break;
			}
			#endregion
			#region Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;
				
                audio_play_sound(snd_dair,10,false);

				}
			break;
			}
			#endregion
			#region Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;			
				attack_phase++;
				attack_frame=3;
				
				}
			break;
			}
			#endregion
			#region Frame 5 - hitboxes: Tipper, Sour, and normal hitbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=2;					
				
				#region tipper
				var _hitbox = create_melee(0,0,1,1,9,8,1,15,70,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uair_tipper;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 0;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,5,5,1,10,60,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 4;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 4;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_sourhit);
				#endregion
				
				}
			break;
			}
			#endregion
	        #region Frame 6 - hitboxes: Tipper, Sour, sweet, and normal hitbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame = 2
				
				#region tipper
				var _hitbox = create_melee(0,0,1,1,9,5,1,15,75,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uair_tipper;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 1;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion
				#region sweetbox
				var _hitbox = create_melee(0,0,1,1,5,10,1,10,90,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uair_sweetbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 0;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_sweethit);
				#endregion
				#region hitbox
				var _hitbox = create_melee(0,0,1,1,5,5,1,10,80,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_uair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,3,1,10,70,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_uair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_uair_sourhit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 7 - whiff lag + landing lag change
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
                #region whiff lag + change landing lag
				if (attack_has_hit())   {attack_frame =3;   landing_lag = 3;}
				else                              {attack_frame =4;   landing_lag = 10;}
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
				if (attack_has_hit())   {attack_frame =3;}
				else                              {attack_frame =5;}
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

	        #region Finish
		case 10:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=10;
			
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
	
	
	
	