/// @description Movement
if (activated)
{
	xspeed = 1;
	
	//movement
	if (instance_exists(leftSide))
	{
		if (instance_exists(rightSide))
		{
			if (move_platform_x(xspeed))
			{
				with (leftSide)
				{
					move_platform_x(other.xspeed);
				}
				with (rightSide)
				{
					move_platform_x(other.xspeed);
				}
				
				//move player (if above)
				if (instance_exists(objPlayer))
				{
					if (in_range(objPlayer.x, bbox_left, bbox_right))
					{
						with (objPlayer)
						{
							if (xAxis == 0 && !grounded())
							{
								move_x(other.xspeed);
							}
						}
					}
				}
			}
		}
	}
}
else
{
	create_sides();
	if (collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, (bbox_top - 1), objPlayer, false, true))
	{
		activated = true;
	}
}