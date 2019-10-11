///Standard_Hitlag
//Contains the standard actions for the hitlag state.
/* NOTE: This state is the small pause whenever a character is hit, so not much happens */
var run = true;

hitlag_state = true;
hitstun_state = false;
//Timer
hitlag_frame = max(--hitlag_frame, 0);

if name = "Goku" {rewind_teleport_ready = true;}
if name = "Akuma" {akuma_uspecial_ready = true;   akuma_fspecial_ready = true;}

#region Animation
anim_speed = 1;
hurtbox.sprite_index = hurtbox_sprite;
#endregion
#region End Hitlag
if (run && hitlag_frame == 0)
	{
	var final_direction;
	//Transition to stored state
	set_state(stored_state);
	switch(stored_state)
		{
						
		case PLAYER_STATE.in_hitstun:
		hitlag_state = false;
		//voice clip
			audio_play_sound(choose(vc_hurt1,vc_hurt2,vc_nothing,vc_nothing),10,false);
			//Set the hitstun timer
			hitstun_frame = stored_hitstun;
			
			//Reset teching
			tech_buffer = tech_lockout_time;
			
			//ASDI - Moves the player a few pixels based on input after hitlag
			if (stick_tilted(Lstick, DIR.horizontal))
				{
				var _move_x = round(stick_get_value(Lstick, DIR.horizontal) * ASDI);
				if (!place_meeting(x + _move_x, y, obj_solid))
					{
					x += _move_x;
					}
				}
			if (stick_tilted(Lstick, DIR.vertical))
				{
				var _move_y = round(stick_get_value(Lstick, DIR.vertical) * ASDI);
				if (!place_meeting(x, y + _move_y, obj_solid))
					{
					y += _move_y;
					}
				}
				
			//DI - Player trajectory is altered slightly based on input after hitlag
			final_direction = di_direction(kdir, stick_get_direction(Lstick), DI_Max);
			
			//Final Knockback
			set_speed(lengthdir_x(kspd, final_direction), lengthdir_y(kspd, final_direction), false, false);
			Speed_Fraction();
			
			//Reset values that are unused right now
			kdir = 0;
			kspd = 0;
			
			//Hit FX
			var _current_speed = point_distance(x, y, x + hsp, y + vsp);
			if (_current_speed > 15)
				{
				var _scale = max((_current_speed + (hitstun_frame / 50)) / 10,2);
				var _ang = point_direction(0, 0, hsp, vsp);
				var _fx = fx_create(spr_hit_fx_launch, 1, 0, hitstun_frame div 2, x, y, _scale, _ang, "FX_Layer_Below");
				_fx.follow = id;
				_fx.shrink = 0.9;
				_fx.image_blend = palette_get_color(palettes[player_color], 0);
				}
			break;
		case PLAYER_STATE.in_flinch:
	     	hitlag_state = false;
			//Set the timer for flinching
			flinch_frame = stored_hitstun;
			break;
		}
	run = false;
	}
#endregion
//No movement