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
	if (keyboard_check_pressed(vk_backspace))
	{
		global.gpLeft = gp_padl;
		global.gpRight = gp_padr;
		global.gpUp = gp_padu;
		global.gpDown = gp_padd;
		global.gpJump = gp_face1;
		global.gpAttack = gp_face3;
		global.gpWeapon = gp_face4;
		global.gpPause = gp_start;
		global.gpSelect = gp_select;
		play_sfx(sfxPlayerHit);
		instance_destroy(id);
		if (instance_exists(parentMenu))
		{
			if (parentMenu.isDormant)
			{
				parentMenu.isDormant = false;
			}
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