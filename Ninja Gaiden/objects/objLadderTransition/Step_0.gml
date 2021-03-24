/// @description Move player up
if (instance_exists(objPlayer))
{
	if (place_meeting(x, y, objPlayer))
	{
		if (objPlayer.isWallClimb)
		{
			objPlayer.y += (16 * objPlayer.yspeed);
		}
	}
}

visible = false;