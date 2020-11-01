/// @description Count up
if (!game_paused())
{
	if (lifeTimer < lifeTime)
	{
		lifeTimer++;
		if (lifeTimer % 60 == 0) //increase clock image
		{
			imgFrame++;
			play_sfx(sfxTickTock);
		}
		if (lifeTimer % 30 == 0) //move down
		{
			drawOffsetY++;
		}
	}
	else
	{
		instance_destroy();
	}
}