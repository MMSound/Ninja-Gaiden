/// @description Movement
if (!inside_view())
{
	activated = false;
}
else
{
	if (activated)
	{
		if (grounded())
		{
			yspeed = -2;
			animTimer = 0;
			image_index = 1;
		}

		xspeed = (3 * image_xscale);
		if (coll_x(xspeed, objSolid)) //turn around at collision with walls
		{
			image_xscale *= -1;
		}

		//animate
		if (animTimer > 3)
		{
			image_index = 0;
		}
		animTimer++;
	}
	else
	{
		xspeed = 0;
		sprite_index = sprTigerStretch;
		if (instance_exists(objPlayer))
		{	
			image_xscale = (objPlayer.x - x == 0 ? -1.00 : sign(objPlayer.x - x)); //face player
			if ((distance_to_object(objPlayer) <= 128) && objPlayer.y == y) //activate
			{
				activated = true;
				sprite_index = sprTiger;
			}
		}
	}
}