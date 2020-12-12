/// @description Setting the checkpoint
if (place_meeting_player(x, y))
{
	if (global.checkpointX != x)
	{
		global.checkpointX = x;
		global.checkpointY = y;
	}
}