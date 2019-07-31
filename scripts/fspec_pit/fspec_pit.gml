//Forward Special
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
			anim_sprite=spr_fspec_pit;
			anim_frame=0;
			anim_speed=0;
		
			attack_frame=18;
			return;
			}
		//Startup -> Run forward
		case 0:
			{
			//Animation - change every 2 frames
			if (attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame>3)
					{
					anim_frame=0;
					}
				}
			change_facing();
			set_speed(0,0,false,false);
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=24;
				}
			break;
			}
		//Run forward -> Active
		case 1:
			{
			//Animation - change every 2 frames
			if (attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame>3)
					{
					anim_frame=0;
					}
				}
			
			set_speed(9*facing,0,false,false);
			//If the opponent is hit, auto attack
			if (instance_place_list(x,y,obj_player,global.col_list,false))
				{
				for(var i=0;i<ds_list_size(global.col_list);i++)
					{
					if (is_alive(global.col_list[|i]))
						{
						attack_phase++;
						attack_frame=18;
						create_melee(6,0,1,1,10,6,1.2,4,90,8,HITBOX_SHAPE.circle,1);
						break;
						}
					}
				}
			else
			//End attack in a failure
			if (attack_frame==0)
				{
				attack_phase=4;
				attack_frame=28;
				}
			ds_list_clear(global.col_list);
			break;
			}
		//Active -> Endlag
		case 2:
			{
			//Animation
			if (attack_frame>7)
				anim_frame=4;
			if (attack_frame>4)
				anim_frame=5;
			else
				anim_frame=6;
		
			set_speed(0,-1,false,false);
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=14;
				}
			break;
			}
		//Finish
		case 3:
			{
			//Animation
			if (attack_frame>10)
				anim_frame=7;
			else
			if (attack_frame>5)
				anim_frame=8;
			else
				anim_frame=9;
			
			friction_gravity(air_friction,grav,max_fall_speed);
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		//No attack finish
		case 4:
			{
			//Animation
			anim_frame=10;
			anim_speed=0;
		
			friction_gravity(ground_friction,grav,max_fall_speed);
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