//this script contains all collision-related functions

/// @description are we grounded
function grounded()
{
	return (on_solid() || on_solid_entity() || on_slope() || on_topsolid() || on_rail());
}

/// @description detect if we are on a solid
function on_solid()
{
	return collision_rectangle(bbox_left, (bbox_bottom + 1), bbox_right, (bbox_bottom + 1), objSolid, false, true);
}

/// @description detect if we are on a solid entity
function on_solid_entity()
{
	var _entity = collision_rectangle(bbox_left, (bbox_bottom + 1), bbox_right, (bbox_bottom + 1), prtEntity, false, true);
	if (_entity != noone)
	{
		return _entity.isSolid;
	}
}

/// @description detect if we're on a top solid
function on_topsolid()
{
	//yspeed shenanigans
	if (yspeed < 0)
	{
		return false;
	}
	//check if we're on top first
	var _onPlatform = collision_rectangle(bbox_left, (bbox_bottom + 1), bbox_right, (bbox_bottom + 1), objTopSolid, false, true);
	if (!_onPlatform)
	{
		return noone;
	}
	//now if we're inside
	var _inPlatform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, objTopSolid, false, true);
	if (!_inPlatform)
	{
		return _onPlatform;
	}
	//if both then something's wrong and return noone
	if (_onPlatform == _inPlatform)
	{
		return noone;
	}
	return _onPlatform;
}

/// @description detect if we're on a slope
function on_slope()
{
	return collision_point(x, (bbox_bottom + 1), objSlope, true, true);
}

/// @description detect if we're on a rail
function on_rail()
{
	//check if we're on top first
	var _onPlatform = collision_rectangle(bbox_left, (bbox_bottom + 1), bbox_right, (bbox_bottom + 1), objRail, false, true);
	if (!_onPlatform)
	{
		return noone;
	}
	//now if we're inside
	var _inPlatform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, objRail, false, true);
	if (!_inPlatform)
	{
		return _onPlatform;
	}
	//if both then something's wrong and return noone
	if (_onPlatform == _inPlatform)
	{
		return noone;
	}
	return _onPlatform;
}

/// @description detect if we're able to grab a rail
function can_grab_rail()
{
	return collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, (bbox_top + 1), objRail, false, true);
}

/// @description detect if there is a solid above
function solid_above()
{
	return collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, (bbox_top - 1), objSolid, false, true);
}

/// @description detect if there is a solid entity above
function solid_entity_above()
{
	var _entity = collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, (bbox_top - 1), prtEntity, false, true);
	if (_entity)
	{
		return _entity.isSolid;
	}
}

/// @description detect solidity above
function solidity_above()
{
	return (solid_above() || solid_entity_above());
}

/// @description horizontal collision
function coll_x(_xDir, _object)
{
	//setup variables
	if (is_undefined(_object))
	{
		_object = objSolid;
	}
	var _side = _xDir ? (bbox_right + 1) : (bbox_left - 1);
	
	if (collision_rectangle(_side, bbox_top, _side, bbox_bottom, _object, false, true))
	{
		return collision_rectangle(_side, bbox_top, _side, bbox_bottom, _object, false, true);
	}
	else //check for entities
	{
		var _entity = collision_rectangle(_side, bbox_top, _side, bbox_bottom, prtEntity, false, true);
		
		if (_entity != noone)
		{
			if (_entity.isSolid)
			{
				return _entity;
			}
		}
		return noone;
	}
}

/// @description vertical collision
function coll_y(_yDir, _object)
{
	//setup variables
	if (is_undefined(_object))
	{
		_object = objSolid;
	}
	var _side = _yDir ? (bbox_bottom + 1) : (bbox_top - 1);
	
	if (collision_rectangle(bbox_left, _side, bbox_right, _side, _object, false, true))
	{
		return collision_rectangle(bbox_left, _side, bbox_right, _side, _object, false, true);
	}
	else //check for entities
	{
		var _entity = collision_rectangle(bbox_left, _side, bbox_right, _side, prtEntity, false, true);
		
		if (_entity != noone)
		{
			if (_entity.isSolid)
			{
				return _entity;
			}
		}
		return noone;
	}
}

/// @description returns a list of horizontally colliding instances
function coll_x_list(_xDir, _list, _object)
{
	var _side = _xDir ? (bbox_right + 1) : (bbox_left - 1);
	return collision_rectangle_list(_side, bbox_top, _side, bbox_bottom, _object, false, true, _list, false);
}

/// @description returns a list of vertically colliding instances
function coll_y_list(_yDir, _list, _object)
{
	var _side = _yDir ? (bbox_bottom + 1) : (bbox_top - 1);
	return collision_rectangle_list(bbox_left, _side, bbox_right, _side, _object, false, true, _list, false);
}

/// @description returns if we're able to grab a right facing wall climb wall
function coll_x_wallclimb_right(_xDir)
{
	var _wall = coll_x(_xDir, objWallClimbWallRight);
	if (_wall != noone)
	{
		if (x > _wall.x)
		{
			return _wall;
		}
	}
	return noone;
}

/// @description returns if we're able to grab a left facing wall climb wall
function coll_x_wallclimb_left(_xDir)
{
	var _wall = coll_x(_xDir, objWallClimbWallLeft);
	if (_wall != noone)
	{
		if (x < _wall.x)
		{
			return _wall;
		}
	}
	return noone;
}

/// @description place meeting for solids
function place_meeting_solid(_x, _y)
{
	return (place_meeting(_x, _y, objSolid));
}

/// @description place meeting for solid entities
function place_meeting_solid_entity(_x, _y)
{
	var _entity = instance_place(_x, _y, prtEntity);
	
	if (_entity != noone)
	{
		return _entity.isSolid;
	}
}

/// @description place meeting for solidity
function place_meeting_solidity(_x, _y)
{
	return (place_meeting_solid(_x, _y) || place_meeting_solid_entity(_x, _y));
}

/// @description returns if the calling instance is within a given distance above ground
function distance_above_solid(_distance)
{
	for (var i = _distance; i > 0; i--)
	{
		var _solid = collision_line(x, y, x, (y + i), prtSolidCollision, false, true);
		var _topSolid = collision_line(x, y, x, (y + i), objTopSolid, false, true);
		if (_solid || (_topSolid && !place_meeting(x, y, _topSolid)))
		{
			return true;
			i = 0;
		}
	}
	return false;
}

/// @description returns if the calling instance is within a given distance above a point
function distance_above_height(_distance, _height)
{
	return ((_height - _distance) <= 0);
}