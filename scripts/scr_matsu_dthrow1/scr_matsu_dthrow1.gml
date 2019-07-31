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
			anim_sprite = my_sprites[?"Dthrow" ];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=10;
			
			//No speed
			set_speed(0,0,false,false);
			
			//Move the grabbed player below
			grabbed_id.grab_hold_x = -16 * facing;
			grabbed_id.grab_hold_y = 32;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame==6)
				anim_frame=1;
			if (attack_frame==3)
				anim_frame=2;
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=15;
				var _hitbox = create_targetbox(10,16,0.4,0.4,1,5,0,3,45,1,HITBOX_SHAPE.circle,0,grabbed_id);
				set_hitbox_property(_hitbox,HITBOX.knockback_state,PLAYER_STATE.is_grabbed);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Multihits
			if (attack_frame % 2 == 0 && attack_frame != 0)
				{
				//Animation
				anim_frame++;
				
				reset_hitbox_groups(collided);
				var _hitbox = create_targetbox(10,16,0.4,0.4,1,5,0,5,irandom(360),1,HITBOX_SHAPE.circle,0,grabbed_id);
				set_hitbox_property(_hitbox,HITBOX.knockback_state,PLAYER_STATE.is_grabbed);
				}
			//Final Blow
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
				
				attack_phase++;
				attack_frame=15;
				create_melee(10,16,0.4,0.4,7,15,0.3,10,75,1,HITBOX_SHAPE.circle,1);
				}
			break;
			}
		//Endlag -> Finish
		case 2:
			{
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