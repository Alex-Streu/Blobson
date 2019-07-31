///@change_facing([stick])
///@param [stick]
//Change the facing based on the control stick.
//If it is neutral, there is no change.
//You can pass in a certain stick as an argument
var _stick=(argument_count>0) ? argument[0] : Lstick;
if (stick_tilted(_stick,DIR.right))
	{
	facing=1;
	}
else if (stick_tilted(_stick,DIR.left))
	{
	facing=-1;
	}