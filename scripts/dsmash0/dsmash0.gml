//Down Smash for character0
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
			anim_sprite=spr_dsmash0;
			anim_frame=0;
			anim_speed=0;
		
			charge=0;
		
			attack_frame=8;
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
				attack_frame=2;
				}
			break;
			}
		//Startup -> Attack
		case 1:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=2;
			if (attack_frame==4)
				anim_frame=3;
		
			if (attack_frame==0)
				{
				anim_frame=4;
				
				attack_phase++;
				attack_frame=3;
				create_magnetbox(-32,16,0.5,0.2,4,10,40+hsp,-5,30,5,HITBOX_SHAPE.rectangle,0);
				}
			break;
			}
		//Attack -> Inbetween Phase
		case 2:
			{
			//Animation
			if (attack_frame==2)
				anim_frame=5;
			
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
		//Inbetween -> Attack
		case 3:
			{
			//Animation
			anim_frame=6;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				
				attack_phase++;
				attack_frame=6;
				var _damage = calculate_smash_damage(11);
				var _hitbox = create_melee(15,20,1.1,0.4,_damage,7,1.2,30,45,6,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
				}
			break;
			}
		//Attack -> Endlag
		case 4:
			{
			if (attack_frame==0)
				{
				set_speed(0,0,false,false);
				attack_phase++;
				attack_frame=12;
				}
			break;
			}
		//Finish
		case 5:
			{
			//Animation
			if (attack_frame<8)
				anim_frame=8;
		
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