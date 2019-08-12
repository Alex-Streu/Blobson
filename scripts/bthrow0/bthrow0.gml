//Backward Throw for character0
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
			anim_sprite=spr_bthrow0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=10;
			
			//No speed
			set_speed(0,0,false,false);
			
			//Move the grabbed player behind
			grabbed_id.grab_hold_x = -sign(facing)*60;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=15;
				var _hitbox = create_melee(-32,-2,1,0.6,9,7,1.1,15,140,4,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong2);
				}
			break;
			}
		//Active -> Finish
		case 1:
			{
			//Animation
			if (attack_frame==13)
				{
				anim_frame=2;
				}
			if (attack_frame==10)
				{
				anim_frame=3;
				}
			if (attack_frame==6)
				{
				anim_frame=4;
				}
			if (attack_frame==4)
				{
				anim_frame=5;
				}
			//Cancels
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//No movement