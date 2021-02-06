/// @description Gamepad
global.currentGamepad = gamepad_get_connected();
gamepad_set_axis_deadzone(global.currentGamepad, 0.2);

//controller message
if (global.currentGamepad != -1) //connecting
{
	if (!setController)
	{
		var _status = instance_create_depth(0, 0, -1000, objGamepadStatusBar);
			_status.image_index = 0;
		setController = true;
	}
}
else if (global.currentGamepad == -1) //disconnecting
{
	if (setController)
	{
		var _status = instance_create_depth(0, 0, -1000, objGamepadStatusBar);
			_status.image_index = 1;
		setController = false;
	}
}