//upspecial for akuma

var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;

//To change akuma having his u-speical. you will need to go to the check specials script

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
			anim_sprite= spr_akuma_uspecial;
			anim_speed=0;
			anim_frame=0;
			attack_frame = 3
			audio_play_sound(vc_spinkick2,10,false);
			//set_invulnerable(INV.superarmor, 5);
			return;
			}						
			#endregion
			
		    #region frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=3;
				set_speed(0,0,false,false);
				
				var _hitbox2 = create_melee(40,-26,0.3,0.7,2,10,0,8,80,3,HITBOX_SHAPE.rectangle,2);		
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				set_speed(1 * facing,0,false,false);
				}
			break;
			}
			#endregion		
			#region frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=3;
				set_speed(1 * facing,0,false,false);
				
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(40,-50,0.4,0.6,2,10,0,8,80,3,HITBOX_SHAPE.rectangle,2);		
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				set_speed(1 * facing,0,false,false);
				}
			break;
			}
			#endregion
			#region frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=3;				
				
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox2 = create_melee(20,-140,0.4,0.6,2,20,0,8,80,3,HITBOX_SHAPE.rectangle,2);		
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				set_speed(1 * facing,0,false,false);
				}
			break;
			}
			#endregion
			#region frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=6;
				set_speed(3 * facing,-18,-1,false);
				
				//reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox = create_melee(20,-145,0.4,0.6,10,10,1,12,80,6,HITBOX_SHAPE.rectangle,1);		
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				}
			break;
			}
			#endregion
			#region frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=3;
				set_speed(3 * facing,-14,-1,false);
				}
			break;
			}
			#endregion
			#region frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
			
				attack_phase++;
				attack_frame=3;	
				
				set_speed(3 * facing,-10,false,false);
				}
			break;
			}
			#endregion
			#region frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;
			
				attack_phase++;
				attack_frame=3;
				set_speed(3 * facing,-4,-1,false);
				}
			break;
			}
			#endregion
			#region frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;
				attack_phase++;
				attack_frame=3;	
				set_speed(3 * facing,-2,false,false);
				}
			break;
			}
			#endregion
			#region frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;
				attack_phase++;
				attack_frame=3;
				
				set_speed(3 * facing,0,-1,false);
				}
			break;
			}
			#endregion
			#region frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;
			
				attack_phase++;
				attack_frame=3;							
				}
			break;
			}
			#endregion
		    #region   Finish
		case 10:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=9;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.helpless);				
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