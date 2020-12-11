/// @description Bounce off bosses
if (place_meeting(x, y, prtBoss))
{
	if (instance_exists(objPlayer))
	{
		with (objPlayer)
		{
			yspeed = -4;
		}
		multiHit = false;
	}
}