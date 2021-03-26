/// @description Score countdown
if (global.bossPhase == 1)
{
	event_inherited();
	
	//iframes
	if (iFrameTimer > 0)
	{
		//canHit = false;
		canBeHit = false;
		visible = (iFrameTimer % 2 == 0);
		iFrameTimer--;
	}
	else
	{
		//canHit = true;
		canBeHit = true;
		visible = true;
	}
}
else if (global.bossPhase == 2)
{
	imgSpd = 0;
	image_speed = 0;
	if (deathTimer == 0)
	{
		play_sfx(sfxBossHit);
	}
	if (deathTimer % 4 == 0)
	{
		if (audio_is_playing(sfxItemAcquisition))
		{
			audio_stop_sound(sfxScoreCountdown);
		}
		play_sfx(sfxScoreCountdown);
		
		if (global.levelTime > 0)
		{
			global.levelTime = clamp((global.levelTime - 2), 0, 1000);
			global.gameScore += 20;
		}
		else if (global.ninpo > 0)
		{
			global.ninpo = clamp((global.ninpo - 2), 0, 99);
			global.gameScore += 20;
		}
		else if (global.playerHealth > 0)
		{
			global.playerHealth--;
			global.gameScore += 10;
		}
		else
		{
			event_user(7);
		}
	}
	deathTimer++;
}