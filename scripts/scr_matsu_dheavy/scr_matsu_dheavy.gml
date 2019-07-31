//Forward Smash for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(slide_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Dheavy" ]
			anim_frame=0;
			anim_speed=0;
		
			smash_charge=0;
		
			attack_frame=smash_attack_max_charge;
			return;
			}
		//Charging -> Startup
		case 0:
			{
			//Animation (every 8 frames switch the sprite)
			if (smash_charge % 8 == 0)
				{
				if (anim_frame==0)
					{
					anim_frame=0;
					}
				else
					{
					anim_frame=0;
					}
				}
			
			smash_charge++;
			if (smash_charge>=smash_attack_max_charge || attack_frame==0 || !button_hold(INPUT.smash,1))
				{
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
						//frame 2 
			case 1:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
									//frame 3
			case 2:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
			//frame 4
			case 3:
			{			
			if (attack_frame==0)
				{
				anim_frame= 3;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
			//frame 5
			case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 6
			case 5:
			{			
			if (attack_frame==0)
				{
				set_speed(facing*4,0,false,false);
				anim_frame= 5;
				attack_phase++;
				attack_frame=2;
				var _damage = calculate_smash_damage(6);
				//create_melee(30,-56,0.5,1.2,12,12,1.3,6,80,2,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				
				var _hitbox = create_melee(0,0,1,1,12,12,1.3,6,-80,2,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
				_hitbox.sprite_index = spr_matsu_dheavy_hb;
				if (facing == -1) {_hitbox.image_xscale *= -1;}	
				
				
				}
			break;
			}
			
			//frame 7
			case 6:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=5;	
				var _damage = calculate_smash_damage(6);
				create_melee(44,-34,1,1.1,8,8,1.3,6,-80,5,HITBOX_SHAPE.rectangle,0);
				create_fx(spr_fx_poof1,2,0,27, x +52 * facing,y,1,0);
				audio_play_sound(sfx_slam1,10,false);
				}
			break;
			}
			
			//frame 8
			case 7:
			{			
			if (attack_frame==0)
				{
				anim_frame= 7;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
			
			//frame 9
			case 8:
			{			
			if (attack_frame==0)
				{
				anim_frame= 8;
				attack_phase++;
				attack_frame=6;
				}
			break;
			}
			
			//frame 9
			case 9:
			{			
			if (attack_frame==0)
				{
				anim_frame= 9;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//frame 10
			case 10:
			{			
			if (attack_frame==0)
				{
				anim_frame= 10;
				attack_phase++;
				if (attack_has_hit())   {attack_frame=9;}
				else
					{					
					attack_frame = 6;
					}
				
				
				attack_frame=5;
				}
			break;
			}
			
		//Finish
		case 11:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=10;
				
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