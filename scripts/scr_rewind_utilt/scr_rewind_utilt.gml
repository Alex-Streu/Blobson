//upward Tilt for rewind



var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//friction_gravity(ground_friction,grav,max_fall_speed);

//Canceling
//if run && cancel_air_check() run=false;

//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Utilt"];
			audio_play_sound(sfx_rewind_swish2,10,false);
			anim_speed=0;
			anim_frame=0;
		   set_speed(1 * facing, -5.5, false, false);
			attack_frame=3;
			
			
			//Friction and gravity

				friction_gravity(0, grav, max_fall_speed * 10);
			
			
			return;
			}
			
					//Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
                friction_gravity(0, grav, max_fall_speed * 10);
				set_speed(0 * facing, 0, false, false);
				anim_frame=1;
				attack_phase++;
				attack_frame=4;
				
				var _hitbox = create_melee(30,-86,0.5,0.9,7,6,0.7,10,75,4,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);
				
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
			friction_gravity(0, grav, max_fall_speed * 10);
				attack_phase++;
				attack_frame=5;
				var _hitbox = create_melee(30,-90,0.5,0.9,5,6,0.5,10,75,5,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);
				}
			break;
			}
			
		
		//Frame 4 hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			friction_gravity(0, grav, max_fall_speed * 10);
				attack_phase++;
				attack_frame=4;
                
				var _hitbox = create_melee(30,-90,0.5,0.9,5,6,0.5,10,75,4,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);
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
				friction_gravity(0, grav, max_fall_speed * 10);
                  attack_frame=4;
				}
			break;
			}
			
														//Frame 5
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				friction_gravity(0, grav, max_fall_speed * 10);
				
				if (attack_has_hit())   {attack_frame=4;}
				else   {					attack_frame = 14;}
				}
			break;
			}
		
						
		//Finish
		case 5:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=5;
			if (attack_frame==0)
				{
					friction_gravity(air_friction, grav, max_fall_speed * 10);
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		}
	}
//Movement
move_();
