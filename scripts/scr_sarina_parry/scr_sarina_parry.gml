///Parry for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : parry_phase;
//Timer
parry_frame=max(--parry_frame,0);
friction_gravity(slide_friction);
//Cancel in air
if (run && !on_ground())
	{
	set_state(PLAYER_STATE.aerial);
	run=false;
	}
#region Transition through phases of parrying
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = my_sprites[?"Parry" ]
			fx_create(spr_fx_parry,1.5,0,18, x +19 * facing,y - 62,1,0);
			anim_speed=0;
			anim_frame=0;
			return;
			}
		case 0:
			{
			//Animation
			if (parry_frame==1)
				anim_frame=1;
			else
				anim_frame=0;
			
			if (parry_frame==0)
				{
				//Animation
				anim_frame=2;
				
				//Next phase
				parry_phase++;
				parry_frame=parry_active;
				//Invulnerability
				set_invulnerable(INV.parry,parry_active);
				}
			break;
			}
		case 1:
			{
			//Animation
			if (parry_frame==4)
				anim_frame=3;
			
			if (parry_frame==0)
				{
				parry_phase=3;
				parry_frame=parry_endlag;
				}
			break;
			}
		case 3:
			{
			//Animation
			if (parry_frame==15)
				anim_frame=4;
			if (parry_frame==10)
				anim_frame=4;
			if (parry_frame==5)
				anim_frame=5;
				
			//End parry
			if (parry_frame==0)
				{
				parry_phase=0;
				
				//Back to Idle State
				set_state(PLAYER_STATE.idle);
				}
			break;
			}
		case PHASE.parry:
			{
			/*Parry has been triggered by a hitbox*/
			set_invulnerable(INV.invincible,parry_invincible_time);
			if (parry_frame>14)
				anim_frame=6;
			if (parry_frame==13)
				anim_frame=7;
			if (parry_frame==12)
				anim_frame=8;
			if (parry_frame==10)
				anim_frame=9;
			if (parry_frame==8)
				anim_frame=10;
			if (parry_frame==5)
				anim_frame=11;
			if (parry_frame==3)
				anim_frame=12;
				
			if (parry_frame==0)
				{
				parry_phase=3;
				parry_frame=10;
				}
			}
		default: break;
		}
	}
#endregion
move_grounded_();