///@func All_connected_controllers()
///@desc Returns an array of all of the connected controller devices
var connected = [];
var num = 0;
for(var i = 0; i < number_of_devices; i++)
	{
	if (gamepad_is_connected(i))
		{
		connected[num] = i;
		num++;
		}
	}
return connected;