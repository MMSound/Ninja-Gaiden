/// @description Control entity behavior
if (!game_paused())
{
	image_speed = imgSpd;
	
	if (object_index != objPlayer)
	{
		if (hasGravity)
		{	
			if (!grounded())
			{
				yspeed += grav;
			}
			else
			{
				yspeed = 0;
			}
		}
	}
	
	//execute child step
	event_user(15);
	
	if (object_index != objPlayer)
	{
		move_y(yspeed);
		move_x(xspeed, doSlope);
	}
	
	//child post-step
	event_user(10);
}
else
{
	image_speed = 0;
}