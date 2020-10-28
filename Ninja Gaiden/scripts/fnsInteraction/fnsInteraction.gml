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
			var _event = 6;
			if (_healthLeft <= 0)
			{
				_event = 7;
			}
			_entity.healthPoints -= _value;
			with (_entity)
			{
				event_user(_event);
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