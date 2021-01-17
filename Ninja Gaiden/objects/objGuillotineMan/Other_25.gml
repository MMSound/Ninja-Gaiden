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
		}
		else if (coll_x(xspeed, objBoundary))
		{
			image_xscale *= -1;
		}
		
		if (timer == 120) //switch phase
		{
			phase = 1;
			timer = 0;
			xspeed = 0;
			sprite_index = sprGuillotineManThrow;
			image_index = 0;
			imgSpd = 0;
		}
		break;
	case 1: //attack		
		if (timer > 10)
		{
			if (!hasFired) //fire only once
			{
				myGuillotine = instance_create_depth((x + (14 * image_xscale)), (y - 23), (depth + 5), objGuillotine);
				myGuillotine.image_xscale = image_xscale;
				hasFired = true;
			}
			else
			{
				if (!instance_exists(myGuillotine))
				{
					phase = 2;
				}
			}
			
			if (timer < 14) //animate
			{
				image_index = 1;
			}
			else
			{
				image_index = 2;
			}
		}
		break;
	case 2: //go to phase 0
		phase = 0;
		timer = 0;
		hasFired = false;
		sprite_index = sprGuillotineManWalk;
		imgSpd = (1 / 4);		
		break;
}
timer++;