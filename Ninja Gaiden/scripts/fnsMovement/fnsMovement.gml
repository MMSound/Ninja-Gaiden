//this script contains all movement-related functions

/// @description initialize movement variables
function init_movement()
{
	xspeed = 0;
	yspeed = 0;
	
	//integer
	xspeedInt = 0;
	yspeedInt = 0;
	
	//subpixel
	xspeedSub = 0;
	yspeedSub = 0;
}

/// @description horizontal movement
function move_x(_xspeed, _doSlope, _instance)
{
	//setup variables
	var _xDir = sign(_xspeed);
	if (is_undefined(_instance))
	{
		_instance = id;
	}
	if (is_undefined(_doSlope))
	{
		_doSlope = false;
	}
	
	//check if we can move on every frame
	repeat (abs(_xspeed))
	{
		with (_instance)
		{
			if (hasCollision)
			{
				if (place_meeting_solidity((x + _xDir), y))
				{
					return false;
				}
			
				x += _xDir;
			
				if (_doSlope && !slope_move(_xDir))
				{
					return false;
				}
			}
			else
			{
				x += _xDir;
			}
		}
	}
	return true;
}

/// @description vertical movement
function move_y(_yspeed, _instance)
{
	var _yDir = sign(_yspeed);
	if (is_undefined(_instance))
	{
		_instance = id;
	}
	
	//check if we can move every frame
	repeat (abs(_yspeed))
	{
		with (_instance)
		{
			if (hasCollision)
			{
				//going down
				if (_yDir && grounded())
				{
					return false;
				}
			
				//going up
				if (!_yDir && solidity_above())
				{
					return false;
				}
			}
			
			y += _yDir;
		}
	}
	return true;
}

/// @description horizontal movement on platforms
function move_platform_x(_xspeed)
{
	var _xDir = sign(_xspeed);
	
	//check if we can move every frame
	repeat(abs(_xspeed))
	{
		//collision
		if (coll_x(_xDir))
		{
			return false;
		}
		
		//get instances to move
		var _instancesToMove = ds_list_create();
		var _collisionList = ds_list_create();
		
		//horizontal pushing on sides
		var _num = coll_x_list(_xDir, _collisionList, prtEntity);
		
		for (var i = 0; i < _num; i++)
		{
			var _current = _collisionList[| i];
			ds_list_add(_instancesToMove, _current);
			
			//if we can't move
			if (!move_x(_xDir, true, _current))
			{
				instances_reset_position(_instancesToMove);
				ds_list_destroy(_instancesToMove);
				ds_list_destroy(_collisionList);
				return false;
			}
		}
		
		//reset list
		ds_list_clear(_collisionList);
		
		//horizontal carry on top
		_num = coll_y_list(-1, _collisionList, prtEntity);
		
		for (var i = 0; i < _num; i++)
		{
			var _current = _collisionList[| i];
			move_x(_xDir, true, _current);
		}
		
		//update the entities and destroy data structures
		instances_update_previous_position(_instancesToMove);
		ds_list_destroy(_instancesToMove);
		ds_list_destroy(_collisionList);
		
		//NOW we move
		x += _xDir;
	}
}

/// @description movement on slopes
function slope_move(_xspeed)
{
	//inside a slope (must go up)
	if (collision_point(x, (y - 1), objSlope, true, true))
	{
		//retreat if we cannot progress
		if (!move_y(-1))
		{
			x -= _xspeed;
			return false;
		}
	}
	
	//on a slope going down
	if (!grounded() && collision_point(x, (y + 1), objSlope, true, true))
	{
		move_y(1);
	}
	return true;
}

/// @description round the velocity precisely
function round_velocity()
{
	xspeedSub += xspeed;
	xspeedInt = floor(xspeedSub);
	xspeedSub -= xspeedInt;
	
	yspeedSub += yspeed;
	yspeedInt = floor(yspeedSub);
	yspeedSub -= yspeedInt;
}

/// @description reset position of colliding instances
function instances_reset_position(_instances)
{
	var _num = ds_list_size(_instances);
	var _index = 0;
	
	repeat(_num)
	{
		var _current = _instances[| _index];
		_current.x = _current.xprevious;
		_current.y = _current.yprevious;
		_index++;
	}
}

/// @description update previous position of colliding instances
function instances_update_previous_position(_instances)
{
	var _num = ds_list_size(_instances);
	var _index = 0;
	
	repeat(_num)
	{
		var _current = _instances[| _index];
		_current.xprevious = _current.x;
		_current.yprevious = _current.y;
		_index++;
	}
}