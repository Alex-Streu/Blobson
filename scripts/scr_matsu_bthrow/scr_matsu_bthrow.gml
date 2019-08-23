//Downward Throw for character0
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
			anim_sprite = my_sprites[?"Bthrow" ];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=10;
			attack_phase++;
			
			//No speed
			set_speed(0,0,false,false);
			
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 16 * facing;
			grabbed_id.grab_hold_y = -24;
			return;
			}
			
			//frame 2
			case 0:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=1;
			attack_frame=4;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 22 * facing;
			grabbed_id.grab_hold_y = -48;
			attack_phase++;
			}
			break;
			}
			
			//frame 3
			case 1:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=2;
		
			attack_frame=4;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 18 * facing;
			grabbed_id.grab_hold_y = -56;
			attack_phase++;
			}
			break;
			}
			
			//frame 4
			case 2:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=3;		
			attack_frame=4;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 0 * facing;
			grabbed_id.grab_hold_y = - 40;
			attack_phase++;
			}
			break;
			}
			
			//frame 5
			case 3:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=4;
		
			attack_frame=4;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = -40 * facing;
			grabbed_id.grab_hold_y = 12;
			attack_phase++;
			
			//var _hitbox = create_targetbox(10,16,0.4,0.4,1,5,0,3,45,1,HITBOX_SHAPE.circle,0,grabbed_id);
			//set_hitbox_property(_hitbox,HITBOX.knockback_state,PLAYER_STATE.is_grabbed);
			create_melee(-28,-52,0.7,0.5,7,11,0.5,5,140,1,HITBOX_SHAPE.rectangle,1);
			//audio_play_sound(sfx_hit_1,5,false);
			}
			break;
			}
			
			//frame 6
			case 4:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=5;
		
			attack_frame=9;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 0 * facing;
			grabbed_id.grab_hold_y = - 0;
			attack_phase++;
			}
			break;
			}
			
			//frame 6
			case 5:
			{
				if (attack_frame==0)
				{
			//Animation
			anim_frame=6;
		
			attack_frame=3;						
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 0 * facing;
			grabbed_id.grab_hold_y = - 0;
			attack_phase++;
			}
			break;
			}

		//Endlag -> Finish
		case 6:
			{
					if run && cancel_jump_check()	run=false;
			//Animation
			if (attack_frame=12)
				anim_frame=11;
			if (attack_frame=8)
				anim_frame=12;
			if (attack_frame=4)
				anim_frame=13;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			}
		}
	}
//No movement