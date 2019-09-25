//Side special for akuma

var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;

//To change akuma having his f-speical. you will need to go to the check specials script

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
		    #region   Frame starting
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_akuma_dspecial;
			anim_speed=0;
			anim_frame=0;
			attack_frame = 2
			return;
			}						
			#endregion
			
		    #region frame 1
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=0;
			
				attack_phase++;
				attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;				
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
				attack_frame=1;
				}
			break;
			}
			#endregion
			#region   Frame 5
		case 4:
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
			#region   Frame 6
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				attack_frame=2;	
				}
			break;
			}
			#endregion
			#region   Frame 7
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 8 -
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_phase++;
				attack_frame=2;				
				}
			break;
			}
			#endregion
			#region   Frame 9 -
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 10 -
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
			
				attack_phase++;
				attack_frame=2;							
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
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 12 -
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;
			
				attack_phase++;
				attack_frame=2;
				
				}
			break;
			}
			#endregion
			#region   Frame 13
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 14
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 15
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 16
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 17
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 18
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 19
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 20
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 21
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 22
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;
			
				attack_phase++;
				attack_frame=2;
				
				}
			break;
			}
			#endregion
			#region   Frame 23 - splashdown
		case 22:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=22;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,0,2, x +6 * facing,y + 32,1,0) //effect
				audio_play_sound(sfx_akuma_slam,10,false);
				audio_sound_pitch(sfx_akuma_slam,1.2)
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,35,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 24 - splashdown
		case 23:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=23;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,1,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,35,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 1;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 25 - splashdown
		case 24:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=24;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,2,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,30,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 2;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 26 - splashdown
		case 25:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=25;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,3,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,30,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 3;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 27 - splashdown
		case 26:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=26;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,4,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,25,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 4;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 28 - splashdown
		case 27:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=27;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,5,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,25,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 5;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 29 - splashdown
		case 28:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=28;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,6,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,20,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 6;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 30 - splashdown - pause akuma frames
		case 29:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,7,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,20,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 7;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 31 - splashdown
		case 30:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,8,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,10,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 8;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 32 - splashdown
		case 31:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,9,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox
				var _hitbox = create_melee(5,32,1,1,10,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 9;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 33 - splashdown
		case 32:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,10,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,10,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 10;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 34 - splashdown
		case 33:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,11,2, x +6 * facing,y + 32,1,0) //effect
				#region hitbox	
				var _hitbox = create_melee(5,32,1,1,10,10,1,25,90,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_akuma_dspecial_effect;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 11;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region   Frame 35
		case 34:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,12,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 36
		case 35:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,13,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 37
		case 36:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,14,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 38
		case 37:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,15,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 39
		case 38:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;
				fx_create(spr_akuma_dspecial_effect,0,16,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 40
		case 39:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;
				fx_create(spr_akuma_dspecial_effect,0,17,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 41
		case 40:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,18,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 42
		case 41:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=30;
				attack_phase++;
				attack_frame=2;	
				fx_create(spr_akuma_dspecial_effect,0,19,2, x +6 * facing,y + 32,1,0) //effect
				}
			break;
			}
			#endregion
			#region   Frame 43
		case 42:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=31;
				attack_phase++;
				attack_frame=15;	
				}
			break;
			}
			#endregion
			#region   Frame 43
		case 43:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=32;
				attack_phase++;
				attack_frame=2;	
				}
			break;
			}
			#endregion			
		    #region   Finish
		case 44:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=32;
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