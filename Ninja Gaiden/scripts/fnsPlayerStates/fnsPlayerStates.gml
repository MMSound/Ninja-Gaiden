//this script contains the player states

/// @description ground state
function playerStateGround()
{
	//reset state
	if (stateIsNew)
	{
		yspeed = 0;
		yspeedSub = 0;
		canWallClimb = true;
		canHang = true;
		airTimer = 0;
		coyoteTimer = 0;
		stateIsNew = !stateIsNew;
	}
	
	//leave if not on ground
	if (!grounded())
	{
		if (++coyoteTimer >= 6)
		{
			currentState = playerStateAir;
			exit;
		}
	}
	
	//reset attack animation
	if (attackAnimTimer == 0)
	{
		hasAttacked = false;
	}

	//duck
	if (!instance_exists(objSword))
	{
		if (xspeed == 0)
		{
			isDuck = global.inputDown;
		}
		else
		{
			isDuck = false;
		}
	}
	
	//jump
	if (global.inputJumpPressed)
	{
		if (global.inputDown && on_rail())
		{
			y += 1;
			currentState = playerStateAir;
			exit;
		}
		else
		{
			yspeed = -jumpSpeed;
			play_sfx(sfxJump);
			currentState = playerStateAir;
			exit;
		}
	}
	
	//jump buffer
	if (jumpQueued)
	{
		yspeed = -jumpSpeed;
		play_sfx(sfxJump);
		currentState = playerStateAir;
		exit;
	}
}

/// @description air state
function playerStateAir()
{
	//reset state
	if (stateIsNew)
	{
		myWall = noone;
		airTimer = 0;
		stateIsNew = !stateIsNew;
	}
	
	airTimer++;
	
	//leave if on ground
	if (grounded() && yspeed >= 0)
	{
		currentState = playerStateGround;
		play_sfx(sfxLand);
		exit;
	}
	
	//control gravity
	if (hasGravity)
	{
		yspeed += grav;
	}
	if (yspeed > maxVelocity)
	{
		yspeed = maxVelocity;
	}
	
	//get on wall (only if roughly 2 tiles above ground)
	myWall = coll_x(xspeed);
	if (myWall == noone)
	{
		myWall = coll_x_wallclimb_left(xspeed);
	}
	if (myWall == noone)
	{
		myWall = coll_x_wallclimb_right(xspeed);
	}
	
	if (myWall != noone)
	{
		if (myWall.object_index != objUnclimbableWall)
		{
			if (!distance_above_solid(climbSolidDistance))
			{
				if (canWallClimb)
				{
					if (myWall.image_yscale != 1.00) //prevent climbing on 1-tile high walls
					{
						yspeed = 0;
						xspeed = 0;
						image_xscale = sign(myWall.x - x);
						currentState = playerStateWallClimb;
						exit;
					}
				}
			}
		}
	}
	
	//if you press the opposite direction, be able to wall climb
	if (!canWallClimb)
	{
		if (xAxis != 0 && xAxis != image_xscale || coll_x(xspeed, objFallingPillar) || airTimer == 4)
		{
			canWallClimb = true;
		}
	}
	
	//grabbing rails
	myRail = can_grab_rail();
	if (myRail != noone)
	{
		if (canHang)
		{
			yspeed = 0;
			xspeed = 0;
			y = (myRail.y + 32);
			currentState = playerStateRailHang;
			exit;
		}
	}
	else
	{
		canHang = true;
	}
	
	//jump buffer
	if (global.inputJumpPressed)
	{
		if (place_meeting_solidity(x, (y + 4)))
		{
			jumpQueued = true;
		}
	}
	if (yspeed >= 0)
	{
		jumpQueued = false;
	}
}

