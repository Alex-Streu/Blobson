//Taunt for Sarina - tighten headband
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
			//Frame 1
			anim_sprite= spr_sarina_taunt2
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=3;
			return;
			}
			
					//Frame 2
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
			
								//Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
											//Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
											//Frame 5
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
			
						//Frame 6
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
			
			//Frame 7
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
			
			//Frame 8
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
			
			//Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
						
		
		//Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 13
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 14
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 16
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 17
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 18
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 19
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 20
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 21
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Frame 22
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;
				attack_phase++;
				attack_frame=3;
				audio_play_sound(sfx_sarina_taunt1,10,false);
				}
			break;
			}
			
			//Frame 23
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=22;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 24
		case 22:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=23;
				attack_phase++;
				attack_frame=20;
				}
			break;
			}
			
			//Frame 25
		case 23:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=24;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
			//Frame 26
		case 24:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=25;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
			//Frame 27
		case 25:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=26;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 28
		case 26:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=27;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 29
		case 27:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=28;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 30
		case 28:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=29;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 31
		case 29:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=30;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 32
		case 30:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=31;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 33
		case 31:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=32;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 34
		case 32:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=33;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 35
		case 33:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=34;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 36
		case 34:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=35;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 37
		case 35:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=36;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 38
		case 36:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=37;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 39
		case 37:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=38;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 40
		case 38:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=39;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 41
		case 39:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=40;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 42
		case 40:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=41;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
						
		//Finish
		case 41:
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
		}
	}
//Movement
move_grounded_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}