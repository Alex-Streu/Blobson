///Standard_Rolling
//Contains the standard actions for the rolling state.
var run=true;
//Timer
rolling_frame=max(--rolling_frame,0);
//Animation is done in the phase switch
#region Special Airdodge exception
if (run && rolling_phase==0)
	{
	//If the jump button is pressed
	if (button(INPUT.jump,buff))
		{
		//Cancel the roll
		rolling_phase=0;
		rolling_frame=0;
		/* Modified airdodging code */
		//Set the state
		set_state(PLAYER_STATE.airdodging);
		//Set speeds
		var spd,dir;
		//If the control stick is not being pressed far enough, there is no movement
		if (stick_tilted(Lstick))
			{
			spd=(air_dodge_speed);
			dir=point_direction(0,0,stick_value(Lstick,DIR.horizontal)*10,
				stick_value(Lstick,DIR.vertical)*10);
			}
		else
			{
			spd=0;
			dir=90;
			}
		//Speeds
		set_speed(lengthdir_x(spd,dir),lengthdir_y(spd,dir),false,false);
		//Set timers
		air_dodge_frame=0;
		air_dodge_phase=0;
		run=false;
		}
	}
#endregion
#region Cancel in air
if (run && !on_ground())
	{
	set_state(PLAYER_STATE.aerial);
	run=false;
	}
#endregion
#region Transition through phases of rolling
if (run)
	{
	switch(rolling_phase)
		{
		case 0:
			{
			//Animation
			anim_sprite=my_sprites[?"Rolling"];
			anim_speed=0;
			anim_frame=0;
			//No speed
			set_speed(0,0,false,false);
			if (rolling_frame==0)
				{
				//Next phase
				rolling_phase++;
				rolling_frame=roll_active;
				//Invulnerability
				set_invulnerable(INV.type_invincible,roll_active);
				//Speed
				set_speed(roll_speed*rolling_direction,0,false,false);
				}
			break;
			}
		case 1:
			{
			//Animation
			anim_speed= ani_speed_dodgeroll;

			if (rolling_frame==0)
				{
				rolling_phase++;
				rolling_frame=roll_endlag;
				}
			break;
			}
		case 2:
			{
			//Animation
			anim_speed=0;
			//anim_frame= 6;
			
			//anim_frame=sprite_get_number(my_sprites[?"Rolling"]);
			//No speed
			set_speed(0,0,false,false);
			//End roll
			if (run && rolling_frame==0)
				{
				rolling_phase=0;
				//Position the player to be backwards
				if (rolling_direction!=0)
					facing=-sign(rolling_direction);
				//Back to Idle State, unless Shield is being held down
				if ((shield_type==0 || shield_type==2) && check_shield())
					{}
				else
					{
					set_state(PLAYER_STATE.idle);
					}
				run=false;
				}
			break;
			}
		default: break;
		}
	}
#endregion
move_grounded_();