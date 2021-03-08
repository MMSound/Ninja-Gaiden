/// @description Check if we can pass
if (lifeTimer == lifeTime || global.inputPausePressed)
{
	if (nextRoom != rmInit)
	{
		room_transition(nextRoom);
	}
}
lifeTimer++;

camera_set_position(0, 0);