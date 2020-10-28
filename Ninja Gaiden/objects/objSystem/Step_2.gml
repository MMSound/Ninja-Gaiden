/// @description Camera adjustment
if (instance_exists(global.cameraFocusObject))
{
	camera_set_position((global.cameraFocusObject.x - global.cameraOffsetX), (global.cameraFocusObject.y - global.cameraOffsetY));
}

//Adjust parallax
if (instance_exists(objParallax))
{
	if (!game_paused())
	{
		with (objParallax)
		{
			event_user(0);
		}
	}
}