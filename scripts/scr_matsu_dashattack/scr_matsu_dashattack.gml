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
			anim_sprite = my_sprites[?"Dashattack" ];
			anim_speed=0;
			anim_frame=0;
			set_speed(3*facing,-3,false,false);
			vsp=0;
			attack_frame=9;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==6)
			set_speed(8*facing,-3,false,false);
				anim_frame=1;
			if (attack_frame==0)
				{
					//Speed
				set_speed(8*facing,-3,false,false);
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=8;
				
				var _hitbox = create_melee(28,-28,1.5,0.5,7,5,1,14,45,8,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_dashattack_hit);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Grab ledges
			if check_ledge_grab() return;
			
			//Speed
			set_speed(13*facing,-3,false,false);
			
			//Animation
			if (attack_frame%3==0)
				{
				anim_frame=anim_frame>=7 ? 3 : anim_frame+1;
				}			
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				
				//Whiff lag
				if (attack_has_hit())
					{
					attack_frame=5;
					attack_phase=2;
					}
				else
					{
						friction_gravity(air_friction,grav,max_fall_speed);
					attack_frame=10;
					attack_phase=3;					
					}
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
				anim_frame=6;
				
			
			//Speed
		//friction_gravity(0.5);
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		//Alternate lag finish
		case 3:
			{
			//Animation
			if (attack_frame>14)
				{
				if (attack_frame%3==0)
					{
					anim_frame=anim_frame>=7 ? 3 : anim_frame+1;
					}
				}
			else if (attack_frame>8)
				{
				anim_frame=6;
				}
			else
				{
				anim_frame=6;
				}
			
			//Speed
			friction_gravity(0.2,0.2,1);
			
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