//backward Aerial for takia
//Logic Control Variable
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
aerial_drift();
allow_hitfall();
//Cancels
if run && cancel_ground_check()	run=false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		//Initialize
		case PHASE.start:
			{
			//Animation
			anim_sprite=my_sprites[?"Bair"];
			anim_speed= 0;
			anim_frame=0;
			landing_lag=5;
			attack_frame=3;
			set_speed(0,-1,true,true);
			return;
			}
			#region Frame 1
			case 0:
			{			
			if (attack_frame==0)
				{
				anim_frame= 0;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion 	
			#region Frame 2 - Hitbox
			case 1:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(-48,-64,0.5,.5,5,4,1,10,120,3,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair_hit);
				}
			break;
			}
			#endregion
			#region Frame 3 - Hitbox
			case 2:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(-48,-16,0.5,.5,5,8,.2,10,120,6,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bair_hit);
				}
			break;
			}
			#endregion
			#region Frame 4 - Ex meter + jump cancel
			case 3:
			{			
			if (attack_frame==0)
				{
				anim_frame= 3;
				attack_phase++;
				attack_frame=3;
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 5;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
				#region jump cancel
				if (attack_has_hit())   
				{ if run && cancel_jump_check()	 run=false;}
				else {EX_meter += 0;}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 - jump cancel + whiff lag
			case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=3;
			    #region Whiff lag
				if (attack_has_hit())   {attack_frame = 4;   landing_lag = 4;}
				else {attack_frame = 7;}
				#endregion
				#region jump cancel
				if (attack_has_hit())   
				{ if run && cancel_jump_check()	 run=false;}
				else {EX_meter += 0;}
				#endregion
			break;
				}
			}
			#endregion
            #region Frame 6 - jump cancel + whiff lag
			case 5:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=3;
			    #region Whiff lag
				if (attack_has_hit())   {attack_frame = 4;   landing_lag = 4;}
				else {attack_frame = 7;}
				#endregion
				#region jump cancel
				if (attack_has_hit())   
				{ if run && cancel_jump_check()	 run=false;}
				else {EX_meter += 0;}
				#endregion
			break;
				}
			}
			#endregion
			#region Frame 7 - jump cancel + whiff lag
			case 6:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=3;
			    #region Whiff lag
				if (attack_has_hit())   {attack_frame = 4;   landing_lag = 4;}
				else {attack_frame = 7;}
				#endregion
				#region jump cancel
				if (attack_has_hit())   
				{ if run && cancel_jump_check()	 run=false;}
				else {EX_meter += 0;}
				#endregion
			break;
				}
			}
			#endregion
		    #region Final
		case 7:
			{
			if (attack_frame==5)
				{
				anim_frame= 4;
				}
			//Jump cancel out of lag
			if run && cancel_jump_check()	run=false;
			if (attack_frame==0)
				{
				//Revert back to the original state - may be idle, aerial, crouching, etc.
				attack_stop(PLAYER_STATE.aerial);
				run=false;
				}
			break;
			}
			#endregion
		}
	}
//Movement
move_();