//netural special sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
if (on_ground())
	{
	friction_gravity(ground_friction, grav, max_fall_speed);
	}
else
	{
	friction_gravity(air_friction, grav, max_fall_speed);
	}

if !(on_ground()) {aerial_drift();}

//How much EX_meter is gained upon landing the attack.
//edit the meter gain variable in melee_colide
meter_gain = 6;
meter_gain_magnet = 0;

#region Phases
if (run)
	{
	switch(_phase)
		{

			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Nspecial" ]
			anim_speed=0;
			anim_frame=0;
			attack_frame= 2;
			sarina_nspecial_charge = 0; //set the charge level up
			set_speed(0,0,true,true);
			return;
			}
			#endregion
			#region   Frame 2
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
			#region   Frame 3 - begin loop 1 - level 1
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=4;	
				sarina_nspecial_charge = 1; //set the charge level up
				sarina_nspecial_effect = true;		
				global.pe_level_high = part_emitter_create(nspecial_particles);
				}
			break;
			}
			#endregion
		    #region   Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;
				attack_frame=4;	
				if !(button_hold(INPUT.special, 0,true))   {attack_start(scr_sarina_nspecial_release)}

				}
			break;
			}
			#endregion
			#region   Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				attack_frame=4;	
				if !(button_hold(INPUT.special, 0,true))   {attack_start(scr_sarina_nspecial_release)}

				}
			break;
			}
			#endregion
			#region	 Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=4;	
				if !(button_hold(INPUT.special, 0,true))   {attack_start(scr_sarina_nspecial_release)}

				}
			break;
			}
			#endregion
			#region   Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=4;	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 8 - begin loop 2 - level 2
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;						
				attack_phase++;	
				attack_frame=3;	
				sarina_nspecial_charge = 2; //set the charge level up	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation						
				anim_frame=3;			
				attack_phase++;
				attack_frame=3;	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}

				}
			break;
			}
		#endregion				
			#region   Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;		
				attack_frame=3;	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;		
				attack_frame=3;	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;	
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 13 - begin loop 3 - level 3
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame = 2;
				sarina_nspecial_charge = 3; //set the charge level up
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				
				}
			break;
			}
		#endregion				
			#region   Frame 14
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;	
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 16
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 17
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion							
			#region   Frame 18 - begin loop 4 - level 4
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame = 2;
				sarina_nspecial_charge = 4; //set the charge level up
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 19
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;	
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 20
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 21
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 22
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 23 begin loop 5 - level 5
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame = 2;
				sarina_nspecial_charge = 5; //set the charge level up
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				

				
				}
			break;
			}
		#endregion				
			#region   Frame 24
		case 22:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;	
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 25
		case 23:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 26
		case 24:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;		
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 27
		case 25:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame = 2;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 28 begin loop 6 - level 6
		case 26:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame = 1;
				sarina_nspecial_charge = 6; //set the charge level up
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 29
		case 27:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;	
				attack_frame = 1;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 30
		case 28:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;		
				attack_frame = 1;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 31
		case 29:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;		
				attack_frame = 1;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
			#region   Frame 32
		case 30:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame = 1;
				if !(button_hold(INPUT.special, buff,true))   {attack_start(scr_sarina_nspecial_release)}
				}
			break;
			}
		#endregion				
		    #region Finish
		case 31:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=6;
			if (attack_frame==0)
				{
					sarina_nspecial_effect = false;	
				attack_start(scr_sarina_nspecial_release)
				}
			break;
			}
		}
	}
	#endregion
	#endregion
//Movement
if (on_ground())
	{
	move_grounded_();
	}
else
	{
	move_();
	}

