/// @description Fade out
if (lifeTimer == 200)
{
	room_transition(rmOpening, 5, true);
}
if (global.inputPausePressed)
{
	room_transition(rmTitleScreen);
}

//fade
if (lifeTimer % 4 == 0 && !instance_exists(objRoomTransition))
{
	if (global.screenColorIndex > 0)
	{
		global.screenColorIndex--;
	}
}

//jingle
if (lifeTimer == 8)
{
	music_play(bgmMiniMacroSoundLogo);
}

lifeTimer++;