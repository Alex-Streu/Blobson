/// @description CONTROL ALL GAME OBJECTS
#region Input - accept from all controllers
var _start = false, _select = false;
for(var i = 0; i < number_of_devices; i++)
	{
	if (gamepad_button_check_pressed(i, gp_start)) _start = true;
	if (gamepad_button_check_pressed(i, gp_select)) _select = true;
	}
#endregion	
/*----------------------------------------------------------------*/

if (state == GAME_STATE.normal || state == GAME_STATE.startup || (state == GAME_STATE.paused && _start))
	{
	/*TIMERS*/
	current_frame++;
	frames_advanced++;
	draw = true;
	
	/*MOVE ALL PLAYERS, ONE AT A TIME*/
	with(obj_player)
		{
		event_perform(ev_other, event_step);
		}
		
	/*MOVE ALL HURTBOXES, ONE AT A TIME*/
	with(obj_hurtbox)
		{
		event_perform(ev_other, event_step);
		}
		
	/*CALCULATE ALL HITBOXES*/
	//Add all of the hitboxes to the priority queue to sort
	with(obj_hitbox)
		{
		ds_priority_add(other.hitbox_priority_queue, id, id + priority);
		}
		
	//Based on the priority queue
	while(!ds_priority_empty(hitbox_priority_queue))
		{
		with(ds_priority_delete_min(hitbox_priority_queue))
			{
			event_perform(ev_other, event_step);
			}
		}
		
	/*CALCULATE ALL EFFECTS*/
	with(obj_fx)
		{
		event_perform(ev_other, event_step);
		}
	part_system_update(global.part_sys);
	
	/*CAMERA*/
	Camera_Average();
	
	/*BACKGROUND FADE*/
	with(obj_background_manager)
		{
		event_perform(ev_other, event_step);
		}
		
	/*KNOCKOUTS*/
	//Getting KO'ed
	with(obj_player)
		{
		if (state != PLAYER_STATE.knocked_out && state != PLAYER_STATE.lost)
			{
			if (check_blastzones(0, 0, room_width, room_height))
				{
				die();
				}
			}
		}
	}
else
	{
	//No new drawing
	draw = false;
	
	/*UPDATE ALL INPUT BUFFERS, ONE AT A TIME*/
	//Update Input Buffer even when paused; Inputs are taken on the frame it is unpaused.
	with(obj_player)
		{
		event_perform(ev_other, event_paused);
		}
	}
	
/*----------------------------------------------------------------*/
#region Pausing
if (_select)
	{
	if (state == GAME_STATE.paused)
		{
		state = GAME_STATE.normal;
		}
	else
	if (state == GAME_STATE.normal)
		{
		state = GAME_STATE.paused;
		frames_advanced = 0;
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region End the game
if (_start)
	{
	if (state == GAME_STATE.normal)
		{
		part_particles_clear(global.part_sys);
		room_goto(rm_Custom_Controls);
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region Startup countdown
countdown = max(--countdown, 0);
if (state == GAME_STATE.startup)
	{
	//Timer until the start
	if (countdown <= count_time)
		{
		state = GAME_STATE.normal;
		with(obj_player)
			{
			set_state(PLAYER_STATE.idle);
			}
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region Daynight Cycle Values
//Calculate the RGB values for Day / Night
var _time = (current_time / 1000) % 100;
//Normal
if (_time < 30)
	{
	daynight_r = 0;
	daynight_g = 0;
	daynight_b = 0;
	}
//Dusk
else if (_time < 50)
	{
	var _amt = (_time - 30) / 20;
	daynight_r = lerp(0, 0.15, _amt);
	daynight_g = lerp(0, -0.1, _amt);
	daynight_b = lerp(0, 0.1, _amt);
	}
//Night
else if (_time < 80)
	{
	var _amt = (_time - 50) / 30;
	daynight_r = lerp(0.15, -0.4, _amt);
	daynight_g = lerp(-0.1,-0.3,_amt);
	daynight_b = lerp(0.1, -0.1, _amt);
	}
//Dawn
else if (_time < 100)
	{
	var _amt = (_time - 80) / 20;
	daynight_r = lerp(-0.4, 0, _amt);
	daynight_g = lerp(-0.3, 0, _amt);
	daynight_b = lerp(-0.1, 0, _amt);
	}
#endregion