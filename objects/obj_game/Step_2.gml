/// @description ENDING THE GAME
/*ENDGAME*/
//Stock Match
var _win_count = 0;
var _winners = [];

//Loop through all players
with(obj_player)
	{
	//If they haven't lost (yet), they are counted
	if (state != PLAYER_STATE.lost)
		{
		_win_count += 1;
		_winners[array_length_1d(_winners)] = id;
		}
	}
	
//If there is only one winner, the game ends
//Will eventually need to be updated for team battles
if (_win_count == 1)
if !instance_exists(obj_cubecrush)
	{
	var _w = _winners[0];
	part_particles_clear(global.part_sys);
	
	//Save the replay
	if (!global.replay_mode && global.replay_record)
		{
		global.replay_data[? "TIME"] = Timestamp_Create();
		game_replay = -1;
		}
		
	//Pass in character data
	global.win_screen_data_temp = Player_Data_Create
		(
		_w.name, 
		_w.player_color,
		_w.controller, 
		0, 
		_w.render, 
		_w.palettes,
		_w.victory_theme
		);
		
	//Back to character select screen
	room_goto(rm_Win_Screen);
	}