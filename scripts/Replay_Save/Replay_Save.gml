///@func Replay_Save(filename)
///@param filename
var _name = argument[0];
	
//Create the final buffer
var _final = buffer_create(1, buffer_grow, 1);

//Write metadata
buffer_write(_final, buffer_string, global.replay_data[? "TIME"]);
buffer_write(_final, buffer_u32, global.replay_data[? "SEED"]);

//Add in other buffers
for(var i = 0; i < max_players; i++)
	{
	var _buffer = global.game_replay[| i];
	Replay_Buffer_Add_Chunk(_buffer, _final);
	}

//Export to file
buffer_resize(_final, buffer_tell(_final));
var _compress = buffer_compress(_final, 0, buffer_get_size(_final));
buffer_save(_compress, _name);
show_message(to_string("Replay saved to: ", _name));

//Destroy buffers
buffer_delete(_compress);
buffer_delete(_final);