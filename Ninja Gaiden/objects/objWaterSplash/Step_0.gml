/// @description Move
if (!game_paused())
{
	if (lifeTimer < lifeTime)
	{
		yspeed += 0.5;
	
		x += xspeed;
		y += yspeed;
		
		if (!inside_view())
		{
			instance_destroy(id);
		}
	
		lifeTimer++;
	}
	else
	{
		instance_destroy(id);
	}
}