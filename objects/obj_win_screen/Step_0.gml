/// @description
#region Input - accept from all controllers
var _start = false, _button = false, _save = false;
for(var i = 0; i < number_of_devices; i++)
	{
	if (gamepad_button_check_pressed(i, gp_start)) _start = true;
	if (gamepad_button_check_pressed(i, gp_face2)) _button = true;
	if (gamepad_button_check_pressed(i, gp_face3)) _save = true;
	if (keyboard_check_pressed(vk_enter)) _start = true;
	if (keyboard_check_pressed(vk_backspace)) _save = true;
	}
#endregion	

#region music and theme
if !audio_is_playing(victory_theme)
if !audio_is_playing(sfx_music_results)
     {
	  audio_play_sound(sfx_music_results,10,true)
     }
#endregion	

if (_start || _button) room_goto(rm_Custom_Controls);

//Offset
offset = lerp(offset, 0, 0.05);
if (offset <= 0.05)
	{
	offset = 0;
	}
	
	#region New effects system
	//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_stream(ps, global.pe_Effect2, global.pt_Effect2, 1);
part_emitter_region(ps, global.pe_Effect2, xp-960, xp+960, yp-540, yp+540, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(ps, global.pe_Effect1, global.pt_Effect1, 1);
part_emitter_region(ps, global.pe_Effect1, xp-960, xp+960, yp-540, yp+540, ps_shape_rectangle, ps_distr_linear);
	
	#endregion
	
	#region render character facials and move with offset
	sarina_mouth_x = offset;
	sarina_eyes_x = offset;
    #endregion


//Save replay
if (!global.replay_mode && global.replay_record && can_save_replay)
	{
	if (_save)
		{	
		can_save_replay = false;
		var _time = global.replay_data[? "TIME"];
		Replay_Save(version + "/" + "Replay " + _time + ".pfe");
		}
	}