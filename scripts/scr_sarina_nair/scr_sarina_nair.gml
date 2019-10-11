//Net Aerial for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();

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
			anim_sprite= my_sprites[?"Nair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
			attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
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
				audio_play_sound(snd_nair,10,false);
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
				var _hitbox = create_melee(0,0,1,1,6,5,0.5,10,70,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);				
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,4,0.3,6,35,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_sarina_nair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_sourhit);
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
				attack_frame = 2;
				#region Landing lag descrease if attack was landed
				if (attack_has_hit())   {landing_lag=3;}
				else                              {landing_lag=10;}
				#endregion
				#region jump boost if meter is enough and special is held
				if (attack_has_hit())  
				if (button_hold(INPUT.special,buff))
				{set_speed(0,-11)}
				else {					EX_meter += 0;}
				#endregion 			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,6,5,0.5,10,70,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,4,0.3,6,35,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_sourhit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 7 - hitboxes
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
				
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,6,5,0.5,10,130,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_hit);
				#endregion
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,4,0.3,6,145,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_sourhit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 8 - sourbox
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;			
				attack_phase++;
				attack_frame = 2;
				#region sour hitbox
				var _hitbox = create_melee(0,0,1,1,5,2,0,6,160,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_nair_sourbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_nair_sourhit);
				#endregion
				#region Landing lag descrease if attack was landed
				if (attack_has_hit())   {landing_lag=3;}
				else                              {landing_lag=10;}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 9 - landing lag change
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2; landing_lag=10;}
				else                              {attack_frame =4;}
				#endregion				
				#region Landing lag descrease if attack was landed
				if (attack_has_hit())   {landing_lag=3;}
				else                              {landing_lag=10;}
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
	
	#region Canceling
if run && cancel_ground_check() 
{
	#region EX meter
				if (attack_has_hit())   {EX_meter += ex_sarina_nair;}
				else                              {EX_meter += 0;}
				#endregion	
    run=false;
}
#endregion
	
	