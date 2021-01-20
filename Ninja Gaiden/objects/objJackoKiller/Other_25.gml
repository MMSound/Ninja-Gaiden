/// @description Movement and attack
if (timer % 2 == 0) //one pixel every x frames
{
	xspeed = (1 * moveDir);
}
else
{
	xspeed = 0;
}

if (coll_x(xspeed, objSolid)) //turn around at collision with walls
{
	moveDir *= -1;
	x += moveDir;
}
else if (coll_x(xspeed, objBoundary))
{
	moveDir *= -1;
	x += moveDir;
}

if (instance_exists(objPlayer)) //face player
{
	var _xScale = sign(objPlayer.x - x);
	if (_xScale != 0)
	{
		image_xscale = _xScale;
	}
}

if (timer >= 120) //become attacking mode
{
	if (timer >= 130)
	{
		if (attackCounter < 7)
		{
			var _knife = instance_create_depth(x, (y - 38), depth, objGenericBullet);
				_knife.doesGravity = true;
				_knife.yspeed = irandom_range(-2, -3);
				_knife.xspeed = (2 * image_xscale);
				_knife.sprite_index = sprJackoKnife;
				_knife.imgSpd = (1 / 2);
				_knife.image_xscale = image_xscale;
			attackCounter++;
			timer = 120;
		}
		else
		{
			timer = 0;
		}
	}
	else if (timer >= 128)
	{
		image_index = 1;
	}
	else if (timer >= 126)
	{
		sprite_index = sprJackoThrow;
		imgSpd = 0;
		image_index = 0;
	}
	else
	{
		sprite_index = sprJackoWalk;
		imgSpd = (1 / 4);
	}
}
else
{
	attackCounter = 0;
	sprite_index = sprJackoWalk;
	imgSpd = (1 / 4);
}

timer++;