/// @description wall climb state
function playerStateWallClimb()
{
	//reset state
	if (stateIsNew)
	{
		isWallClimb = true;
		hasGravity = false;
		play_sfx(sfxLand);
		stateIsNew = !stateIsNew;
	}
	
	//leave
	if (!isWallClimb)
	{
		exit;
	}
	
	if (!instance_exists(myWall))
	{
		currentState = playerStateAir;
		isWallClimb = false;
		exit;
	}
	
	//stick to the exact side
	if (myWall.object_index == objWallClimbWallLeft)
	{
		x = (myWall.x - 6);
	}
	else if (myWall.object_index == objWallClimbWallRight)
	{
		x = (myWall.x + 6);
	}
	
	//jump off
	if (xAxis != 0 && xAxis != image_xscale && global.inputJump)
	{
		isWallClimb = false;
		hasGravity = true;
		image_xscale = xAxis;
		yspeed = -2;
		play_sfx(sfxJump);
		currentState = playerStateAir;
		exit;
	}
	
	//climb off
	if (distance_above_solid(climbSolidDistance))
	{
		isWallClimb = false;
		hasGravity = true;
		currentState = playerStateAir;
		exit;
	}
	
	//check if we're on a vertically moving platform
	var _wallSpeed = 0;
	if (variable_instance_exists(myWall, "yspeed"))
	{
		_wallSpeed = myWall.yspeed;
	}
		
	//move
	if (y >= (myWall.bbox_top + 8))
	{
		if (!global.inputJump)
		{
			if (attackAnimTimer == 0)
			{
				yspeed = ((yAxis * wallClimbSpeed) + _wallSpeed);
			}
			else
			{
				yspeed = _wallSpeed;
			}
		}
		else
		{
			yspeed = _wallSpeed;
		}
		
		//climb off bottom
		if (y >= (myWall.bbox_bottom + 12) && yAxis == 1)
		{
			isWallClimb = false;
			hasGravity = true;
			canWallClimb = false;
			currentState = playerStateAir;
			exit;			
		}
	}
	else
	{
		//jump onto top of platform
		if (xAxis != 0 && xAxis == image_xscale && global.inputJump)
		{
			isWallClimb = false;
			hasGravity = true;
			yspeed = -2;
			canWallClimb = false;
			play_sfx(sfxJump);
			currentState = playerStateAir;
			exit;
		}
		
		//otherwise limit movement
		if (!global.inputJump)
		{
			yspeed = (clamp((yAxis * wallClimbSpeed), 0, 1) + _wallSpeed);
		}
		else
		{
			yspeed = _wallSpeed;
		}
	}
}

/// @description rail hang state
function playerStateRailHang()
{
	//reset state
	if (stateIsNew)
	{
		isHang = true;
		hasGravity = false;
		isDuck = false;
		isWallClimb = false;
		stateIsNew = !stateIsNew;
	}
	
	//jump off
	if (global.inputJumpPressed)
	{
		isHang = false;
		hasGravity = true;
		if (!global.inputDown)
		{
			yspeed = -3.5;
		}
		canHang = false;
		play_sfx(sfxJump);
		currentState = playerStateAir;
		exit;
	}
	
	//movement
	if (attackAnimTimer == 0)
	{
		xspeed = (runSpeed * xAxis);
	}
	else
	{
		xspeed = 0;
	}
	if (xAxis != 0)
	{
		image_xscale = xAxis;
	}
	
	//fall off
	if (!can_grab_rail())
	{
		isHang = false;
		hasGravity = true;
		currentState = playerStateAir;
		exit;
	}
}

/// @description firing a weapon
function player_weapon()
{
	//check if there is the maximum amount of the current weapon
	if (cooldownTimer == 0)
	{
		if (global.currentWeapon != 0 && global.currentWeapon != WEAPON_SPIN_SLASH)
		{
			if (instance_number(global.weaponObject[global.currentWeapon]) < global.weaponLimit[global.currentWeapon] && (global.ninpo - global.weaponNinpo[global.currentWeapon]) >= 0)
			{
				var _xDir = (isWallClimb ? xAxis : image_xscale); //adjust the direction to fire in
				if (_xDir == 0)
				{
					_xDir = image_xscale;
				}
				switch (global.currentWeapon) //actually fire the weapon
				{
					case WEAPON_SHURIKEN:
					case WEAPON_WINDMILL_SHURIKEN:
						var _weapon = instance_create_depth((x + (projectileOffsetX * _xDir)), (y + projectileOffsetY), depth, global.weaponObject[global.currentWeapon]);
							_weapon.image_xscale = _xDir;
						break;
					case WEAPON_FLAMES:
						var _flames = 5;
						for (var i = 0; i < _flames; i++)
						{
							var _weapon = instance_create_depth((x + (projectileOffsetX * _xDir)), (y + projectileOffsetY), depth, global.weaponObject[global.currentWeapon]);
								_weapon.image_xscale = _xDir;
								_weapon.thetaOffset = (i * (360 / _flames));
						}
						play_sfx(sfxFlameWeapon);
						break;
					case WEAPON_FLAME_WHEEL:					
						for (var i = 0; i < 3; i++)
						{
							var _weapon = instance_create_depth((x + (projectileOffsetX * _xDir)), (y + projectileOffsetY), depth, global.weaponObject[global.currentWeapon]);
								_weapon.image_xscale = _xDir;		
								_weapon.yspeed = -(i * 2);
						}
						play_sfx(sfxFlameWeapon);
						break;
				}
				global.ninpo -= global.weaponNinpo[global.currentWeapon];
				cooldownTimer = global.weaponCooldown[global.currentWeapon];
				play_sfx(sfxHo, false, 12);
			}
		}
	}
}