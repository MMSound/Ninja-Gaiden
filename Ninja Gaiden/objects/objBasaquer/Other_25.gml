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
			image_index = 0;
		}
		else
		{
			setGround = false;
			image_index = 1;
		}
		
		jumpTimer++;
		
		if (instance_exists(objPlayer))
		{
			var _playerDir = sign(objPlayer.x - x);
			if (_playerDir != 0)
			{
				image_xscale = _playerDir;
			}
		}
		break;
	case 1: //jump up
		phase = 2;
		phaseTimer = 0;
		yspeed = -8;
		image_index = 1;
		
		if (instance_exists(objPlayer))
		{
			var _playerDir = sign(objPlayer.x - x);
			if (_playerDir != 0)
			{
				image_xscale = _playerDir;
			}
		}
		break;
	case 2: //hang in midair
		if (yspeed == 3)
		{
			phase = 3;
			phaseTimer = 0;
			yspeed = 0;
			hasGravity = false;
			xPosition = x;
			image_index = 1;
			image_xscale = 1.00;
		}
		break;
	case 3: //warp around
		if (warpTimer == 20 && !isWarp) //shooting bullet
		{
			instance_create_depth(x, bbox_bottom, depth, objBasaquerFlameProjectile);
			play_sfx(sfxFlameWeapon);
		}
		if (in_range(warpTimer, 20, 25)) //animation
		{
			image_index = 3;
		}
		else if (in_range(warpTimer, 24, 40))
		{
			image_index = 4;
		}
		else
		{
			image_index = 2;
		}
		if (warpTimer == 35 && !isWarp)
		{
			if (warpCount < 4)
			{
				isWarp = true;
				warpTransitionTimer = 0;
				instance_create_depth(x, y, (depth - 1), objBasaquerDisappear);
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
			visible = false; //we'll use an actual effect later (we did, 5 days later lmao)
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
		image_index = 1;
		if (grounded())
		{
			phase = 5;
			phaseTimer = 0;
			hasGravity = true;
		}
		if (phaseTimer % 10 == 0)
		{
			for (var i = 0; i < 2; i++)
			{
				var _bullet = instance_create_depth(((i == 0) ? bbox_left : bbox_right), (y - 32), depth, objGenericBullet);
					_bullet.sprite_index = sprKelberossCannonBullet;
					_bullet.image_xscale = ((i == 0) ? -1.00 : 1.00);
					_bullet.xspeed = ((i == 0) ? -5 : 5);
			}
		}
		
		if (instance_exists(objPlayer))
		{
			var _playerDir = sign(objPlayer.x - x);
			if (_playerDir != 0)
			{
				image_xscale = _playerDir;
			}
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