//Allows a character to drift in the air
if (stick_tilted(Lstick,DIR.horizontal))
	{
	hsp+=air_accel*sign(stick_value(Lstick,DIR.horizontal));
	}
hsp=clamp(hsp,-max_air_speed,max_air_speed);