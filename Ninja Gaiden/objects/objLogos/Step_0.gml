/// @description Fade out
if (lifeTimer == 200 || global.inputPausePressed)
{
	room_transition(rmTitleScreen);
}

//fade
if (lifeTimer % 4 == 0)
{
	if (global.screenColorIndex > 0)
	{
		global.screenColorIndex--;
	}
}

lifeTimer++;