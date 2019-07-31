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
	//Slowly move camera to position inside the room
	cam_x = clamp(round(lerp(cam_x, cam_x_goal, 0.1)), 0, room_width - cam_w);
	cam_y = clamp(round(lerp(cam_y, cam_y_goal, 0.1)), 0, room_height - 0); //cam_h
	//Apply Camera Shake
	cam_x += choose(-cam_shake_h, cam_shake_h);
	cam_y += choose(-cam_shake_v, cam_shake_v);
	//Gradually lower the camera shake amount
	cam_shake_h = approach(cam_shake_h, 0, 1);
	cam_shake_v = approach(cam_shake_v, 0, 1);
	//Set the camera position
	camera_set_view_pos(cam, cam_x, cam_y);
	
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
			alarm_set(0,3)		
		}
	}
#endregion
/*/*----------------------------------------------------------------*/
#region Startup countdown
countdown = max(--countdown, 0);
if (state == GAME_STATE.startup)
	{
	//Timer until the start
	if (countdown <= 60)
		{
		state = GAME_STATE.normal;
		with(obj_player)
			{
			set_state(PLAYER_STATE.idle);
			}
		}
	}
#endregion

if (countdown = 239)   {audio_play_sound(sfx_announcer_3,5,false)}
if (countdown = 185)   {audio_play_sound(sfx_announcer_2,5,false)}
if (countdown = 135)   {audio_play_sound(sfx_announcer_1,5,false)}
if (countdown = 70)   {audio_play_sound(sfx_announcer_go,5,false)}

// PALETTE CODE
current_pal=wrap(current_pal,0,pal_swap_get_pal_count(my_portrait_pal_sprite)-1);

if(keyboard_check_pressed(vk_up))
    current_pal++;
if(keyboard_check_pressed(vk_down))
    current_pal--;