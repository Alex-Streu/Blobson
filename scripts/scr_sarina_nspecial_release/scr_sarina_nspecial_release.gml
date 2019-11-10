//ending slash for Nspecial for Sarina
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


#region Phases
if (run)
	{
	switch(_phase)
		{
		    #region   Frame start   
		case PHASE.start:
			{
			sarina_nspecial_effect = false;	

			//Animation
			anim_sprite= spr_sarina_nspecial
			anim_speed=0;
			anim_frame=7;
			return;
			}						
			#endregion
			
		    #region   Frame 1
		case 0:
			{
			if (attack_frame==0)
				{
					change_facing();
				//Animation
				anim_frame=13;
				attack_phase++;
				attack_frame=3;				
				}
			break;
			}
			#endregion
			#region   Frame 2
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;
				attack_phase++;
				attack_frame=2;				
				}
			break;
			}
			#endregion
			#region   Frame 3
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 4 - hitbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;
				attack_phase++;
				attack_frame=2;

				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
				attack_phase++;
				attack_frame=2;
				
				  if sarina_nspecial_charge = 1 {var _hitbox = create_melee(0,0,1,1,6,6,1,10,70,2,HITBOX_SHAPE.circle,1);}
					if sarina_nspecial_charge = 2 {var _hitbox = create_melee(0,0,1,1,9,7,1.1,12,70,2,HITBOX_SHAPE.circle,1);}
					if sarina_nspecial_charge = 3 {var _hitbox = create_melee(0,0,1,1,12,8,1.2,14,70,2,HITBOX_SHAPE.circle,1);}
					if sarina_nspecial_charge = 4 {var _hitbox = create_melee(0,0,1,1,15,9,1.3,17,70,2,HITBOX_SHAPE.circle,1);}
					if sarina_nspecial_charge = 5 {var _hitbox = create_melee(0,0,1,1,20,10,1.4,20,70,2,HITBOX_SHAPE.circle,1);}
					if sarina_nspecial_charge = 6 {var _hitbox = create_melee(0,0,1,1,25,11,1.5,30,70,2,HITBOX_SHAPE.circle,1);}
					#region Hitbox properties
				    _hitbox.sprite_index = spr_sarina_nspecial_hitbox;
				    _hitbox.image_speed = 0;
				    if (facing == -1) {_hitbox.image_xscale *= -1;}
				    _hitbox.image_index = 1;
				    set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fspecial_hit);
					#endregion		
				}
			break;
			}
			#endregion
			#region   Frame 6
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 7
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 8
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 9
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 10
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=22;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 11
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=23;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 12
		case 11:
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
			#endregion
			#region   Frame 13
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=25;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 14
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=26;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 15
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=27;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 16
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=28;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
		    #region   Finish
		case 16:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=28;
			if (attack_frame==0)
				{
				sarina_nspecial_charge = 0; //set the charge level up
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion
//Movement
move_grounded_();

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 1;
