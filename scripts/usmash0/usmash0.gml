//Up Smash for character0
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(slide_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_usmash0;
			anim_frame=0;
			anim_speed=0;
		
			charge=0;
		
			attack_frame=2;
			return;
			}
		//Charging -> Startup
		case 0:
			{
			//Animation (every 8 frames switch the sprite)
			if (charge % 8 == 0)
				{
				if (anim_frame==0)
					{
					anim_frame=1;
					}
				else
					{
					anim_frame=0;
					}
				}
			
			charge++;
			if ((charge>=smash_attack_max_charge || !button_hold(INPUT.smash,1)) && attack_frame==0)
				{
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
		//Startup -> Attack
		case 1:
			{
			//Animation
			anim_frame=1;
		
			//Attack First Part
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;
				var _damage = calculate_smash_damage(15);
				var _hitbox = create_melee(35,-5,0.5,0.6,_damage,11,1,15,75,1,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
				}
			break;
			}
		//Attack -> Attack
		case 2:
			{
			//Attack Second Part
			if (attack_frame==1)
				{
				//Animation
				anim_frame=3;
				var _damage = calculate_smash_damage(15);
				var _hitbox = create_melee(24,-37,0.5,0.9,_damage,11,1,15,75,3,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong2);
				}
			//Attack Third Part
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				var _damage = calculate_smash_damage(14);
				var _hitbox = create_melee(-5,-40,1,0.7,_damage,9,1,15,90,2,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_weak2);
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
		//Attack -> Endlag
		case 3:
			{
			//Attack Fourth Part
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
				var _damage = calculate_smash_damage(13);
				var _hitbox = create_melee(-19,-15,0.8,1,_damage,6,1,15,120,4,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				
				attack_phase++;
				attack_frame=20;
				}
			break;
			}
		//Finish
		case 4:
			{
			//Animation
			if (attack_frame==14)
				anim_frame=6;
			if (attack_frame==7)
				anim_frame=7;
		
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_grounded_();