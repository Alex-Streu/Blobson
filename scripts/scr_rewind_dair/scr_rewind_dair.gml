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
			attack_frame=4;
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
				attack_frame=4;
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
				attack_frame=4;
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
				attack_frame=4;
				
				//Swish hitbox
				 var _hitbox_swish = create_melee(0,0,1,1,6,6,0.3,11,50,4,HITBOX_SHAPE.rectangle,0);
				 set_hitbox_property(_hitbox_swish,HITBOX_PROPERTY.hit_sfx,snd_dair_hit);
				 set_hitbox_property(_hitbox_swish, HITBOX_PROPERTY.hit_fx_style, HIT_FX.explosion);
				_hitbox_swish.sprite_index = spr_rewind_dair_swish
				if (facing == -1) {_hitbox_swish.image_xscale *= -1;}	
				
				//Sweet hitbox
				 var _hitbox = create_melee(0,0,1,1,9,5,1,20,-80,4,HITBOX_SHAPE.rectangle,0);
				 set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dair_sweetspot_hit);
				 set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.explosion);
				 _hitbox.sprite_index = spr_rewind_dair_sweet
				if (facing == -1) {_hitbox.image_xscale *= -1;}	
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
				attack_frame=4;
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
				attack_frame = attack_has_hit() ? 4 : 12;
				}
			break;
			}						                 					
		
		//Finish
		case 5:
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