/// @description Damage player
if (!global.timeFrozen)
{
	if (!despawnOutsideView)
	{
		if (inside_view())
		{
			event_inherited();
		}
		else
		{
			x = xstart;
			y = ystart;
		}
	}
	else
	{
		if (inside_view())
		{
			event_inherited();
		}
		else
		{
			instance_destroy();
		}
	}
}

if (!game_paused())
{
	if (place_meeting_player(x, y) && canHit)
	{
		entity_damage(objPlayer, contactDamage);
		if (instance_exists(objPlayer))
		{
			if (objPlayer.hitObject == noone)
			{
				objPlayer.hitObject = id;
			}
		}
	}
}