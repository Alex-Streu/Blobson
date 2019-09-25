//Dashattack for Takia
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Dashattack"];
			anim_speed=0;
			anim_frame=0;
			attack_frame= 1;
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
				attack_frame=1;
				}
			break;
			}
			#endregion
			#region   Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;	
				attack_phase++;
				attack_frame=1;              
				}
			break;
			}
			#endregion
		    #region   Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=2;				
				
				}
			break;
			}
			#endregion
			#region   Frame 5
		case 3:
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
			#region	 Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=2;
				set_speed(16*facing,0,false,false);
                #region normal hitbox	
				var _hitbox = create_melee(112,-12,1,.4,6,7,1,10,45,2,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dashattack_hit);
				#endregion               
				}
			break;
			}
		#endregion				
			#region   Frame 8 - hitbox + exmeter
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;
				attack_frame=10;
                #region normal hitbox	
				var _hitbox = create_melee(76,-18,1.4,.4,6,7,1,10,45,10,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dashattack_hit);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_fx_style,snd_dashattack_hit);
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
				attack_frame=1;
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
				attack_frame=1;
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
				attack_frame=1;
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;
				attack_frame=1;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 13
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;			
				attack_phase++;
				attack_frame=1;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 14
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;			
				attack_phase++;
				attack_frame=1;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				}
			break;
			}
		#endregion				
			#region   Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=2;
					}
				else
					{					
					attack_frame=8;
					}
				#endregion
				}
			break;
			}
		#endregion				
		    #region Finish
		case 14:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=14;
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