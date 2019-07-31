///@func button_reset(input_index)
///@param input_index
///@desc Reset the input buffer in all indexes that are mapped to the input
var ar,in;
ar=cc;
in=argument[0];

//Checks each button in the array
for(var i=0;i<array_length_1d(ar);i++)
	{
	//See if the button's action matches with the input_index
	if (ar[@ i]==in)
		{
		//Set the buffer frame to the max amount (for both the pressed & held versions)
		input_buffer[| (i*2)]=max_buffer_length;
		input_buffer[| (i*2)+1]=max_buffer_length;
		}
	}
return;