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
			#region   Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;	
				attack_phase++;
				attack_frame=3;
                set_speed(16*facing,0,false,false);
				}
			break;
			}
			#endregion
		    #region   Frame 4 - hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=2;				
				#region normal hitbox	
				var _hitbox = create_melee(0,0,1,1,6,7,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_dashattack_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion               
				}
			break;
			}
			#endregion
			#region   Frame 5 - hitbox + exmeter
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				attack_phase++;
				attack_frame=2;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 3;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion				
				#region normal hitbox	
				var _hitbox = create_melee(0,0,1,1,6,7,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_dashattack_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion               
				}
			break;
			}
			#endregion
			#region	 Frame 6 - hitbox + exmeter
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=2;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 3;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion				
				#region normal hitbox	
				var _hitbox = create_melee(0,0,1,1,6,7,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_dashattack_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion               
				}
			break;
			}
			#endregion
			#region   Frame 7 - hitbox + exmeter
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				attack_frame=2;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region normal hitbox	
				var _hitbox = create_melee(0,0,1,1,6,7,1,10,45,2,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_takia_dashattack_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy_hit);
				#endregion               
				}
			break;
			}
		#endregion				
			#region   Frame 8 - exmeter
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=3;
					}
				else
					{					
					attack_frame=6;
					}
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
				anim_frame=7;			
				attack_phase++;
				#region jump cancelable
				if (attack_has_hit())   
				{if run && cancel_jump_check()	 run=false;}
				else{EX_meter += 0;}
				#endregion
				#region whiff lag
				if (attack_has_hit())   
				{
					attack_frame=3;
					}
				else
					{					
					attack_frame=6;
					}
				#endregion
				}
			break;
			}
		#endregion				
		    #region Finish
		case 8:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=7;
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