/// @description Moving the player
if (instance_exists(objPlayer))
{
	with (objPlayer)
	{
		if (!isWallClimb && !isHang)
		{
			if (place_meeting(x, y, objWind)) //wind
			{
				if (!place_meeting(x, y, objSnow))
				{
					var _wind = instance_place(x, y, objWind);
					modDirection = _wind.moveDir;
				}
				else
				{
					modDirection = 0;
				}
			}
			else
			{
				modDirection = 0;
			}
		}
		else
		{
			modDirection = 0;
		}
	}
}
if (instance_exists(objSnowflake))
{
	with (objSnowflake)
	{
		if (place_meeting(x, y, objWind))
		{
			var _wind = instance_place(x, y, objWind);
			xspeed = _wind.moveDir;
		}
	}
}