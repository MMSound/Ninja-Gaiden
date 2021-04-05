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
			play_sfx(sfxFlameWeapon);
			drawFire = false;
		}
		else if (((phaseTimer + 20) % 110) == 0 && phaseTimer > 0)
		{
			drawFire = true;
		}
		
		if (bounceCount >= 4 && bounceCount < 6) //various actions to happen at different times
		{
			targetY = ((global.viewY + global.viewH) - ((ystart + 8) - global.viewY));
		}
		else if (bounceCount >= 6 && bounceCount < 9)
		{
			targetY = (ystart + 8);
		}
		else if (bounceCount >= 9)
		{
			if (xspeed == _xspeedMax || xspeed == -_xspeedMax)
			{
				phase = 1;
				phaseTimer = 0;
				moveDir = -1;
				xspeedReal = 2;
				bounceCount = 0;
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
	case 1: //slow down
		if (xspeed > 0)
		{
			xspeed -= 0.25;
		}
		else if (xspeed < 0)
		{
			xspeed += 0.25;
		}
		else
		{
			phase = 2;
			phaseTimer = 0;
			xspeed = 0;
		}
		break;
	case 2: //warp around also funny effects
		canHit = false;
		canBeHitManual = false;
		wavePhase += 0.025;
		if (wavePhase > 1)
		{
			wavePhase = 0;
		}

		amplitude += ampDir;
		amplitude = clamp(amplitude, 0, 256);

		if (amplitude <= 0) //warping back in
		{
			if (warpCount < 6)
			{
				if (ampDir == -1)
				{
					ampDir = 1;
					fire_eight_way_spread((x - 27), (y - 30));
					fire_eight_way_spread((x + 27), (y - 30));
					play_sfx(sfxFlameWeapon);
				}
			}
			else
			{
				phase = 0;
				phaseTimer = 0;
				canHit = true;
				canBeHitManual = true;
				wavePhase = 0;
				warpCount = 0;
			}
		}
		else if (amplitude >= 64) //warping out
		{
			if (ampDir == 1)
			{
				ampDir = -1;
				if (++warpCount < 6) //warp to a random position
				{
					x = irandom_range((global.viewX + 64), (global.viewX + (global.viewW - 64)));
					y = irandom_range((global.viewY + 96), (global.viewY + (global.viewH - 96)));
					play_sfx(sfxJaquioWarp);
				}
				else
				{
					x = xstart;
					y = (ystart + 8);
					play_sfx(sfxJaquioWarp);
				}
			}
		}
		break;
}

//face the player
if (instance_exists(objPlayer))
{
	var _playerDir = sign(objPlayer.x - x);
	if (_playerDir != 0)
	{
		image_index = !clamp(_playerDir, 0, 1);
	}
}

phaseTimer++;