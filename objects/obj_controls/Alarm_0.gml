/// @description CONNECT CONTROLLERS
alarm[0] = 15;
//Get array of all of the currently connected gamepads
var connected = All_connected_controllers();
//Check all connected gamepads for input
for(var i = 0; i < array_length_1d(connected); i++)
{
	//If any button on the controller is pressed
	if (controller_any_button(connected[i],stick_tilt_amount))
	{
		//If the controller is not already in the list
		var assign = true;
		for(var m=0;m<array_length_1d(global.device_number);m++)
		{
			if (global.device_number[m] == connected[i])
			{
				assign = false;
				break;
			}
		}
		if (assign)
		{
			global.device_number[number_of_connections] = connected[i];
			number_of_connections = min(number_of_connections + 1, array_length_1d(global.device_number)-1);
		}
	}
}