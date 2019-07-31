///@func button_direct(index,frame_buffer_number,[delete_input])
///@param index
///@param frame_buffer_number
///@param [delete_input]
///@desc Checks in a button has been pressed using the absolute button numbers
/* USES ABSOLUTE BUTTONS, NOT CUSTOM CONTROLS */
//Check if the number is less than the required amount
if (input_buffer[| argument[0]]<argument[1])
	{
	//Deletes the input by setting the buffer frame to the max amount
	if (argument_count>2 && !argument[2])
		{
		return true;
		}
	else
		{
		input_buffer[| argument[0]]=max_buffer_length;
		}
	return true;
	}
return false;