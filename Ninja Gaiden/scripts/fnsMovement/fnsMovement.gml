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
	var _ydir = sign(_yspeed);
	if (is_undefined(_instance))
	{
		_instance = self;
	}

	with (_instance)
	{
	    repeat(abs(_yspeed))
	    {
	        //going down
	        if (_ydir)
	        {
				if (hasCollision)
				{
					if (!grounded())
		            {
		                y += _ydir;
		            }
		            else
					{
		                return false;
					}
				}
				else
				{
					y += _ydir;
				}
	        }
	        //going up
	        else
	        {
				if (hasCollision)
				{
					if (!solid_above())
		            {
		                y += _ydir;
		            }
		            else
					{
		                return false;
					}
				}
				else
				{
					y += _ydir;
				}
	        }
	    }
	}
	return true;
}

/// @description move_x but for moving platforms
function move_platform_x(_xvel) 
{
	//note for later - add another argument to check for any entity, not just the player
	var _xdir = sign(_xvel);

	//movement/collision x
	repeat(abs(_xvel))
	{
		//colliding with solid - possibly make this optional later?
		if (coll_x(_xdir))
		{
			return false;
		}
	
		//lists
		var instances = ds_list_create(); //instances is the list of entities that should be moved
		var instances_ds = ds_list_create();
	
		//entities found on sides
		var _numEntities = coll_x_list(_xdir, instances_ds, prtEntity);
		for (var i = 0; i < _numEntities; i++)
		{	
			var _current = instances_ds[| i]; //get current entity
			ds_list_add(instances, _current);

			if (_current.hasCollision) //only move if the current entity has collision
			{
				if (!move_x(_xdir, true, _current)) //try to move it
				{
					instances_reset_position(instances);
					ds_list_destroy(instances);
					ds_list_destroy(instances_ds); //ALWAYS destroy data structure when you're done using it
					return false; //in order to prevent memory leaks
				}
			}
		}
	
		//clean list
		ds_list_clear(instances_ds);
	
		//entities found on top
		_numEntities = coll_y_list(-1, instances_ds, prtEntity);
	
		//try carrying them
		for (var i = 0; i < _numEntities; i++)
		{
			var _current = instances_ds[| i];
			if (_current.hasCollision) //only move if the current entity has collision
			{
				move_x(_xdir, true, _current);
			}
		}
	
		instances_update_previous_position(instances_ds);
		ds_list_destroy(instances);
		ds_list_destroy(instances_ds);
		
		x += _xdir;
	}

	return true;
}

/// @description move_y but for moving platforms
function move_platform_y(_yvel) 
{
	var _ydir = sign(_yvel);

	repeat(abs(_yvel))
	{
	    //colliding with solids - possibly make this optional later?
	    if coll_y(_ydir)
		{
	        return false;
		}
	
		//lists
		var instances = ds_list_create(); //instances is the list of entities that should be moved
		var instances_ds = ds_list_create();

	    //going upward
	    if (!_ydir)
	    {
			//entities found above
			var _numEntities = coll_y_list(_ydir, instances_ds, prtEntity);
			for (var i = 0; i < _numEntities; i++)
			{
				var _current = instances_ds[| i]; //get current entity
				ds_list_add(instances, _current);
				if (_current.hasCollision) //only move if the current entity has collision
				{
					if (!move_y(_ydir, _current)) //try to move it
					{
						instances_reset_position(instances);
						ds_list_destroy(instances);
						ds_list_destroy(instances_ds); //ALWAYS destroy data structure when you're done using it
						return false; //in order to prevent memory leaks					
					}
				}
			}
	    }

	    //going downward
	    if (_ydir)
	    {
	        //entities found below
			var _numEntities = coll_y_list(_ydir, instances_ds, prtEntity);
			for (var i = 0; i < _numEntities; i++)
			{
				var _current = instances_ds[| i]; //get current entity
				ds_list_add(instances, _current);
				if (_current.hasCollision) //only move if the current entity has collision
				{
					if (!move_y(_ydir, _current)) //try to move it
					{
						instances_reset_position(instances);
						ds_list_destroy(instances);					
						ds_list_destroy(instances_ds); //ALWAYS destroy data structure when you're done using it
						return false; //in order to prevent memory leaks
					}
				}
			}
		
			//clean list
			ds_list_clear(instances_ds);
		
			//entities found above
			_numEntities = coll_y_list(-1, instances_ds, prtEntity);
		
			//carry entities
			instance_deactivate_object(self);
			for (var i = 0; i < _numEntities; i++)
			{
				var _current = instances_ds[| i];
				if (_current.hasCollision)
				{
					move_y(_ydir, _current);
				}
			}
			instance_activate_object(self);
	    }
	
		instances_update_previous_position(instances_ds);
		ds_list_destroy(instances);
		ds_list_destroy(instances_ds);
	
	    y += _ydir;
	}

	return true;
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

/// @descrption utility to update the previous position of entities
function instances_update_previous_position(_entitiesToMove) 
{
	var _numEntities = ds_list_size(_entitiesToMove);
	var _index = 0;

	repeat(_numEntities)
	{
		var instance = _entitiesToMove[| _index];
		if (instance_exists(instance))
		{
			instance.xprevious = instance.x;
			instance.yprevious = instance.y;
		}
		_index++;
	}
}