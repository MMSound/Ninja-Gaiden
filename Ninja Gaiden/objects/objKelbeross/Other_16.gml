/// @description Getting hit
if (iFrameTimer == 0)
{
	//hit the controller
	if (instance_exists(objKelberossController))
	{
		entity_damage(objKelberossController, 1);
	}
	
	iFrameTimer = iFrameTime;
	canBeHit = false;
	play_sfx(sfxBossHit);
	
	if (phase == 0)
	{
		play_sfx(sfxKelberossRoar, false, 20);
		with (objKelbeross)
		{
			phase = 1;
			yspeed = -6;
		}
	}
}