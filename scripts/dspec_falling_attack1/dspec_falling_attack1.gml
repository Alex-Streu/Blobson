//Sarina Down Special
/*
- Falls quickly and spikes opponents
- The grounded version jumps up into the air first
- Has a hitbox when touching the ground
- You can jump cancel the fall, provided you have midair jumps left
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Phases
if (run)
	{
	switch(_phase)
			{
			case PHASE.start:
			{
			//Animation
			anim_sprite=spr_dspec_falling_attack;
			anim_frame=0;
			anim_speed=0;
			//Ground v.s. Air startup
			if (!on_ground())
				{
				attack_frame=17;
				attack_phase=0;
				set_speed(0,0,true,false);
				}
			else
				{
				set_speed(4*facing,-8.5,false,false);
				attack_frame=14;
				attack_phase=4;
				}
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame<7)
				{
				anim_frame=1;
				}
			
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=90;
				create_melee(16,32,0.6,0.6,7,4,1,10,300,90,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation - every 2 frames
			if (attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame==6)
					{
					anim_frame=2;
					}
				}
			//Jump Cancel
			if (cancel_jump_check()) return;
			//Speed Values
			set_speed(6*facing,16,false,false);
			//Hitting the ground causes a ground pound
			if (on_ground())
				{
				//Cancel movement
				set_speed(0,0,true,false);
				//Destroy the falling hitbox
				destroy_all_attached_hitboxes(my_hitboxes);
			
				//Make an explosion hitbox
				create_melee(0,16,1,0.5,7,11,0.1,20,45,7,HITBOX_SHAPE.circle,1);
				attack_phase=2;
				attack_frame=20;
				}
			//Normal ending
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		//Ground pound version
		case 2:
			{
			//Friction / Gravity
			friction_gravity(ground_friction,grav,max_fall_speed);
			//Enable ledge cancel
			if cancel_air_check() return;
			//Animation
			if (attack_frame>17)
				anim_frame=7;
			else
			if (attack_frame>13)
				anim_frame=8;
			else
			if (attack_frame>10)
				anim_frame=9;
			else
			if (attack_frame>7)
				anim_frame=10;
			else
			if (attack_frame>4)
				anim_frame=11;
		
			if (attack_frame==0)
				{
				attack_phase=3;
				attack_frame=5;
				}
			break;
			}
		//Finish
		case 3:
			{
			//Animation
			anim_frame=0;
		
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		//Alternate on-ground version startup.
		case 4:
			{
			if (attack_frame==0)
				{
				attack_phase=0;
				set_speed(0,0,false,false);
				attack_frame=3;
				}
			break;
			}
		}
	}
//Movement
move_();