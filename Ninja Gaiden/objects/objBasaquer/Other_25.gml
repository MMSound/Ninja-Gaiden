/// @description Movement
switch (phase)
{
	case 0: //jumping back and forth
		if (jumpTimer == 40 && grounded())
		{
			var _isOnLeft = (x < (global.viewX + (global.viewW / 2)));
			xspeed = (++jumpCount == 5) ? (_isOnLeft ? 2.085 : -2.085) : (_isOnLeft ? 4.17 : -4.17);
			yspeed = -8;
		}
		
		if (grounded())
		{
			if (!setGround)
			{
				jumpTimer = 0;
				xspeed = 0;
				setGround = true;
				if (jumpCount == 5)
				{
					phase = 1;
					phaseTimer = 0;
					jumpCount = 0;
				}
			}
		}
		else
		{
			setGround = false;
		}
		
		jumpTimer++;
		break;
	case 1: //jump up
		phase = 2;
		phaseTimer = 0;
		yspeed = -8;
		break;
	case 2: //hang in midair
		if (yspeed == 3)
		{
			phase = 3;
			phaseTimer = 0;
			yspeed = 0;
			hasGravity = false;
			xPosition = x;
		}
		break;
	case 3: //warp around
		if (warpTimer == 20 && !isWarp) //shooting bullet
		{
			var _bullet = instance_create_depth(x, bbox_bottom, depth, objGenericBullet); //replace with special object later
				_bullet.hasCollision = true;
				_bullet.yspeed = 3;
		}
		if (warpTimer == 35 && !isWarp)
		{
			if (warpCount < 4)
			{
				isWarp = true;
				warpTransitionTimer = 0;
			}
			else
			{
				phase = 4;
				phaseTimer = 0;
				warpTimer = 0;
				warpTransitionTimer = 0;
				warpCount = 0;
				isWarp = false;
				visible = true;
				x = xPosition;
			}
		}
		if (isWarp)
		{
			visible = false; //we'll use an actual effect later
			if (warpTransitionTimer == 10)
			{
				isWarp = false;
				warpTimer = 0;
				warpTransitionTimer = 0;
				visible = true;
				warpCount++;
				x = (global.viewX + (irandom_range(4, 20) * 16));
			}
			warpTransitionTimer++;
		}
		warpTimer++;
		break;
	case 4: //fall back down
		yspeed = 1.5;
		if (grounded())
		{
			phase = 5;
			phaseTimer = 0;
			hasGravity = true;
		}
		break;
	case 5: //jump to a random side
		phase = 6;
		phaseTimer = 0;
		xspeed = irandom_range(0, 1) ? -2.085 : 2.085;
		yspeed = -8;
		break;
	case 6:
		if (grounded())
		{
			phase = 0;
			phaseTimer = 0;
			xspeed = 0;
		}
		break;
}
phaseTimer++;