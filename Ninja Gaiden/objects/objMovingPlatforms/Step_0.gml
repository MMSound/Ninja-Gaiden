/// @description Move
round_velocity();

if (!game_paused())
{
	if (moveOutsideView)
	{
		if (!move_platform_topsolid_x(xspeed))
		{
			xspeed *= -1;
			xspeedSub = 0;
		}
		if (!move_platform_topsolid_y(yspeed))
		{
			yspeed *= -1;
			yspeedSub = 0;
		}
	}
	else
	{
		if (collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, bbox_top, objPlayer, false, true))
		{
			moveOutsideView = true;
			with (objMovingPlatforms)
			{
				if (!moveOutsideView)
				{
					moveOutsideView = true;
					if (id != other.id)
					{
						x = other.x;
					}
				}
			}
		}
	}
}