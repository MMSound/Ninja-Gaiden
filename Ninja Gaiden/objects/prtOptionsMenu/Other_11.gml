/// @description Custom start input
switch (currentOption)
{
	case 0:
		var _menu = instance_create_depth(x, (y + 128), depth, objKeyboardSetup);
			_menu.parentMenu = id;
		isDormant = true;
		break;	
	case 2:
		var _menu = instance_create_depth(x, (y + 128), depth, objAudioMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 3:
		var _menu = instance_create_depth(x, (y + 128), depth, objDisplayMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 4:
		var _menu = instance_create_depth(x, (y + 128), depth, objAccessibilityMenu);
			_menu.parentMenu = id;
		isDormant = true;
		break;
	case 5:
		room_transition(rmTitleScreen);
		save_load_options(0);
		break;
}