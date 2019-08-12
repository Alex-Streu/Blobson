/// @description <Run by obj_game>
//Input buffer
if (!global.replay_mode)
	{
	if (!is_AI)
		{
		Update_Input_Buffer(input_buffer, uses_keyboard, false);
		}
	else
		{
		AI_Input(false);
		}
	if (global.replay_record)
		{
		Input_Replay_Convert(global.game_replay[| player_number], input_buffer);
		}
	Register_Tech_Input(true);
	}
else
	{
	//Update_Input_Buffer_Replay(input_buffer, false);
	}