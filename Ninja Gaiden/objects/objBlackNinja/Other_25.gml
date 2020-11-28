/// @description Movement
xspeed = (2 * image_xscale);

if (coll_x(xspeed, objSolid)) //turn around at walls only if not jumping
{
	if (grounded())
	{
		image_xscale *= -1;
		x += (2 * image_xscale);
	}
}

if (grounded()) //animation and resetting one variable
{
	hasJumped = false;
	sprite_index = sprBlackNinjaRun;
}
else
{
	if (yspeed < 0)
	{
		sprite_index = sprBlackNinjaJumpSomersault;
	}
	else
	{
		sprite_index = sprBlackNinjaJumpFall;
	}
}

if (place_meeting(x, y, objBlackNinjaBoundary))
{
	var _bound = instance_place(x, y, objBlackNinjaBoundary);
	if (!hasJumped)
	{
		if (image_xscale == _bound.image_xscale)
		{
			yspeed = jumpSpeed;
			hasJumped = true;
		}
	}
}