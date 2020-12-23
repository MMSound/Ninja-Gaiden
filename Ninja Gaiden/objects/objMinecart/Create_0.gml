/// @description Variables
leftSide = noone;
rightSide = noone;
activated = false;

xspeed = 0;
yspeed = 0;

init_movement();

//create solids
function create_sides()
{
	if (leftSide == noone || !instance_exists(leftSide))
	{
		leftSide = instance_create_depth(x, (y - 10), depth, objMinecartSide);
	}
	if (rightSide == noone || !instance_exists(rightSide))
	{
		rightSide = instance_create_depth((x + 21), (y - 10), depth, objMinecartSide);
	}
}