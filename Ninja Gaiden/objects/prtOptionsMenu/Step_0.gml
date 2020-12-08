/// @description Controlling
if (!isDormant)
{
	if (timer > 1)
	{
		if (global.inputDownPressed)
		{
			if (currentOption < (array_length(optionsText) - 1))
			{
				currentOption++;
			}
			else
			{
				currentOption = 0;
			}
			play_sfx(sfxShuriken);
		}
		if (global.inputUpPressed)
		{
			if (currentOption > 0)
			{
				currentOption--;
			}
			else
			{
				currentOption = (array_length(optionsText) - 1);
			}
			play_sfx(sfxShuriken);
		}
		if (global.inputPausePressed)
		{
			event_user(1);
		}
		if (global.inputLeftPressed)
		{
			event_user(2);
		}
		if (global.inputRightPressed)
		{
			event_user(3);
		}
	}
	
	timer++;
}
else
{
	timer = 0;
}