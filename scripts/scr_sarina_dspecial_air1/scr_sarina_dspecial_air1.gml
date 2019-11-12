//Down Special
/*
- Falls quickly and spikes opponents
- The grounded version jumps up into the air first
- Has a hitbox when touching the ground
- You can jump cancel the fall, provided you have midair jumps left
*/
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
			anim_sprite=spr_sarina_dspecial_dive;
			anim_frame=0;
			anim_speed=0;
			sarina_dspecial_ex_dive = false;
			//Ground v.s. Air startup
			if (!on_ground())
				{
				attack_frame=12;
				attack_phase=0;
				set_speed(0,0,true,false);
				}
			else
				{
				set_speed(4*facing,-8.5,false,false);
				attack_frame=14;
				attack_phase=4;
				}
			return;
			}
		//Startup -> Active
		case 0:
			{
				if (button_hold(INPUT.attack, buff,true))
				if sarina_dspecial_ex_dive = false
				if EX_meter >= ex_useage_dspecial_air
				{
					instance_create_depth(x,y-60,300,obj_effect_ex_flash);
					audio_play_sound(sfx_ex_useage,10,false);
					sarina_dspecial_ex_dive = true;
					ex_flash = true;
					ex_flash_timer = 30;
					EX_meter -= ex_useage_dspecial_air;
				}
			//Animation
			if (attack_frame<7)
				{
				anim_frame=1;
				}
			
			if (attack_frame==0)
				{
					anim_frame=3;
				attack_phase++;
				attack_frame=45;//90
				
				
			   if sarina_dspecial_ex_dive = true
			   {
				create_melee(-8,-32,0.6,1,7,4,1,10,300,45,HITBOX_SHAPE.rectangle,0);
			   }
			   
			   if sarina_dspecial_ex_dive = false
			   {
				   
				create_melee(-8,-32,0.6,1,5,11,0.5,10,65,45,HITBOX_SHAPE.rectangle,0);
			   }
				
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation - every 2 frames
			if (attack_frame % 2 == 0)
				{
					
				anim_frame++;
				if (anim_frame==8)
					{
					anim_frame=4;
					}
				}
			//Jump Cancel
			
		if (button_hold(INPUT.jump, buff))
		if sarina_dspecial_ex_dive = true
		if (double_jumps > 0)
		
		{
		attack_stop(PLAYER_STATE.jumpsquat);		
		//return true;
		}
		
		
		
			//Speed Values
			
			set_speed(6*facing,24,false,false);
			//Hitting the ground causes a ground pound
			if (on_ground())
				{
					if sarina_dspecial_ex_dive = true {sarina_dspecial_ex_dive_land = true;}
					if sarina_dspecial_ex_dive = false {sarina_dspecial_ex_dive_land = false;}
					attack_start(scr_sarina_dspecial_air_endlag)
					
				//Cancel movement
				set_speed(0,0,true,false);
				//Destroy the falling hitbox
				destroy_all_attached_hitboxes(my_hitboxes);
			
				
				}
			//Normal ending
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		//Ground pound version
		case 2:
			{
			//Friction / Gravity			
			friction_gravity(ground_friction,grav,max_fall_speed);
			//Enable ledge cancel
			if cancel_air_check() return;
			//Animation
			if (attack_frame>17)
				anim_frame=7;
			else
			if (attack_frame>13)
				anim_frame=8;
			else
			if (attack_frame>10)
				anim_frame=9;
			else
			if (attack_frame>7)
				anim_frame=10;
			else
			if (attack_frame>4)
				anim_frame=11;
		
			if (attack_frame==0)
				{
				attack_phase=3;
				attack_frame=5;
				}
			break;
			}
		//Finish
		case 3:
			{
			//Animation
			anim_frame=0;
		
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		//Alternate on-ground version startup.
		case 4:
			{
			if (attack_frame==0)
				{
				attack_phase=0;
				set_speed(0,0,false,false);
				attack_frame=3;
				}
			break;
			}
		}
	}
//Movement
move_();

//How much EX_meter is gained upon landing the attack.
meter_gain = 6;
meter_gain_magnet = 1;