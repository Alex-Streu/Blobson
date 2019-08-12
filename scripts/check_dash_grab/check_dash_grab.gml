///Checks for dash grabs
//If the grab button has been pressed
var _stick=Choose_Stick_By_Input(INPUT.grab);
if (button(INPUT.grab,buff))
	{
	change_facing(_stick);
	attack_start(my_attacks[?"DashG"]);
	return true;
	}
return false;