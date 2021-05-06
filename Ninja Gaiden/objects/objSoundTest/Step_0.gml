/// @description Controlling the selection
if (global.inputLeftPressed)
{
	if (currentSong > 0)
	{
		currentSong--;
	}
	else
	{
		currentSong = (array_length(soundTest) - 1);
	}
	music_stop();
}
if (global.inputRightPressed)
{
	if (currentSong < (array_length(soundTest) - 1))
	{
		currentSong++;
	}
	else
	{
		currentSong = 0;
	}
	music_stop();
}
if (global.inputUpPressed || global.inputDownPressed)
{
	soundtrackType = !soundtrackType;
	music_stop();
}
if (global.inputPausePressed)
{
	if (global.musicPlaying)
	{
		music_stop();
	}
	else
	{
		if (soundtrackType) //we wanna switch the soundtrack here if we're on pce
		{
			if (music_get_alt(soundTest[currentSong][0]))
			{
				music_play(music_get_alt(soundTest[currentSong][0]));
			}
			else
			{
				music_play(soundTest[currentSong][0]);
			}
		}
		else
		{
			music_play(soundTest[currentSong][0]);
		}
	}
}
if (global.inputAttackPressed)
{
	room_transition(rmTitleScreen);
}