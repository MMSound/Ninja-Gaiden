/// @description Go to next level
if (place_meeting(x, y, objPlayer) && !game_paused())
{
	global.transition = true;
	room_transition(nextRoom, 5);
	global.checkpointX = 0;
	global.checkpointY = 0;
	instance_destroy(id);
}