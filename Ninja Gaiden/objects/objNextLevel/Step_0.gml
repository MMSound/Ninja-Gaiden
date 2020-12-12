/// @description Go to next level
if (place_meeting(x, y, objPlayer))
{
	global.transition = true;
	room_transition(nextRoom);
	global.checkpointX = 0;
	global.checkpointY = 0;
	instance_destroy(id);
}