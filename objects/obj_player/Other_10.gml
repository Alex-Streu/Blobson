/// @description <Run by obj_game>
var frozen;
frozen=false;
//Input buffer
if (!is_AI)
	{
	Update_Input_Buffer(input_buffer,uses_keyboard,true);
	}
//AI Input buffer
else
	{
	AI_Input();
	}
//If in attacking hitlag (not defending), players are 'frozen'
if (self_hitlag_frame>0)
	{
	self_hitlag_frame--;
	hitfall_try();
	frozen=true;
	}
//Actions that happen regardless of state and/or being frozen
Standard_Extra();
//State Machine
if (!frozen)
	{
	switch(state)
		{
		case PLAYER_STATE.idle:				Standard_Idle();			break;
		case PLAYER_STATE.crouching:		Standard_Crouching();		break;
		case PLAYER_STATE.walking:			Standard_Walking();			break;
		case PLAYER_STATE.walk_turnaround:	Standard_Walk_Turnaround(); break;
		case PLAYER_STATE.dashing:			Standard_Dashing();			break;
		case PLAYER_STATE.running:			Standard_Running();			break;
		case PLAYER_STATE.run_turnaround:   Standard_Run_Turnaround();	break;
		case PLAYER_STATE.run_stop:			Standard_Run_Stop();		break;
		case PLAYER_STATE.jumpsquat:        Standard_Jumpsquat();		break;
		case PLAYER_STATE.aerial:           Standard_Aerial();			break;
		case PLAYER_STATE.airdodging:       Standard_Airdodge();		break;
		case PLAYER_STATE.wavelanding:      Standard_Waveland();		break;
		case PLAYER_STATE.rolling:          Standard_Rolling();			break;
		case PLAYER_STATE.shielding:        Standard_Shielding();		break;
		case PLAYER_STATE.shield_break:     Standard_Shield_Break();	break;
		case PLAYER_STATE.parrying:			Standard_Parrying();		break;
		case PLAYER_STATE.parry_stun:		Standard_Parry_Stun();		break;
		case PLAYER_STATE.spot_dodging:		Standard_Spot_Dodge();		break;
		case PLAYER_STATE.in_hitlag:        Standard_Hitlag();			break;
		case PLAYER_STATE.in_hitstun:       Standard_Hitstun();			break;
		case PLAYER_STATE.in_tumble:        Standard_Tumble();			break;
		case PLAYER_STATE.helpless:         Standard_Helpless();		break;
		case PLAYER_STATE.magnetized:	    Standard_Magnetized();		break;
		case PLAYER_STATE.in_flinch:		Standard_Flinch();			break;
		case PLAYER_STATE.in_lag:		    Standard_Lag();				break;
		case PLAYER_STATE.knockdown:		Standard_Knockdown();		break;
		case PLAYER_STATE.techrolling:      Standard_Techrolling();		break;
		case PLAYER_STATE.teching:			Standard_Teching();			break;
		case PLAYER_STATE.ledge_snap:		Standard_Ledge_Snap();		break;
		case PLAYER_STATE.ledge_hang:		Standard_Ledge_Hang();		break;
		case PLAYER_STATE.ledge_getup:		Standard_Ledge_Getup();		break;
		case PLAYER_STATE.ledge_jump:		Standard_Ledge_Jump();		break;
		case PLAYER_STATE.ledge_roll:		Standard_Ledge_Roll();		break;
		case PLAYER_STATE.ledge_attack:		Standard_Ledge_Attack();	break;
		case PLAYER_STATE.ledge_tether:		Standard_Ledge_Tether();	break;
		case PLAYER_STATE.knocked_out:		Standard_Knocked_Out();		break;
		case PLAYER_STATE.respawning:		Standard_Respawning();		break;
		case PLAYER_STATE.attacking:		Standard_Attacking();		break;
		case PLAYER_STATE.grabbing:			Standard_Grabbing();		break;
		case PLAYER_STATE.is_grabbed:		Standard_Is_Grabbed();		break;
		case PLAYER_STATE.in_grab_release:	Standard_Grab_Release();	break;
		case PLAYER_STATE.lost:				Standard_Lost();			break;
		case PLAYER_STATE.entrance:			Standard_Entrance();		break;
		default: show_debug_message("FATAL ERROR - Player object has a state that is not tied to a standard script."); break;
		}
	}
//Custom script
Standard_Custom();
//Update the controllers variables to calculate stick speeds on the next step
//Update_Sticks_Previous(uses_keyboard);
//Animate sprite
anim_frame+=anim_speed*anim_multiplier;
if (anim_frame>sprite_get_number(anim_sprite))
	{
	anim_frame=0;
	}
//Visual Effects
damage_text_random *= 0.9;
damage_text_x = irandom_range(-damage_text_random,damage_text_random);
damage_text_y = irandom_range(-damage_text_random,damage_text_random);
if (!obj_background_manager.background_clear_amount > 0)
	{
	fade_value=min(fade_value+0.1,1);
	}
/* DEBUG */
if (debug)
	{
	//Add states
	if (state_log[| ds_list_size(state_log)-1]!=state)
		{
		ds_list_add(state_log,state);
		}
	//Manage previous states - only 10 states
	while(ds_list_size(state_log)>10)
		{
		ds_list_delete(state_log,0);
		}
	}