/// @description Game control
if (!global.deathRespawn)
{
	//pausing
	if (global.inputPausePressed)
	{
		if (global.canControl)
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
				global.currentWeapon++;
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
	if (global.gameTimer % 60 == 0)
	{
		if (global.uiColorIndex++ == 11)
		{
			global.uiColorIndex = 2;
		}
	}
	global.screenColorIndex = global.paused;

	//increment the master timer (need in-level timer later)
	global.gameTimer++;
}
else
{
	if (++global.deathRespawnTimer = global.deathRespawnTime)
	{
		instance_create_depth(x, y, -200, objRoomTransition);
	}
}