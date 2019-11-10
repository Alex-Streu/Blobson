//Backward Aerial for Sarina - scythe variant
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

#region landing lag change if hit
				if (attack_has_hit())   {landing_lag = 3;}
				else                              {landing_lag = 10;}
				#endregion				

//How much EX_meter is gained upon landing the attack.
meter_gain = 6;
meter_gain_magnet = 1;

//Phases
if (run)
	{
	switch(_phase)
		{
			#region Frame 1 + settings
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Bair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
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
				
				audio_play_sound(snd_bair1,10,false); 
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
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 5 - hitboxes
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=2;	
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,5,4,0.5,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_bair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair1_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,4,3,0.5,10,130,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_bair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair1_hit);
				#endregion
				}
			break;
			}
			#endregion
	        #region Frame 6 - hitbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				attack_frame = 2;
				#region Landing lag descrease if attack was landed
				if (attack_has_hit())   {landing_lag=3;}
				else                              {landing_lag=10;}
				#endregion
				#region tipperhitbox
				var _hitbox = create_melee(0,0,1,1,8,8,1,10,130,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_bair_tipper;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair1_sweethit);
				#endregion
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,6,6,0.6,10,130,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_bair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair1_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,4,4,0.3,10,130,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_bair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair1_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 7 - hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				#region Landing lag descrease if attack was landed
				if (attack_has_hit())   {landing_lag=3;}
				else                              {landing_lag=10;}
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
				if (attack_has_hit())   {attack_frame =2;}
				else                              {attack_frame =3;}
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
				if (attack_has_hit())   {attack_frame =2; landing_lag=3;}
				else                              {attack_frame =4;   landing_lag=10;}
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
	        #region Finish
		case 11:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=12;
			
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
	
	
	
	