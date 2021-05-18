/// @description Custom start input
switch (currentOption)
{
	case 0:
		var _menu = instance_create_depth(x, y, (depth - 50), objKeyboardSetup);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 1:
		var _menu = instance_create_depth(x, y, (depth - 50), objGamepadSetup);
			_menu.parentMenu = id;
		isDormant = true;
		break;		
	case 2:
		var _menu = instance_create_depth(x, y, (depth - 50), objAudioMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 3:
		var _menu = instance_create_depth(x, y, (depth - 50), objDisplayMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 4:
		var _menu = instance_create_depth(x, y, (depth - 50), objAccessibilityMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 5:
		if (room == rmOptionsMenu)
		{
			room_transition(rmTitleScreen);
		}
		else
		{
			global.screenColorIndex = (global.paused * 2);
			instance_destroy(id);
		}
		save_load_options(0);
		break;
}