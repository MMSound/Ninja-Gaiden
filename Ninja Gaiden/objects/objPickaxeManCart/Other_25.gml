/// @description Movement and attack
if (instance_exists(objPlayer))
{
	var _playerDir = (objPlayer.x - x);
	if (moveSpeed != 4) //only do this if we have not been dismissed
	{
		moveDir = sign(_playerDir);
		if (!in_range(_playerDir, -64, 64))
		{
			moveSpeed = 3;
		}
		else
		{
			moveSpeed = 1;
		}
	}
	else
	{
		moveDir = 1;
	}
}
xspeed = (moveSpeed * moveDir);

image_xscale = 1.00;

if (timer >= 120) //become attacking mode
{
	if (timer >= 130)
	{
		if (attackCounter < 7)
		{
			var _knife = instance_create_depth(x, (y - 38), depth, objGenericBullet);
				_knife.doesGravity = true;
				_knife.yspeed = irandom_range(-2, -3);
				_knife.xspeed = (3 * image_xscale);
				_knife.sprite_index = sprPickaxe;
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
		sprite_index = sprPickaxeManThrow;
		imgSpd = 0;
		image_index = 0;
	}
	else
	{
		sprite_index = sprHammerManWalk;
	}
}
else
{
	attackCounter = 0;
	sprite_index = sprHammerManWalk;
}

timer++;

//animation
if (timer % (4 / moveSpeed) == 0)
{
	cartFrame = !cartFrame;
}

//destroy if at end of line
if (place_meeting(x, y, objBoundary))
{
	instance_destroy(id);
}