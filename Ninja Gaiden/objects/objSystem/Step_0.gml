/// @description Game control
if (room_get_type() == ROOM_LEVEL)
{
	if (!global.deathRespawn)
	{
		//pausing
		if (global.inputPausePressed)
		{
			if (global.canControl && !instance_exists(prtOptionsMenu))
			{
				global.paused = !global.paused;
				if (audio_is_playing(sfxPause))
				{
					audio_stop_sound(sfxPause);
				}
				play_sfx(sfxPause);
			}
		}

		//debug
		if (keyboard_check_pressed(vk_shift))
		{
			if (keyboard_check(vk_control)) //time stopping
			{
				if (!instance_exists(objTimeFreezeController))
				{
					instance_create_depth(0, 0, -100, objTimeFreezeController);
				}
			}
			else //weapon increase
			{
				if (global.currentWeapon < 5)
				{
					set_weapon(global.currentWeapon + 1);
				}
				else
				{
					global.currentWeapon = 0;
				}
			}
		}
		if (keyboard_check_pressed(vk_f3)) //ninpo refill
		{
			global.ninpo = 30;
		}
		if (keyboard_check_pressed(vk_f4))
		{
			if (instance_exists(objPlayer))
			{
				objPlayer.healthPoints--;
			}
		}

		//camera
		if (instance_exists(objPlayer))
		{
			global.cameraFocusObject = objPlayer;
		}

		//drawing
		if (!instance_exists(objRoomTransition))
		{
			if (!instance_exists(prtOptionsMenu))
			{
				global.screenColorIndex = global.paused;
			}
			else
			{
				global.screenColorIndex = 0;
			}
		}

		//increment the master timer
		global.gameTimer++;
	
		//in-level timer
		if (!game_paused() && !global.timeFrozen)
		{
			global.levelTimer++;
			
			if (global.levelTimer % 60 == 0)
			{
				if (global.levelTime > 0)
				{
					global.levelTime--;
				}
				else
				{
					entity_damage(objPlayer, 69);
				}
				if (global.uiColorIndex++ == 11)
				{
					global.uiColorIndex = 2;
				}
			}
		}
		else if (game_paused())
		{
			if (global.inputSelectPressed)
			{
				if (!instance_exists(prtOptionsMenu))
				{
					instance_create_depth((global.viewX + 16), (global.viewY + 16), -9999, prtOptionsMenu);
				}
			}
		}
	}
	else
	{
		if (++global.deathRespawnTimer == global.deathRespawnTime)
		{
			room_transition();
		}
	}
}