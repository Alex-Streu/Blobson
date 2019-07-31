//Ledge Attack for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_matsu_ledgeattack;
			anim_speed= 0;
			anim_frame=0;
		
			attack_frame=3;
			audio_play_sound(sfx_whoosh_2,5,false)
			return;
			}
			
					//Startup frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
				
		//Active frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=4;
				var _hitbox = create_melee(0,0,1,1,6,9,0.6,3,40,4,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_matsu_ledgeattack_hb;
				if (facing == -1) {_hitbox.image_xscale *= -1;}				
				
				}
			break;
			}
			
		//Active -> Endlag
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame = attack_has_hit() ? 3 : 5;
				}
			break;
			}
			
								//Startup frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
											//Startup frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
														//Startup frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
														//Startup frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			
		//Finish
		case 7:
			{
			//Animation
			if (attack_frame==3)
				anim_frame=5;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run=false;
				}
			break;
			}
		}
	}
//Movement
move_grounded_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}