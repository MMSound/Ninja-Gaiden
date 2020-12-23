/// @description Blinking (and level select)
switch (drawPhase)
{
	case 0: //logo moving up
		if (blinkTimer % 30 == 0) //fade in
		{
			if (logoColorIndex > 0)
			{
				logoColorIndex--;
			}
		}
	
		if (global.inputPausePressed || --logoY == 0)
		{
			drawPhase = 1;
			blinkTimer = 0;
			play_sfx(sfxLongSwordSlash);
		}
		break;
	case 1: //main	
		if (global.inputPausePressed)
		{
			if (!instance_exists(objRoomTransition))
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
		}

		if (global.inputSelectPressed)
		{
			if (keyboard_check(vk_control))
			{
				isLevelSelect = true;
			}
			else
			{
				room_transition(rmOptionsMenu);
			}
		}
		if (isLevelSelect)
		{
			if (global.inputLeftPressed)
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
			if (global.inputRightPressed)
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
		break;
}

blinkTimer++;