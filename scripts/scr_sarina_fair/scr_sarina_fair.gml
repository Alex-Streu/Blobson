//Forward Aerial for Takia
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
//Phases
if (run)
	{
	switch(_phase)
		{
			#region Frame 1 + settings
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Fair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
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
				attack_frame=4;
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
				audio_play_sound(snd_fair,10,false);
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
				
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,7,5,1.1,17,45,2,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_sarina_fair_hitboxes;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = 1;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_fair_hitboxes;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 0;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_fair_hitboxes;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = 2;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				
				}
			break;
			}
			#endregion
	        #region Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
				#endregion				
				landing_lag = 3
				}
			break;
			}
			#endregion
			#region Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
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
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =3}
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
	        #region Finish
		case 9:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=9;
			
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
	
	
	
	