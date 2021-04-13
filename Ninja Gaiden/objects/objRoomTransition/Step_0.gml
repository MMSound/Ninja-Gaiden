/// @description Fade out and in
var _timer = global.isShader ? fadeTimer : (fadeTimer / 2);
switch (phase)
{
	case 0: //fade out
		if (timer % _timer == 0)
		{
			if (global.isShader)
			{
				if (global.screenColorIndex < (sprite_get_width(global.screenPalette) - 1))
				{
					global.screenColorIndex++;
					music_set_fade(global.musicFadeVolume - 0.16);
				}
				else
				{
					phase = 1;
					timer = 0;
				}
			}
			else
			{	
				if (drawAlpha < 1.0)
				{
					drawAlpha += 0.1;
					music_set_fade(global.musicFadeVolume - 0.1);
				}
				else
				{
					phase = 1;
					timer = 0;
				}
			}
		}
		break;
	case 1: //change room
		global.transition = false;
		if (global.musicPlaying)
		{
			music_stop();
		}
		
		if (roomTo == -1)
		{
			room_restart();
		}
		else
		{
			room_goto(roomTo);
		}
		if (global.deathRespawn) //reset all the player stuff
		{
			if (global.currentLives > 0)
			{
				if (global.livesOption)
				{
					global.currentLives--;
				}
			}
			else //temp
			{
				global.screenPalette = sprScreenPalette;
				global.screenColorIndex = 6;
				room_goto(rmGameOver);
			}
			global.currentWeapon = 0;
			global.ninpo = 0;
		}
		phase = 2;
		timer = 0;
		break;
	case 2:
		if (timer % 2 == 0)
		{
			if (global.isShader)
			{
				if (global.screenColorIndex > 0)
				{
					global.screenColorIndex--;
				}
				else
				{
					instance_destroy(id);
				}
			}
			else
			{
				if (drawAlpha > 0)
				{
					drawAlpha -= 0.1;
				}
				else
				{
					instance_destroy(id);
				}
			}
		}
		break;	
}
timer++;