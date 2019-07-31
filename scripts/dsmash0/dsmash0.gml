//Down Smash for character0
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
			anim_sprite=spr_dsmash0;
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
			if (attack_frame==8)
				anim_frame=2;
			if (attack_frame==4)
				anim_frame=3;
		
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=3;
				create_magnetbox(-15,16,1,0.2,4,10,40+hsp,-5,30,5,HITBOX_SHAPE.rectangle,0);
				}
			break;
			}
		//Attack -> Inbetween Phase
		case 2:
			{
			//Animation
			if (attack_frame==2)
				anim_frame=4;
			if (attack_frame==1)
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
				attack_phase++;
				attack_frame=6;
				var _damage = calculate_smash_damage(11);
				create_melee(15,16,1.1,0.2,_damage,7,1.2,30,45,6,HITBOX_SHAPE.rectangle,1);
				}
			break;
			}
		//Attack -> Endlag
		case 4:
			{
			//Animation
			anim_frame=7;
		
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