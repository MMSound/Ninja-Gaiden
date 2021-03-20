/// @description Control
if (lifeTimer >= lifeTime)
{
	instance_destroy(id);
}
if (!game_paused())
{
	if (phase < 1.0)
	{
		phase += 0.2;
	}
	else
	{
		phase = 0;
	}
	
	amplitude += 2;
	
	lifeTimer++;
}