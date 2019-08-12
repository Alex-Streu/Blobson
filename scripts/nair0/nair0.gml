//Neutral Aerial for character0
//Logic Control Variable
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
aerial_drift();
allow_hitfall();
//Cancels
if run && cancel_ground_check()	run = false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		//Initialize
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_nair0;
			anim_speed=0;
			anim_frame=0;
			landing_lag=5;
			attack_frame=6;
			set_speed(0,-1,true,true);
			return;
			}
		//Startup
		case 0:
			{
			if (attack_frame==3)
				{
				anim_frame=1;
				}
			if (attack_frame==0)
				{
				anim_frame=2;
				create_melee(-27,-17,1,1,8,6,0.6,6,50,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				attack_frame=14;
				attack_phase++;
				}
			break;
			}
		//Active
		case 1:
			{
			if (attack_frame==12)
				{
				anim_frame=3;
				create_melee(9,-25,1,1,8,8,0.6,4,50,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame==10)
				{
				anim_frame=4;
				create_melee(24,-5,1,1,8,8,0.6,4,50,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame==8)
				{
				anim_frame=5;
				create_melee(21,12,1,1,8,8,0.6,4,50,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame==6)
				{
				anim_frame=6;
				create_melee(4,29,1,1,8,5,0.6,4,50,3,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame==3)
				{
				anim_frame=7;
				create_melee(-20,15,1,1,8,5,0.6,4,50,3,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame==0)
				{
				anim_frame=8;
				if (attack_has_hit())
					{
					attack_frame = 7;
					landing_lag = 4;
					}
				else
					{
					attack_frame = 10;
					}
				attack_phase++;
				}
			break;
			}
		//Endlag
		case 2:
			{
			if (attack_frame==5)
				{
				anim_frame=9;
				}
			//Jump cancel out of lag
			if run && cancel_jump_check()	run = false;
			if (attack_frame==0)
				{
				//Revert back to the original state - may be idle, aerial, crouching, etc.
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_();