/// @description Movement and attack
switch (phase)
{
	case 0: //move normally
		if (timer % 3 == 0) //one pixel every x frames
		{
			xspeed = (1 * image_xscale);
		}
		else
		{
			xspeed = 0;
		}
		
		if (coll_x(xspeed, objSolid)) //turn around at collision with walls
		{
			image_xscale *= -1;
		}
		else if (coll_x(xspeed, objBoundary))
		{
			image_xscale *= -1;
		}
		
		if (timer == 120) //switch phase
		{
			phase = 1;
			timer = 0;
			xspeed = 0;
			sprite_index = sprKnifeManShoot;
			imgSpd = 0;
		}
		break;
	case 1: //attack
		var _xDir = image_xscale;
		var _duck = 0;
		if (instance_exists(objPlayer)) //face player
		{
			var _xScale = sign(objPlayer.x - x);
		}
		else
		{
			_xScale = _xDir;
		}
		if (_xDir != _xScale)
		{
			image_xscale *= -1;
			_duck = -7;
			if (sprite_index == sprKnifeManShoot) //change sprite to be crouching if necessary
			{
				sprite_index = sprKnifeManCrouchShoot;
			}
		}
		
		if (timer > 5)
		{
			if (!hasFired) //fire only once
			{
				var _knife = instance_create_depth((x + (12 * image_xscale)), (y - (23 + _duck)), (depth + 5), objGenericBullet);
					_knife.sprite_index = sprKnife;
					_knife.xspeed = (3 * image_xscale);
					_knife.image_xscale = image_xscale;
				hasFired = true;
			}
		}
		image_index = hasFired;
			
		if (timer == 20)
		{
			phase = 0;
			timer = 0;
			hasFired = false;
			sprite_index = sprKnifeManWalk;
			imgSpd = (1 / 4);
		}
		break;
}
timer++;