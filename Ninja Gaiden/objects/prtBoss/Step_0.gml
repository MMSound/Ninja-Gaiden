/// @description Score countdown
if (global.bossPhase == 1)
{
	event_inherited();
	
	//iframes
	if (!game_paused())
	{
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
			canBeHit = canBeHitManual;
			visible = true;
		}
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
	if (deathTimer % 4 == 0) //score countdown
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
	else if (deathTimer % 3 == 0) //explosion
	{
		for (var i = 0; i < 3; i++)
		{
			var _x = irandom_range(explosionRange[0], explosionRange[2]);
			var _y = irandom_range(explosionRange[1], explosionRange[3]);
			particle_create(_x, _y, sprBossExplosion, (1 / 2), false, -2000);
		}
		if (deathTimer % 9 == 0)
		{
			play_sfx(sfxMinorExplosion);
		}
	}
	deathTimer++;
}