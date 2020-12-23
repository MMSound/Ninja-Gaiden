/// @description Contact with player
if (place_meeting_player(x, y))
{
	if (eventType) //ending the minecart
	{
		if (instance_exists(objPickaxeManCart))
		{
			with (objPickaxeManCart)
			{
				moveSpeed = 4;
			}
			instance_destroy(id);
		}
	}
	else
	{
		if (!instance_exists(objPickaxeManCart))
		{
			instance_create_depth(2368, 72, depth, objPickaxeManCart);
			instance_destroy(id);
		}
	}
}