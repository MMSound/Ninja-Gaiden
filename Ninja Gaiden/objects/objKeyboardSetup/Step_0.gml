/// @description Setting controls
if (currentControl < array_length(controlVar))
{
	if (keyboard_check_pressed(vk_anykey))
	{
		if (!check_illegal_key(keyboard_key))
		{
			var _myKey = false;
			for (var i = 0; i < currentControl; i++) //increment through the list to check for repeats
			{
				if (variable_global_exists(controlVar[i]))
				{
					if (variable_global_get(controlVar[i]) == keyboard_key)
					{
						_myKey = true;
					}
				}
			}
			
			if (!_myKey) //finally set the key
			{
				variable_global_set(controlVar[currentControl], keyboard_key);
				play_sfx(sfxShuriken);
				currentControl++;
			}
			else
			{
				play_sfx(sfxPlayerHit);
			}
		}
		else if (keyboard_key == vk_backspace)
		{
			global.keyLeft = vk_left;
			global.keyRight = vk_right;
			global.keyUp = vk_up;
			global.keyDown = vk_down;
			global.keyJump = ord("Z");
			global.keyAttack = ord("X");
			global.keyWeapon = ord("C");
			global.keyPause = vk_enter;
			global.keySelect = vk_shift;	
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