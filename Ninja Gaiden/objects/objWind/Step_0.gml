/// @description Move the player
if (instance_exists(objPlayer))
{
	with (objPlayer)
	{
		if (place_meeting(x, y, objWind))
		{
			var _wind = instance_place(x, y, objWind);
			modDirection = _wind.moveDir;
		}
		else
		{
			modDirection = 0;
		}
	}
}