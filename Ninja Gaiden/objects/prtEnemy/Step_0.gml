/// @description Damage player
if (!global.timeFrozen)
{
	if (canDespawn) //use the despawning behavior
	{
		if (!despawnOutsideView)
		{
			if (inside_view())
			{
				event_inherited();
			}
			else
			{
				if (!in_range(xstart, (global.viewX - 32), (global.viewX + (global.viewW + 32))))
				{
					x = xstart;
					y = (ystart + 8);
				}
				else
				{
					event_inherited();
				}
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
	else
	{
		event_inherited();
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