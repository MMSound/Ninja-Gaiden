/// @description Variables
isDormant = false;
currentOption = 0;
optionSeparation = 16;
parentMenu = noone;

event_user(14);

timer = 0;

//useful for submenus
function return_to_menu()
{
	if (currentOption == (array_length(optionsText) - 1))
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
}