//Forward Aerial for Takia
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animate frame 1
			anim_sprite= my_sprites[?"Uair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
			attack_frame=3;
			landing_lag=5;
			return;
			}
			
		#region Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=1;
			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion		
		#region Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;					
				}
			break;
			}
			
			#endregion
			
			#region Frame 4 - hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
				attack_phase++;
				attack_frame = 3;
				
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,6,6,1.1,10,45,4,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_takia_uair_sweetbox;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,4,6,0.8,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uair_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 5 - hitboxes + ex meter
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,6,6,1.1,10,45,4,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_takia_uair_sweetbox;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,4,6,0.8,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uair_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
				}
			break;
			}
			#endregion
			#region Frame 6 - hitboxes + ex meter + jump cancelable
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=5;
				attack_phase++;
				attack_frame=3;
			    #region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,6,6,1.1,10,45,4,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_takia_uair_sweetbox;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,4,6,0.8,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_uair_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				#region ADD EX meter + jump cancelable
				if (attack_has_hit())   
				{
					EX_meter += 5;
					//Jump cancel out of lag
			        if run && cancel_jump_check()	 run=false;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion 			
				}
			break;
			}
			#endregion			
			#region Frame 7 - ex meter + jump cancel
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;				
				attack_phase++;
				attack_frame=3;
				#region jump cancel
				if (attack_has_hit())   
				{ if run && cancel_jump_check()	 run=false;}
				else {EX_meter += 0;}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 8 - whiff lag
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;				
				attack_phase++;
				#region Whiff lag
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 3;}
				else                               {attack_frame = 4;   landing_lag = 4;}
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
		    #region Frame 9 - whiff lag + jump cancel if landed attack
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
				#region Whiff lag
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 3;}
				else                               {attack_frame = 4;   landing_lag = 4;}
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
			#region Frame 10 - whiff lag + jump cancel if landed attack
		case 8:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=9;				
				attack_phase++;
				#region Whiff lag
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 3;}
				else                               {attack_frame = 4;   landing_lag = 4;}
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
			#region Frame 11 - whiff lag + jump cancel if landed attack
		case 9:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=10;				
				attack_phase++;
				#region Whiff lag
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 3;}
				else                               {attack_frame = 4;   landing_lag = 4;}
				#endregion
				}
			break;
			}
			#endregion		
			#region Finish
		case 10:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=10;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
			#endregion
		}
	}
//Movement
move_();
	
	
	