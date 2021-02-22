/// @description Variables
init_movement();

moveSpeed = 1;
moveOutsideView = true; //misleading, this is actually for whether or not the player has to be on it to make it move

function set_speed(_xspd, _yspd)
{
	xspeed = _xspd;
	yspeed = _yspd;
}

imgFrame = room == rmAct6Scene2 ? 2 : !moveOutsideView;