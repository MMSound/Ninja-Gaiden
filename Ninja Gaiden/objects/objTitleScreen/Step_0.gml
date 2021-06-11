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
	
		if (global.inputPausePressed) //skipping
		{
			drawPhase = 2;
			blinkTimer = 0;
			play_sfx(sfxLongSwordSlash);
		}
		if (--logoY == 0)
		{
			drawPhase = 1;
			blinkTimer = 0;
			play_sfx(sfxLongSwordSlash);			
		}
		break;
	case 1: //flash
		if (blinkTimer < 16)
		{
			if (blinkTimer % 2 == 0)
			{
				logoColorIndex = (logoColorIndex == 0) ? 3 : 0;
			}
		}
		else
		{
			if (blinkTimer % 2 == 0)
			{
				if (--logoColorIndex == 0)
				{
					drawPhase = 2;
					blinkTimer = 0;
				}
			}
		}
		break;
	case 2: //main	
		switch (subPhase)
		{
			case 0: //press start
				if (blinkTimer % 20 == 0)
				{
					drawText = !drawText;
				}
				if (global.inputPausePressed)
				{
					subPhase = 1;
					blinkTimer = 0;
					drawText = true;
				}
				break;
			case 1: //main menu
				if (global.inputUpPressed) //pressing up
				{
					if (currentOption == 0)
					{
						currentOption = (array_length(optionsText) - 1);
					}
					else
					{
						currentOption--;
					}
					play_sfx(sfxShuriken);
					blinkTimer = 0;
				}
				if (global.inputDownPressed) //pressing down
				{
					if (currentOption == (array_length(optionsText) - 1))
					{
						currentOption = 0;
					}
					else
					{
						currentOption++;
					}
					play_sfx(sfxShuriken);
					blinkTimer = 0;
				}
				if (global.inputPausePressed) //pressing start
				{
					switch (currentOption)
					{
						case 0: //new game
							subPhase = 2;
							blinkTimer = 0;
							break;
						case 1: //continue
							if (file_exists("game.ngsav"))
							{
								save_load_game(1);
								room_transition(global.levelArray[global.currentAct][global.currentScene]);
							}
							break;
						case 2: //options
							room_transition(rmOptionsMenu);
							break;
						case 3: //sound test
							room_transition(rmSoundTest);
							break;
					}
				}
				if (global.inputSelectPressed) //level select
				{
					if (global.beatenGame)
					{
						subPhase = 3;
						currentLevel = 0;
						blinkTimer = 0;
					}
				}
				break;
			case 2: //new game
				if (global.inputPausePressed)
				{
					room_transition(rmActCardI);
				}
				else if (global.inputAttackPressed || global.inputSelectPressed || global.inputWeaponPressed || global.inputDownPressed || global.inputLeftPressed || global.inputRightPressed || global.inputUpPressed)
				{
					subPhase = 1;
					blinkTimer = 0;
					play_sfx(sfxBossHit);
				}
				break;
			case 3: //level select
				if (global.inputPausePressed)
				{
					room_transition(levelArray[currentLevel][0]);
				}
				if (global.inputLeftPressed)
				{
					if (currentLevel == 0)
					{
						currentLevel = (array_length(levelArray) - 1);
					}
					else
					{
						currentLevel--;
					}
					blinkTimer = 0;
				}
				if (global.inputRightPressed)
				{
					if (currentLevel == (array_length(levelArray) - 1))
					{
						currentLevel = 0;
					}
					else
					{
						currentLevel++;
					}
					blinkTimer = 0;
				}
				else if (global.inputAttackPressed || global.inputSelectPressed || global.inputWeaponPressed)
				{
					subPhase = 1;
					blinkTimer = 0;
					play_sfx(sfxBossHit);
				}				
				break;
		}
		if (blinkTimer >= 1200)
		{
			room_transition(rmOpening);
		}
		break;
}

blinkTimer++;