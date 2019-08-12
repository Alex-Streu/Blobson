//Up Aerial for character0
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_uair0;
			anim_speed=0;
			anim_frame=0;
			
			landing_lag=7;
			set_speed(0,-1,true,true);
			attack_frame=8;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==4)
				{
				anim_frame=1;
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				
				attack_phase++;
				attack_frame=19;
				//Initial hit
				var _hitbox = create_melee(30,-28,1,0.9,10,7,0.9,10,82,2,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_weak2);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==17)
				{
				anim_frame=3;
				//Initial hit
				create_melee(30,-36,1.2,0.5,10,7,0.9,8,82,2,HITBOX_SHAPE.rectangle,0);
				}
			if (attack_frame==16)
				{
				anim_frame=4;
				//Long lasting hit
				create_melee(30,-32,0.9,0.3,8,5,0.8,4,82,16,HITBOX_SHAPE.rectangle,0);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 3 : 10;
				}
			break;
			}
		//Finish
		case 2:
			{
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();