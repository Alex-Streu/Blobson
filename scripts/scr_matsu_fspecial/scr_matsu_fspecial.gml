//Forward Special for character0
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
			anim_sprite= spr_matsu_fspecial;
			anim_speed=0;
			anim_frame=0;
			landing_lag = 15;
			parry_stun_time=60;
			set_speed(clamp(hsp,-2,2),clamp(vsp,-2,2),false,false);
			attack_frame=8;
			return;
			}
		//Startup -> First Hitbox
		case 0:
			{
			//Animation
			if (attack_frame==4)
				anim_frame=1;
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				
				set_speed(45*facing,-10,false,false);
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
		//Second Hitbox
		case 1:
			{
			//Continue speed
			set_speed(45*facing,-10,false,false);
			//Move up walls
			if (place_meeting(x+facing,y,obj_solid))
				{
				set_speed(0,-20,true,false);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				
				set_speed(0,-1,false,false);
				attack_phase++;
				attack_frame=7;
				var _magnetbox = create_magnetbox(42,-48,0.7,0.5,7,20,44,-16,20,8,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_magnetbox,HITBOX.base_hitlag,20);	
				}
			break;
			}
			
			//Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				
				if (attack_has_hit())   
				{attack_start(my_attacks[?"Fspec_success"]);}
				else
					{					
					attack_frame=4;
					anim_frame=4;			
				   attack_phase++;
					}

				}
			break;
			}
			
		//Endlag -> Finish
		case 3:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=4;
			if (attack_frame==5)
				anim_frame=5;
			if (attack_frame==3)
				anim_frame=6;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		}
	}
//Movement
move_();