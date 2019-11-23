//Dashattack for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);

//How much EX_meter is gained upon landing the attack.
meter_gain = 6;
meter_gain_magnet = 0;

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
			attack_frame= 4;
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
				set_speed(16*facing,0,false,false);
				}
			break;
			}
			#endregion
			#region   Frame 3 - hitbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;	
				attack_phase++;
				attack_frame=3;
                
				#region normal hitbox	
				var _hitbox = create_melee(0,0,1,1,6,7,1,10,45,3,HITBOX_SHAPE.circle,0);
				_hitbox.sprite_index = spr_sarina_dashattack_hitbox;
				_hitbox.image_speed = 0;
				_hitbox.image_index = anim_frame;
				if (facing == -1) {_hitbox.image_xscale *= -1;}
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dashattack_hit);
				#endregion               
				}
			break;
			}
			#endregion
		    #region   Frame 4 - whiff lag
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
				#endregion							
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
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
				#endregion				
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
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
				#endregion				
				
				}
			break;
			}
			#endregion
			#region   Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =2}
				else                              {attack_frame =7}
				#endregion				
				
				}
			break;
			}
		#endregion				
			#region   Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;			
				attack_phase++;
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
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
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
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
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
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
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
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
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
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
				#region whiff lag
				if (attack_has_hit())   {attack_frame =1}
				else                              {attack_frame =3}
				#endregion				

				}
			break;
			}
		#endregion				
		    #region Finish
		case 12:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=12;
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
move_y();
Speed_Fraction();
move_x_grounded(32); // X movement along with pixel buffer of ledges.