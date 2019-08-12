///@func Replay_Load(filename)
///@param filename
var _name = argument[0];
	
//Get the buffer data from the file
var _compress = buffer_load(_name);
var _load = buffer_decompress(_compress);

//Get the metadata
//show_message("REPLAY SIZE (bytes): " + string(buffer_get_size(_load)));
buffer_seek(_load, buffer_seek_start, 0);
var _time = buffer_read(_load, buffer_string);
var _seed = buffer_read(_load, buffer_u32);
random_set_seed(_seed);

//Get the individual player buffers
for(var i = 0; i < max_players; i++)
	{
	//Clear the buffer and copy the new contents into it
	var _buffer = global.game_replay[| i];
	buffer_reset(_buffer);
	
	//Find the end of that player's contents
	Replay_Buffer_Load_Chunk(_load, _buffer);
	}
	
//Destroy buffers
buffer_delete(_compress);
buffer_delete(_load);