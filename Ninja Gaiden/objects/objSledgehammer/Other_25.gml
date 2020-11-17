/// @description Movement and attack
switch (phase)
{
	case 0: //move normally
		if (timer % 2 == 0) //one pixel every x frames
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
			sprite_index = sprSledgehammerSwing;
			imgSpd = 0;
		}
		break;
	case 1: //attack
		if (timer == 10)
		{
			image_index = 1;
		}
		else if (timer == 14)
		{
			image_index = 1;
		}
		else if (timer == 20)
		{
			phase = 0;
			timer = 0;
			sprite_index = sprSledgehammer;
			image_index = 0;
			imgSpd = (1 / 4);
		}
		break;
}
timer++;