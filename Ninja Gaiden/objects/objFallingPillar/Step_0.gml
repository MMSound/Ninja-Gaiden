/// @description Move
if (!game_paused())
{
	if (place_meeting(x, (y - 1), objPlayer))
	{
		activated = true;
	}

	if (activated)
	{
		/*if (fallTimer % 2 == 0) //shake back and forth
		{
			if (x == xstart)
			{
				x += 1;
			}
			else
			{
				x = xstart;
			}
		}*/
	
		if (fallTimer > 20) //wait 20 frames
		{
			if (fallTimer < 30)
			{
				yspeed = (fallTimer % 2 == 0);
			}
			else
			{
				if (fallTimer % 30 == 0)
				{
					yspeed++;
				}
			}
		}
	
		fallTimer++;
	}

	round_velocity();

	move_platform_y(yspeed);
}