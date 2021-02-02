/// @description Movement and attack
switch (phase)
{
	case 0: //move normally
		xspeed = image_xscale;
		
		if (coll_x(xspeed, objSolid)) //turn around at collision with walls
		{
			image_xscale *= -1;
		}
		else if (coll_x(xspeed, objBoundary))
		{
			image_xscale *= -1;
		}
		
		if (timer == 130) //switch phase
		{
			phase = 1;
			timer = 0;
			xspeed = (2 * image_xscale);
			yspeed = -4.5;
			sprite_index = sprMartialArtistKick;
			image_index = 0;
		}
		break;
	case 1: //attack
		if (yspeed < 0)
		{
			imgSpd = (1 / 3);
		}
		else
		{
			imgSpd = 0;
			image_index = 3;
		}
		
		if (grounded())
		{
			phase = 0;
			timer = 0;
			xspeed = image_xscale;
			yspeed = 0;
			sprite_index = sprMartialArtistWalk;
			image_index = 0;
			imgSpd = (1 / 4);
		}
		break;
}
timer++;