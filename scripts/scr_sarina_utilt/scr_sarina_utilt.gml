//Upward Tilt for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
//edit the meter gain variable in melee_colide
meter_gain = 6;
meter_gain_magnet = 0;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Utilt"];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame= 3;
			return;
			}
			#endregion
			#region   Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 3 - 1st magnetbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=3;
				#region hitbox 1
				var _hitbox1 = create_magnetbox(0,0,1,1,1,6,6,-90,20,3,HITBOX_SHAPE.rectangle,0);	
				set_hitbox_property(_hitbox1,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				set_hitbox_property(_hitbox1,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox1.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox1.image_speed = 0;
				if (facing == -1) {_hitbox1.image_xscale *= -1;}
				_hitbox1.image_index = anim_frame;
				#endregion
				
				}
			break;
			}
			#endregion
		    #region   Frame 4 - 2nd magentboxr
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				
				#region hitbox 2
				var _hitbox2 = create_magnetbox(0,0,1,1,2,2,24,-100,20,2,HITBOX_SHAPE.rectangle,1);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitlag);
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox2.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox2.image_speed = 0;
				if (facing == -1) {_hitbox2.image_xscale *= -1;}
				_hitbox2.image_index = anim_frame;	
				#endregion						
				}
			break;
			}
			#endregion
			#region   Frame 5 - 3rd magentbox
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
			
				attack_phase++;
				attack_frame=2;
				#region hitbox 3
				var _hitbox3 = create_magnetbox(0,0,1,1,1,2,-24,-100,20,2,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox3,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				set_hitbox_property(_hitbox3,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox3.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox3.image_speed = 0;
				if (facing == -1) {_hitbox3.image_xscale *= -1;}
				_hitbox3.image_index = anim_frame;	
				#endregion
				}
			break;
			}
			#endregion
			#region	 Frame 6 - 4th magnetbox
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				
				#region hitbox 4
				var _hitbox4 = create_magnetbox(0,0,1,1,2,2,24,-100,20,2,HITBOX_SHAPE.rectangle,3);	
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitlag);	
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox4.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox4.image_speed = 0;
				if (facing == -1) {_hitbox4.image_xscale *= -1;}
				_hitbox4.image_index = anim_frame;	
				#endregion						

				}
			break;
			}
			#endregion
			#region   Frame 7 - 5th magnetbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=3;
				reset_hitbox_groups()
				#region hitbox 4
				var _hitbox4 = create_magnetbox(0,0,1,1,1,2,24,-100,20,2,HITBOX_SHAPE.rectangle,3);	
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitlag);
				set_hitbox_property(_hitbox4,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox4.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox4.image_speed = 0;
				if (facing == -1) {_hitbox4.image_xscale *= -1;}
				_hitbox4.image_index = anim_frame;		
				#endregion	
				}
			break;
			}
		#endregion				
			#region   Frame 8 + hitbox
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;						
				attack_phase++;	
				attack_frame = 3;
				reset_hitbox_groups()
				#region hitbox 1
				var _hitbox5 = create_melee(0,0,1,1,1,8,1,10,80,3,HITBOX_SHAPE.circle,0);	
				set_hitbox_property(_hitbox5,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);	
				_hitbox5.sprite_index = spr_sarina_utilt_hitbox;
				_hitbox5.image_speed = 0;
				if (facing == -1) {_hitbox5.image_xscale *= -1;}
				_hitbox5.image_index = anim_frame;	
				//set_hitbox_property(_hitbox5,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_hitstun);
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;		
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 12;}
				else                               {attack_frame = 18;}
				#endregion
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;			
				attack_phase++;		
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 4;}
				else                               {attack_frame = 6;}
				#endregion
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;		
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 3;}
				else                               {attack_frame = 5;}
				#endregion
			    #region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 12 + whiff lag
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 3;}
				else                               {attack_frame = 4;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 13 + whiff lag
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 3;}
				else                               {attack_frame = 4;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 14 + whiff lag
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit() )   {attack_frame = 5;}
				else                               {attack_frame = 8;}
				#endregion
				}
			break;
			}
		#endregion				
		    #region Finish
		case 13:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=13;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion
//Movement
move_grounded_();