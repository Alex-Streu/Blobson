//Parry startup
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);

#region Cancel if in the air
if (run && !on_ground())
	{
	set_state(PLAYER_STATE.aerial);
	run=false;
	}
	#endregion

//Phases
if (run)
	{
	switch(_phase)
		{
		#region Frame 1
		case PHASE.start:
			{
			//Animation
			//Frame 1
			anim_sprite = my_sprites[?"Parryland" ];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=2;
			return;
			}
			#endregion			
		#region Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
		
		#region Finish/Final Frame
		case 1:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=40;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
			#endregion
		}
	}
	
//Movement
move_grounded_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}