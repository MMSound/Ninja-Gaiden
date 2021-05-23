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
	if (!music_get_alt(soundTest[currentSong][0])) //reset the soundtrack mode if there is no alt song
	{
		soundtrackType = 0;
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
	if (!music_get_alt(soundTest[currentSong][0])) //reset the soundtrack mode if there is no alt song
	{
		soundtrackType = 0;
	}
	music_stop();
}
if (global.inputUpPressed || global.inputDownPressed)
{
	if (global.beatenGame && music_get_alt(soundTest[currentSong][0]))
	{
		soundtrackType = !soundtrackType;
		music_stop();
	}
}
if (global.inputPausePressed || global.inputJumpPressed)
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
if (global.inputAttackPressed) //exiting
{
	room_transition(rmTitleScreen);
}

if (global.musicPlaying) //play button animation
{
	if (playButtonFrame < 2)
	{
		playButtonFrame++;
	}
}
else
{
	if (playButtonFrame > 0)
	{
		playButtonFrame--;
	}
}