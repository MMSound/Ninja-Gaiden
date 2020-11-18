//this script contains all interaction-related functions

/// @description damage an entity
function entity_damage(_entity, _value)
{
	if (is_undefined(_entity))
	{
		_entity = id;
	}
	if (instance_exists(_entity))
	{
		if (_entity.canBeHit)
		{
			var _healthLeft = _entity.healthPoints - _value;
			if (_healthLeft > 0) //just damage
			{
				with (_entity)
				{
					event_user(6);
				}
				_entity.healthPoints -= _value;
			}
			else //damaging
			{
				with (_entity)
				{
					event_user(7);
				}
				_entity.healthPoints = 0;			
			}
		}
	}
}

/// @description meeting an enemy
function place_meeting_enemy(_x, _y)
{
	return place_meeting(_x, _y, prtEnemy);
}

/// @description meeting the player
function place_meeting_player(_x, _y)
{
	return place_meeting(_x, _y, objPlayer);
}