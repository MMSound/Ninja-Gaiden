/// @description Movement and attack
switch (phase)
{
	case 0: //move normally
		if (timer % 3 == 0) //one pixel every x frames
		{
			xspeed = (1 * image_xscale);
		}
		else
		{
			xspeed = 0;
		}
		
		if (coll_x(xspeed, objSolid)) //turn around at collision with walls
		{
			image_xscale *= -1;
			x += (1 * image_xscale);
		}
		else if (coll_x(xspeed, objBoundary))
		{
			image_xscale *= -1;
			x += (1 * image_xscale);
		}
		
		if (timer == 120) //switch phase
		{
			phase = 1;
			timer = 0;
			xspeed = 0;
			sprite_index = sprGunnerShoot;
			imgSpd = 0;
		}
		break;
	case 1: //attack
		if (timer >= 7)
		{
			timer = 0;
			hasFired = false;
			if (attackCount == 3)
			{
				sprite_index = sprGunnerWalk;
				imgSpd = (1 / 6);
				phase = 0;
				attackCount = 0;
			}
			else
			{
				image_index = 1;
			}
		}
		else if (timer >= 4)
		{
			if (attackCount < 3)
			{
				if (!hasFired)
				{
					var _bullet = instance_create_depth((x + (image_xscale * 8)), (y - 22), depth, objGenericBullet);
						_bullet.sprite_index = sprGunnerBullet;
						_bullet.xspeed = (3 * image_xscale);
						_bullet.image_xscale = image_xscale;
					hasFired = true;
					attackCount++;
				}
			}
			image_index = 0;
		}
		break;
}
timer++;