///Checks for normal grab
//If one stick is set to grab it overrides the direction of the other stick
var _stick=Attack_Choose_Stick(INPUT.grab);
//If the grab button has been pressed
if (button(INPUT.grab,buff))
	{
	change_facing(_stick);
	attack_start(my_attacks[?"Grab"]);
	return true;
	}
return false;