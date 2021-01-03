/// @description Setting controls
if (currentControl < array_length(controlVar))
{
	var _input = gamepad_pressed();
	if (_input)
	{
		var _myKey = false;
		for (var i = 0; i < currentControl; i++) //increment through the list to check for repeats
		{
			if (variable_global_exists(controlVar[i]))
			{
				if (variable_global_get(controlVar[i]) == _input)
				{
					_myKey = true;
				}
			}
		}
		
		if (!_myKey) //finally set the key
		{
			variable_global_set(controlVar[currentControl], _input);
			play_sfx(sfxShuriken);
			currentControl++;
		}
		else
		{
			play_sfx(sfxPlayerHit);
		}
	}
}
else
{
	instance_destroy(id);
	if (instance_exists(parentMenu))
	{
		if (parentMenu.isDormant)
		{
			parentMenu.isDormant = false;
		}
	}
}