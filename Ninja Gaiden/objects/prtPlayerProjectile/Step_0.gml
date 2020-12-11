/// @description Damage enemies
event_inherited();

if (!game_paused())
{
	//hit enemies
	if (place_meeting_enemy(x, y))
	{
		if (!hasHit)
		{
			var _enemy = instance_place(x, y, prtEnemy);
			entity_damage(_enemy, contactDamage);
			if (_enemy.canBeHit)
			{
				event_user(13);
			}
		}
		if (!multiHit)
		{
			hasHit = true;
			instance_destroy();
		}
	}
	
	//stay alive for only a certain time
	if (lifeTimer == lifeTime)
	{
		instance_destroy();
	}
	lifeTimer++;
}