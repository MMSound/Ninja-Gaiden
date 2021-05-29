/// @description Fade out
if (lifeTimer == 200 || global.inputPausePressed)
{
	room_transition(rmOpening, 5, true);
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