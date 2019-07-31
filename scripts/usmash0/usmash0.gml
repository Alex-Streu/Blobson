//Up Smash for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(slide_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
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
		
			smash_charge=0;
		
			attack_frame=smash_attack_max_charge;
			return;
			}
		//Charging -> Startup
		case 0:
			{
			//Animation (every 8 frames switch the sprite)
			if (smash_charge % 8 == 0)
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
			
			smash_charge++;
			if (smash_charge>=smash_attack_max_charge || attack_frame==0 || !button_hold(INPUT.smash,1))
				{
				attack_phase++;
				attack_frame=10;
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
				create_melee(35,-5,0.5,0.6,_damage,11,1,15,75,4,HITBOX_SHAPE.circle,0);
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
				create_melee(24,-37,0.5,0.9,_damage,11,1,15,75,4,HITBOX_SHAPE.circle,0);
				}
			//Attack Third Part
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				var _damage = calculate_smash_damage(15);
				create_melee(-5,-40,1,0.7,_damage,9,1,15,90,3,HITBOX_SHAPE.circle,0);
			
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
				var _damage = calculate_smash_damage(15);
				create_melee(-19,-15,0.8,1,_damage,6,1,15,120,4,HITBOX_SHAPE.circle,0);
			
				attack_phase++;
				attack_frame=15;
				}
			break;
			}
		//Finish
		case 4:
			{
			//Animation
			if (attack_frame==10)
				anim_frame=6;
			if (attack_frame==5)
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