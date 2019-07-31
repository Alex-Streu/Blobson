//Forward Smash for character0
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
			anim_sprite=spr_fsmash0;
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
				attack_frame=8;
				}
			break;
			}
		//Startup -> First Hit
		case 1:
			{
			//Animation
			anim_frame=1;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				
				set_speed(facing*4,0,false,false);
				attack_phase++;
				attack_frame=6;
				var _damage = calculate_smash_damage(4);
				create_melee(30,0,1.2,0.7,_damage,3,0,10,40,3,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//First Hit -> Second Hit
		case 2:
			{
			//Animation
			if (attack_frame<=4)
			anim_frame=3;
			if (attack_frame<=2)
			anim_frame=4;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				set_speed(0,0,false,false);
				attack_phase++;
				attack_frame=6;
				var _damage = calculate_smash_damage(5);
				create_melee(30,0,1.2,0.7,_damage,2,0,12,160,3,HITBOX_SHAPE.circle,1);
				}
			break;
			}
		//Second Hit -> Third Hit
		case 3:
			{
			//Animation
			if (attack_frame<=4)
			anim_frame=6;
			if (attack_frame<=2)
			anim_frame=7;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				
				set_speed(facing*4,0,false,false);
				attack_phase++;
				attack_frame=10;
				var _damage = calculate_smash_damage(8);
				create_melee(30,0,1.2,0.7,_damage,9,1.3,30,40,7,HITBOX_SHAPE.circle,2);
				}
			break;
			}
		//Third Hit -> Endlag
		case 4:
			{
			//Animation
			if (attack_frame==7)
				anim_frame=9;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
			
				set_speed(0,0,false,false);
				attack_phase++;
				attack_frame=14;
				}
			break;
			}
		//Finish
		case 5:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=11;
				
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