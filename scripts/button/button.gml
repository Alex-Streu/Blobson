///@func button(input_index,buffer_time,[delete_input])
///@param input_index
///@param buffer_time
///@param [delete_input]
///@desc Checks if you pressed a button that was mapped to the given input
var ar,in,bu,de;
ar=cc;
in=argument[0];
bu=argument[1];
de=argument_count>2 ? argument[2] : true;

//Performs a separate button check for each button listed in the array
//If any check is successful, the script ends and returns true
for(var i=0;i<array_length_1d(ar);i++)
	{
	//See if the button's action matches with the input_index
	//Basically, if the input_index is "Attack", we're checking to ensure the button was set to "Attack"
	if (ar[@ i]==in)
		{
		//Perform a button check
		if (button_direct((i*2),bu,de))
			{
			return true;
			}
		}
	}
return false;