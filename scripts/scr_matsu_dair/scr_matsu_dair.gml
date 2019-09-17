//Downard Aerial for Matsu
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_try();
//allow_hitfall();
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
			anim_sprite= my_sprites[?"Dair"];
			anim_speed=0;
			anim_frame=0;
			landing_lag=10;
			attack_frame=2;
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
				attack_frame=2;
				}
			break;
			}
			
					//Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
								//Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
				}
			break;
			}
			
			                    //Frame 7 (hitbox heavy)
		case 5:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=6;
			
				attack_phase++;
				attack_frame=2;
				
				//Normal
				 var _hitbox = create_melee(26,-66,1.1,1.2,6,6,0.3,8,50,2,HITBOX_SHAPE.rectangle,0);
				 set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				 set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.explosion);
				//Sweet spot heavy
				 var _hitbox_sweet = create_melee(43,-12,0.6,0.5,10,4,1,15,-80,2,HITBOX_SHAPE.rectangle,0);
				 set_hitbox_property(_hitbox_sweet,HITBOX_PROPERTY.hit_sfx,snd_dair_sweetspot_hit);		
				 set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.explosion);
				}
			break;
			}
			
		//Frame 8 (hitbox lighter)
		case 6:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=7;
				
				attack_phase++;
				attack_frame=6;
				//Normal				
				var _hitbox = create_melee(32,-22,0.9,0.5,5,4,0.3,8,50,6,HITBOX_SHAPE.rectangle,0);
				 set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				}
			break;
			}
			
					//Frame 9 finish (hitbox lighter)
		case 7:
			{
			if (attack_frame==0)
				{
				//Animate
				anim_frame=8;				
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 3 : 12;
				}
			break;
			}
					
		
			
		//Finish
		case 8:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=3;
			
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