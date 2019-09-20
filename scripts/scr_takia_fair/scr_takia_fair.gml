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
			anim_sprite= my_sprites[?"Fair"];
			anim_speed=0;
			anim_frame=0;
			//landing_lag=10;
			attack_frame=3;
			landing_lag=5;
			return;
			}
			
					//Startup -> frame 2
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
			
					//Frame 3 normal/sweet hitbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;			
				attack_phase++;
				attack_frame=4;	
				
				#region tipper hitbox	
				var _tipper = create_melee(0,0,1,1,7,5,1.1,10,45,4,HITBOX_SHAPE.circle,0);
				_tipper.sprite_index = spr_takia_fair_sweetbox;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,5,6,0.8,10,45,4,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fair_hitbox;
				_hitbox.image_speed = 0;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				_hitbox.image_index = anim_frame;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fair_hit);
				#endregion
				
				}
			break;
			}
			
				//Frame 4 normal/sweet hitbox + ex meter
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
				_tipper.sprite_index = spr_takia_fair_sweetbox;
				_tipper.image_speed = 0;
				if (facing == -1) {_tipper.image_xscale *= -1;}
				_tipper.image_index = anim_frame;
				set_hitbox_property(_tipper,HITBOX_PROPERTY.hit_sfx,snd_tipper1);
				#endregion			
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,4,6,0.8,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fair_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 3;
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
			
											//Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;
				#region normal hitbox
				var _hitbox = create_melee(0,0,1,1,4,6,0.8,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_fair_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = 3;
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
			
														//Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animate
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
				//Animate
				anim_frame=6;				
				attack_phase++;
				}
			break;
			}
			
			//Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;				
				attack_phase++;
				if (attack_has_hit())   {attack_frame=3;  landing_lag = 3;}
				else
					{					
					attack_frame = 6;
					 landing_lag = 4;
					}
				}
			break;
			}
					
		
			
		//Finish
		case 7:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=8;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
		}
	}
//Movement
move_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}
	
	
	
	