///Parry for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : parry_phase;
//Timer
parry_frame=max(--parry_frame,0);
friction_gravity(slide_friction);
#region Cancel in air
if (run && !on_ground())
	{
		parry_landed = false;
	set_state(PLAYER_STATE.aerial);
	run=false;
	}
	#endregion
#region Transition through phases of parrying
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			audio_play_sound(snd_parrystart,10,false);
			anim_sprite = my_sprites[?"Parry" ]			
			anim_speed=0;
			anim_frame=0;
			parry_startup_flash = true;
			parry_landed = false;
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
				parry_startup_flash = false;
				}
			break;
			}
		case 3:
			{
			//Animation
			if anim_sprite != my_sprites[?"Parryland" ]
			{
			if (parry_frame==15) anim_frame=4;
			if (parry_frame==12) anim_frame=5;
			if (parry_frame==9)   anim_frame=6;
			if (parry_frame==6)  anim_frame=7;
			if (parry_frame==4)  anim_frame=8;
			if (parry_frame==2)  anim_frame=9;
			}
				
			//End parry
			if (parry_frame==0)
				{
				parry_phase=0;
				
				//Back to Idle State
				if parry_landed = false {parry_cooldown_timer = parry_cooldown_default;}
				if parry_landed = true {parry_cooldown_timer = 2;}
				parry_landed = false;
				parry_startup_flash = false;
				set_state(PLAYER_STATE.idle);
				}
			break;
			}
		case PHASE.parry:
			{
			/*Parry has been triggered by a hitbox*/
			set_invulnerable(INV.invincible,parry_invincible_time);
			parry_landed = true;	
			parry_startup_flash = false;
			if anim_sprite != my_sprites[?"Parryland" ] {anim_sprite = my_sprites[?"Parryland" ]}
			if (parry_frame > 28) and (parry_frame <= 30)    {anim_frame=0;}
			if (parry_frame > 26) and (parry_frame <= 28)    {anim_frame=1;}
			if (parry_frame > 24) and (parry_frame <= 26)    {anim_frame=2;}
			if (parry_frame > 22) and (parry_frame <= 24)    {anim_frame=3;}
			if (parry_frame > 20) and (parry_frame <= 22)    {anim_frame=4;}
			if (parry_frame > 18) and (parry_frame <= 20)    {anim_frame=5;}
			if (parry_frame > 8) and (parry_frame <= 18)    {anim_frame=6;}
			if (parry_frame > 6) and (parry_frame <= 8)    {anim_frame=7;}
			if (parry_frame > 4) and (parry_frame <= 6)    {anim_frame=8;}
			if (parry_frame > 4) and (parry_frame <= 4)    {anim_frame=9;}
			if (parry_frame > 0) and (parry_frame <= 2)    {anim_frame=10;}
				
			if (parry_frame==0)
				{
				parry_phase=3;
				parry_frame=1;
				}
			}
		default: break;
		}
	}
#endregion
move_grounded_();