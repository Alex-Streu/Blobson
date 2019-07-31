///@func button_hold(input_index,buffer_amount)
///@param input_index
///@param buffer_amount
///@desc Checks if you have held a button that was mapped to the given input
var ar,in,bu;
ar=cc;
in=argument[0];
bu=(argument_count>1) ? argument[1] : 1;

//Performs a separate button check for each button listed in the array
//If any check is successful, the script ends and returns true
for(var i=0;i<array_length_1d(ar);i++)
	{
	//See if the button's action matches with the input_index
	//Basically, if the input_index is "Attack", we're checking to ensure the button was set to "Attack"
	if (ar[@ i]==in)
		{
		//Perform a button check
		if (button_direct((i*2)+1,bu,false))
			{
			return true;
			}
		}
	}
return false;