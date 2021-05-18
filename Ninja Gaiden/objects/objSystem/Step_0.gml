/// @description Game control
if (room_get_type() == ROOM_LEVEL || room_get_type() == ROOM_BOSS)
{
	if (!global.deathRespawn)
	{
		//pausing
		if (global.inputPausePressed)
		{
			if (global.bossPhase != 2)
			{
				if (global.canControl && !instance_exists(prtOptionsMenu))
				{
					global.paused = !global.paused;
					if (audio_is_playing(sfxPause))
					{
						audio_stop_sound(sfxPause);
					}
					play_sfx(sfxPause);
					
					//pause music
					if (global.musicSound != noone)
					{
						if (global.paused)
						{
							audio_pause_sound(global.musicSound);
						}
						else
						{
							if (global.queuedSong == noone)
							{
								audio_resume_sound(global.musicSound);
							}
							else
							{
								music_play(global.queuedSong);
								global.queuedSong = noone;
							}
							audio_sound_gain(global.musicSound, ((global.musicVolume * 0.75) * global.musicFadeVolume), 0);
						}
					}
				}
			}
		}

		/*debug
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
		}*/

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
				global.screenColorIndex = (global.paused * 2);
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
			if (global.bossPhase != 2)
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
		
		global.ninpo = clamp(global.ninpo, 0, 99);
	}
	else
	{
		if (++global.deathRespawnTimer == global.deathRespawnTime)
		{
			room_transition();
		}
		
		//music
		if (global.deathRespawnTimer == 2)
		{
			music_play(bgmDeath);
		}
	}
}

if (keyboard_check_pressed(vk_f2)) //game reset
{
	game_restart();
}