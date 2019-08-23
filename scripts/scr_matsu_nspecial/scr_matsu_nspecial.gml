//Forward Tilt for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions / Cancels
if (on_ground())
	{
	friction_gravity(ground_friction, grav, max_fall_speed);
	}
else
	{
	friction_gravity(air_friction, grav, max_fall_speed);
	}
	
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
			anim_sprite= my_sprites[?"Nspecial" ]
			anim_speed=0;
			anim_frame=0;
		
		   //Reverse B
			reverse_b();
		
			attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
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
			
				attack_phase++;
				attack_frame=4;
                var _hitbox = create_melee(68,-64,0.9,0.5,6,5,0.7,10,30,4,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_ftilt_hit);
				
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
			
																	//Frame 7final
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				
				var proj = custom_projectile(obj_matsu_wave, 30, 0, 1,1,10, 10, .5, 45, 120, HITBOX_SHAPE.circle, 6, 0,FLIPPER.sakurai);
				proj.base_hitlag = 4
				proj.hit_sfx = sfx_fart2;
				audio_play_sound(sfx_fart1, 10, false);
				
				}
			break;
			}
						
		//Finish
		case 6:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=6;
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