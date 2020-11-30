/// @description Go to next level
if (place_meeting(x, y, objPlayer))
{
	global.transition = true;
	room_transition(nextRoom);
	instance_destroy(id);
}