///@func attack_stop([state])
///@param [state]
///@desc Stops an attack and resets the related variables
var run = true;;

//Reset attacking variables
attack_phase=0;
attack_frame=0;
attack_script=-1;
attack_draw_script=-1;
can_hitfall=false;

/*Do not reset landing lag!*/

//Reset hitboxes
destroy_all_attached_hitboxes(my_hitboxes);
reset_hitbox_groups();
any_hitbox_has_hit=false;

//Reset the hurtbox
hurtbox_reset();

//Parry Stun
if run && check_parried() run = false;
parry_stun_time=parry_default_stun_time;
can_be_parried=true;

//Set state (optional argument)
if (run && argument_count>0)
	{
	set_state(argument[0]);
	run = false;
	}