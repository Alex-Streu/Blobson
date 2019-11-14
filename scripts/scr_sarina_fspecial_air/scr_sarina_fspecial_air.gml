//F-special air for sarina
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

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 1;

#region landing lag change if hit
				if (attack_has_hit())   {landing_lag = 3;}
				else                              {landing_lag = 10;}
				#endregion				

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_fspecial_air
			anim_speed=0;
			anim_frame=0;
			attack_frame= 4;
			landing_lag = 10;
			set_speed(0, 0, false, false);
			#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_fspecial_air_ex = false
				if EX_meter >= ex_useage_fspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_fspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_fspecial_air;
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
				attack_phase++;
				set_speed(0, 0, false, false);
				#region If EX version is activated, speed up attack startup
				if sarina_fspecial_air_ex = false   {attack_frame=4;}
				if sarina_fspecial_air_ex = true    {attack_frame=1;}
				#endregion				
				#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_fspecial_air_ex = false
				if EX_meter >= ex_useage_fspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_fspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_fspecial_air;
				}
				#endregion
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
				set_speed(0, 0, false, false);
				#region If EX version is activated, speed up attack startup
				if sarina_fspecial_air_ex = false   {attack_frame=4;}
				if sarina_fspecial_air_ex = true    {attack_frame=1;}
				#endregion				
				#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_fspecial_air_ex = false
				if EX_meter >= ex_useage_fspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_fspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_fspecial_air;
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 4 - lounge
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;				
				attack_phase++;
				change_facing();
				set_speed(10 * facing, 0, false, false);
				attack_frame=1;
				image_alpha = 0.8

				#region Activate EX version
				if (button_hold(INPUT.attack, buff,true))
				if sarina_fspecial_air_ex = false
				if EX_meter >= ex_useage_fspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_fspecial_air_ex = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_fspecial_air;
				}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 5 - lounge 2
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				change_facing();
				set_speed(12 * facing, 0, false, false);
				image_alpha = 0.6;
				if sarina_fspecial_air_ex = false {audio_play_sound(vc_fspecial1,10,false);}
				if sarina_fspecial_air_ex = true {audio_play_sound(vc_fspecial2,10,false);}
				audio_play_sound(snd_fspecial1,10,false);

				}
			break;
			}
			#endregion
			#region   Frame 6 - lounge going invisble
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				set_speed(14 * facing, 0, false, false);
				image_alpha = 0.4;

				}
			break;
			}
			#endregion
			#region   Frame 7 - lounge going invisble
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				set_speed(16 * facing, 0, false, false);
				image_alpha = 0.2;

				}
			break;
			}
			#endregion
			#region   Frame 8 - lounge going invisble
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=6;				
				set_speed(30 * facing, 0, false, false);
				image_alpha = 0;

				}
			break;
			}
			#endregion
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				#region If EX version is activated, speed up attack
				if sarina_fspecial_ground_ex = false   {attack_frame=4;}
				if sarina_fspecial_ground_ex = true    {attack_frame=2;}
				#endregion			
				set_speed(24 * facing, 0, false, false);
				image_alpha = 0;
				//Invulnerability
				set_invulnerable(INV.invincible, 8);

				}
			break;
			}
			#endregion
			#region   Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				image_alpha = 0.25;
				}
			break;
			}
			#endregion
			#region   Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				image_alpha = 0.5;
				}
			break;
			}
			#endregion
			#region   Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=1;				
				image_alpha = 0.75;
				}
			break;
			}
			#endregion
			#region   Frame 13 - hitboxes
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;				
				attack_phase++;
				attack_frame=3;				
				image_alpha = 1;
				audio_play_sound(snd_fspecial2,10,false);
				#region EX version and non ex version hitboxes
				   if sarina_fspecial_air_ex = false   //Non ex version
				   {
				    var _hitbox = create_melee(0,0,1,1,7,8,0.5,10,75,3,HITBOX_SHAPE.circle,1,FLIPPER.from_player_center_horizontal);
				    _hitbox.sprite_index = spr_sarina_fspecial_air_hitbox;
				    _hitbox.image_speed = 0;
				    if (facing == -1) {_hitbox.image_xscale *= -1;}
				    _hitbox.image_index = anim_frame;
				    set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fspecial_hit);
					}
					
					 if sarina_fspecial_air_ex = true   //EX version
				   {
				    var _hitbox = create_melee(0,0,1,1,9,10,1,15,75,3,HITBOX_SHAPE.circle,1,FLIPPER.from_player_center_horizontal);
				    _hitbox.sprite_index = spr_sarina_fspecial_ground_hitbox;
				    _hitbox.image_speed = 0;
				    if (facing == -1) {_hitbox.image_xscale *= -1;}
				    _hitbox.image_index = anim_frame;
				    set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fspecial_ex_hit);
					}
					
					
				
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 14
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;				
				attack_phase++;
				attack_frame = 2
				}
			break;
			}
			#endregion
			#region   Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;				
				attack_phase++;
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 16
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;				
				attack_phase++;
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 17
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;				
				attack_phase++;
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 18
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;				
				attack_phase++;
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 19
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;				
				attack_phase++;
				attack_frame = 2;
				}
			break;
			}
			#endregion
			#region   Frame 20
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 21
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
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
				anim_frame=14;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
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
				anim_frame=15;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
				#endregion
				if sarina_fspecial_air_ex = true     
				{landing_lag = 5; attack_stop(PLAYER_STATE.aerial);}
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
				anim_frame=16;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
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
				anim_frame=17;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
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
				anim_frame=18;				
				attack_phase++;
				#region If EX version is activated, speed up attack endlag
				if sarina_fspecial_air_ex = false    {attack_frame=1;}
				if sarina_fspecial_air_ex = true    {attack_frame = 2;}
				#endregion
				}
			break;
			}
			#endregion
		    #region   Finish
		case 25:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=18;
			if (attack_frame==0)
				{
				
				if sarina_fspecial_air_ex = false
				{
				if (attack_has_hit())   
				{landing_lag = 5 attack_stop(PLAYER_STATE.aerial);}
				else                            
				{landing_lag = 10; attack_stop(PLAYER_STATE.helpless);}
				}
				
				
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion
	
	
	
//Movement
Speed_Fraction();
move_x();
if anim_frame > 5 {move_y();}