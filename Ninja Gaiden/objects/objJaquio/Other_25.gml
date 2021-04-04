/// @description Control the fight
switch (phase)
{
	case 0: //moving back and forth
		var _xspeedMax = 2.5;
		var _xspeedAdjust = 0.25;
		xspeed = xspeedReal;
		if (moveDir == -1) //adjust movement speed
		{
			if (xspeedReal > -_xspeedMax)
			{
				xspeedReal -= _xspeedAdjust;
			}
		}
		else
		{
			if (xspeedReal < _xspeedMax)
			{
				xspeedReal += _xspeedAdjust;
			}
		}
		
		if (instance_place((x - 16), y, objSolid) && moveDir == -1) //change the moveDir when necessary
		{
			moveDir = 1;
			bounceCount++;
		}
		else if (instance_place((x + 16), y, objSolid) && moveDir == 1)
		{
			moveDir = -1;
			bounceCount++;
		}
		
		if (phaseTimer % 110 == 0 && phaseTimer > 0) //projectiles
		{
			instance_create_depth((x - 27), (y - 30), (depth - 1), objJaquioFire);
			instance_create_depth((x + 27), (y - 30), (depth - 1), objJaquioFire);
		}
		
		if (bounceCount >= 4 && bounceCount < 6) //various actions to happen at different times
		{
			targetY = ((global.viewY + global.viewH) - ((ystart + 8) - global.viewY));
		}
		else if (bounceCount >= 6 && bounceCount < 10)
		{
			targetY = (ystart + 8);
		}
		else if (bounceCount >= 10)
		{
			if (xspeed == _xspeedMax || xspeed == -_xspeedMax)
			{
				phase = 1;
				phaseTimer = 0;
			}
		}
		
		if (y < targetY) //adjust y if necessary
		{
			y++;
		}
		else if (y > targetY)
		{
			y--;
		}
		break;
	case 1: //warp around
		if (xspeed > 0)
		{
			xspeed -= 0.25;
		}
		break;
}

//face the player
if (instance_exists(objPlayer))
{
	var _playerDir = sign(objPlayer.x - x);
	if (_playerDir != 0)
	{
		image_xscale = _playerDir;
	}
}

phaseTimer++;