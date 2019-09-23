//Side special for akuma

var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;

//To change akuma having his f-speical. you will need to go to the check specials script

//Timer
attack_frame=max(--attack_frame,0);

//Canceling
//if run && cancel_air_check() run=false;

#region Phases if spin kick is ready
if (run)
	{
	switch(_phase)
		{
		    #region   Frame starting
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_akuma_fspecial;
			anim_speed=0;
			anim_frame=0;
			attack_frame = 3
			audio_play_sound(vc_spinkick2,10,false);
			return;
			}						
			#endregion
			
		    #region frame 1
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=2;
				if akuma_fspecial_ready = true {set_speed(1*facing,0,false,false);}
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
				anim_frame=1;
			
				attack_phase++;
				attack_frame=2;
				if akuma_fspecial_ready = true {set_speed(2*facing,0,false,false);}
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
				anim_frame=2;
			
				attack_phase++;
				attack_frame=2;				
				
				var _hitbox2 = create_melee(55,-60,0.5,.5,5,10,0,5,30,2,HITBOX_SHAPE.rectangle,2);		
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				if akuma_fspecial_ready = true {set_speed(4*facing,0,false,false);}
				}
			break;
			}
			#endregion
			#region   Frame 4
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=1;
				if akuma_fspecial_ready = true {set_speed(6*facing,0,false,false);}
				}
			break;
			}
			#endregion
			#region   Frame 5
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 6 - hitbox front
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				attack_frame=2;	
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(74,-76,0.9,.5,2,8,0,5,30,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
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
				anim_frame=6;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 8 -
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_phase++;
				attack_frame=2;				
				}
			break;
			}
			#endregion
			#region   Frame 9 -
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 10 -
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
			
				attack_phase++;
				attack_frame=2;							
				}
			break;
			}
			#endregion
			#region   Frame 11 - hitbox front
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;
			
				attack_phase++;
				attack_frame=2;
				
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(74,-76,0.9,.5,3,8,0,5,30,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				}
			break;
			}
			#endregion
			#region   Frame 12 -
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;
			
				attack_phase++;
				attack_frame=2;
				
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
				anim_frame=12;
			
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
				anim_frame=13;
			
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
				anim_frame=14;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 16 - hitbox front
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;
			
				attack_phase++;
				attack_frame=2;
				
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(74,-76,0.9,.5,2,8,0,5,30,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				}
			break;
			}
			#endregion
			#region   Frame 17
		case 16:
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
			#region   Frame 18
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 19
		case 18:
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
			#region   Frame 20
		case 19:
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
			#region   Frame 21 - hitbox front
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;
			
				attack_phase++;
				attack_frame=2;
				
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(74,-76,0.9,.5,3,8,0,5,30,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				}
			break;
			}
			#endregion
			#region   Frame 22
		case 21:
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
			#region   Frame 23
		case 22:
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
			#region   Frame 24
		case 23:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=23;
				attack_phase++;
				friction_gravity(air_friction,grav,max_fall_speed);
				#region ADD whiff
				if (attack_has_hit())   
				{
					attack_frame=13;
					}
				else
					{					
					attack_frame=18;
					}
				#endregion
				
				
				
				}
			break;
			}
			#endregion
		    #region   Finish
		case 24:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=23;
			if (attack_frame==0)
				{
				akuma_fspecial_cooldown = akuma_fspecial_cooldown_max;	
				attack_stop(PLAYER_STATE.idle);
				akuma_fspecial_ready = false
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion

//Movement
move_();