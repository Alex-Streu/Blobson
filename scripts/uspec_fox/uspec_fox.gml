//Up Special for Fox
var run=true;
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
			anim_speed=0;
			anim_frame=0;
			
			set_speed(0,0.5,false,false);
			attack_frame=35;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Multihit Attacks
			if (attack_frame % 4 == 0)
				{
				reset_hitbox_group(collided,0);
				create_melee(0,0,0.8,0.8,1,0,0,4,90,2,HITBOX_SHAPE.circle,0);
				}
			if (attack_frame==0)
				{
				//Point in the correct direction
				var _dir=(stick_tilted(Lstick)) ? stick_get_direction(Lstick) : 90;
				var _spd=10;
				set_speed(lengthdir_x(_spd,_dir),lengthdir_y(_spd,_dir),false,false);
				destroy_all_attached_hitboxes(my_hitboxes);
				create_melee(0,0,1.2,1.2,9,6,0.4,10,_dir,25,HITBOX_SHAPE.circle,1);
				
				attack_frame=25;
				attack_phase++;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Grab ledges
			if check_ledge_grab() return;
			
			if (attack_frame==0)
				{
				attack_frame=1;
				attack_phase++;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Now has friction/gravity
			friction_gravity(air_friction,grav,max_fall_speed);
			if (attack_frame==0)
				{
				set_speed(hsp/2,vsp/2,false,false);
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		}
	}
//Movement
move_();