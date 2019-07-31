///Standard_Parrying
//Contains the standard actions for the parrying state.
#region Attack Script
//Calls the parry script
if (script_exists(parry_script))
	{
	script_execute(parry_script);
	}
else
	{
	set_state(PLAYER_STATE.idle);
	}
#endregion
//No movement in the Standard Parry Script - Must be inside the custom script!