/// @description Blinking (and level select)
if (global.inputPausePressed)
{
	if (!playedSFX)
	{
		play_sfx(sfxItemAcquisition);
		playedSFX = true;
	}
	if (isLevelSelect)
	{
		room_transition(levelSelect[selectedLevel]);
	}
	else
	{
		room_transition(currentDemoLevel);
	}
}

if (keyboard_check_pressed(vk_shift))
{
	isLevelSelect = true;
}
if (isLevelSelect)
{
	if (keyboard_check_pressed(vk_left))
	{
		if (selectedLevel > 0)
		{
			selectedLevel--;
		}
		else
		{
			selectedLevel = (array_length(levelSelect) - 1);
		}
	}
	if (keyboard_check_pressed(vk_right))
	{
		if (selectedLevel < (array_length(levelSelect) - 1))
		{
			selectedLevel++;
		}
		else
		{
			selectedLevel = 0;
		}
	}
}

if (blinkTimer % 20 == 0)
{
	drawText = !drawText;
}

blinkTimer++;