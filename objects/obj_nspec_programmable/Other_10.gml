/// @description
create_fx(spr_fspec_projectile_trail1,1,0,28,x,y,2,irandom(360),"FX_Layer_Below");
event_inherited();
//Follow instructions
if (current_inst<=array_length_1d(instructions)-1)
	{
	hsp=lengthdir_x(6,instructions[current_inst]);
	vsp=lengthdir_y(6,instructions[current_inst]);
	}
if (++timer>20)
	{
	timer=0;
	current_inst++;
	if (current_inst>array_length_1d(instructions)-1)
		{
		instance_destroy();
		exit;
		}
	}