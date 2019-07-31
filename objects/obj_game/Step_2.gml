/// @description ENDING THE GAME
/*ENDGAME*/
//Stock Match
var _check = noone;
var _winners = 0;

//Loop through all players
with(obj_player)
	{
	//If they haven't lost (yet), they are counted
	if (state != PLAYER_STATE.lost)
		{
		_winners += 1;
		}
	}
	
//If there is only one winner, the game ends
//Will eventually need to be updated for team battles
if (_winners == 1)
	{
	part_particles_clear(global.part_sys);
	//Back to character select screen
	room_goto(rm_Main_Menu);
	}