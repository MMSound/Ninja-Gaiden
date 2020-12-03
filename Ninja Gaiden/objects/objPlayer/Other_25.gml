/// @description Movement
if (!isDead)
{
	xAxis = (global.inputRight - global.inputLeft);
	yAxis = (global.inputDown - global.inputUp);
	
	playedDeathSFX = false;
	
	//calculate speed
	if (global.canControl)
	{
		//controlling weapons
		if (global.inputAttackPressed)
		{
			if (instance_exists(objFlameShield) && global.currentWeapon == WEAPON_FLAMES) //make flame shield be bigger for a moment
			{
				with (objFlameShield)
				{
					radius = 32;
				}
			}
			if (!global.inputUp) //sword
			{
				if (!instance_exists(objSword))
				{
					if (!isWallClimb)
					{
						if (!isHang)
						{
							//special case for spin slash
							if (global.currentWeapon == WEAPON_SPIN_SLASH && !grounded())
							{
								if (instance_number(global.weaponObject[WEAPON_SPIN_SLASH]) < global.weaponLimit[WEAPON_SPIN_SLASH] && (global.ninpo - global.weaponNinpo[WEAPON_SPIN_SLASH]) >= 0)
								{
									if (!global.inputDown)
									{
										instance_create_depth(x, (y - 16), depth, objSpinSlash);
										global.ninpo -= global.weaponNinpo[WEAPON_SPIN_SLASH];
										attackAnimTimer = 0;
										hasAttacked = true;
									}
									else
									{
										var _sword = instance_create_depth(x, (y - 16), depth, objSword);
										_sword.image_xscale = image_xscale;
										_sword.visible = false;
										_sword.lifeTime = 2;
										attackAnimTimer = 2;
										play_sfx(sfxSwordSlash);
										hasAttacked = true;
									}
								}
								else
								{
									if (!instance_exists(objSpinSlash))
									{
										attackAnimTimer = 16;
										currentAttack = 1;
										var _duck = (-6 * isDuck);
										var _sword = instance_create_depth(x, (y - (16 + _duck)), depth, objSword);
										_sword.image_xscale = image_xscale;
										_sword.visible = false;
										if (global.inputDown && !grounded())
										{
											_sword.lifeTime = 2;
											attackAnimTimer = 2;
										}
										else
										{
											_sword.lifeTime = 16;
										}
										play_sfx(sfxSwordSlash);
										hasAttacked = true;
										if (grounded())
										{
											swordWait = true;
										}
									}
								}
							}
							else
							{
								if (!instance_exists(objSpinSlash))
								{
									attackAnimTimer = 16;
									currentAttack = 1;
									var _duck = (-6 * isDuck);
									var _sword = instance_create_depth(x, (y - (16 + _duck)), depth, objSword);
									_sword.image_xscale = image_xscale;
									_sword.visible = false;
									if (global.inputDown && !grounded())
									{
										_sword.lifeTime = 2;
										attackAnimTimer = 2;
									}
									else
									{
										_sword.lifeTime = 16;
									}
									play_sfx(sfxSwordSlash);
									hasAttacked = true;
									if (grounded())
									{
										swordWait = true;
									}
								}
							}
						}
						else
						{
							attackAnimTimer = 16;
							currentAttack = 2;
							player_weapon();
							hasAttacked = true;
						}
					}
					else
					{
						attackAnimTimer = 16;
						currentAttack = 2;
						player_weapon();
						hasAttacked = true;
					}
				}
				else
				{
					currentAttack = 0;
				}
			}
			else
			{
				attackAnimTimer = 16;
				currentAttack = 2;
				player_weapon();
				hasAttacked = true;
			}
		}
		if (global.inputWeaponPressed)
		{
			attackAnimTimer = 16;
			currentAttack = 2;
			player_weapon();
			hasAttacked = true;			
		}
		if (!instance_exists(objSword)) //reset current attack
		{
			if (attackAnimTimer == 0)
			{
				currentAttack = 0;
			}
		}
		if (cooldownTimer > 0) //decrement cooldown timer
		{
			cooldownTimer--;
		}
		
		//movement
		if (grounded() || isHang) //we want to be able to move both directions at the same speed when grounded
		{
			if (abs(xAxis) && (attackAnimTimer == 0 || !swordWait) && cooldownTimer == 0)
			{
				xspeed = (runSpeed * xAxis);
				image_xscale = xAxis;
			}
			else
			{
				xspeed = 0;
			}
		}
		else
		{
			if (!isWallClimb)
			{
				if (!isHang)
				{
					if (xAxis == image_xscale)
					{
						xspeed = (runSpeed * xAxis);
					}
					else
					{
						if (xAxis != 0)
						{
							xspeed = (airBackwardsSpeed * xAxis);
						}
						else
						{
							xspeed = 0;
						}
					}
				}
			}
			else
			{
				xspeed = 0;
			}
		}
	}

	//control states
	var _currentState = currentState;
	script_execute(currentState);
	stateIsNew = _currentState != currentState;
	stateTimer = stateIsNew ? 0 : (stateTimer + 1);

	//now we move
	round_velocity();

	//what happens when we can't move
	if (!move_x((xspeedInt + modDirection), true))
	{
		xspeed = 0;
		xspeedSub = 0;
	}
	if (!move_y(yspeedInt))
	{
		yspeed = 0;
		yspeedInt = 0;
	}
	
	//limit coords
	x = clamp(x, 0, room_width);
	if (global.currentSection != noone) //determining y bounds
	{
		var _yTop = (global.viewY + 18);
		var _yBottom = (global.viewY + (global.viewH + 64));
		if (instance_place(x, (global.sectionT - 16), objSection)) //can we go above
		{
			_yTop = (global.viewY - 16);
		}
		y = clamp(y, _yTop, _yBottom);
	}

	//getting hit
	if (isKnockback)
	{
		if (grounded() || isWallClimb || isHang) //we want to not be knocked back if we're on a wall
		{
			if (healthPoints > 0)
			{
				iFrameTimer = iFrameTime;
				isKnockback = false;
			}
			else
			{
				isDead = true;
			}
		}
		
		//pit
		if (y > (global.viewY + (global.viewH + 32)))
		{
			isDead = true;
			healthPoints = 0;
		}
	}
	else
	{
		if (iFrameTimer > 0)
		{
			iFrameTimer--;
			isHit = true;
			isKnockback = false;
			drawBlink = (iFrameTimer % 2 == 0);
			global.canControl = true;
			canWallClimb = true;
		}
		else if (!isKnockback)
		{
			canBeHit = true;
			hitObject = noone;
			isHit = false;
			drawBlink = false;
		}
	}
	
	global.playerHealth = clamp(healthPoints, 0, 16);
	onGround = grounded();
	
	//animations woo haha
	if (attackAnimTimer > 0)
	{
		attackAnimTimer--;
	}
	else
	{
		swordWait = false;
	}
	
	//now let's actually change the sprite
	imgSpd = 0;
	switch (grounded()) //is on ground?
	{
		case true:
			switch (attackAnimTimer) //is attacking?
			{
				case 0: //not attacking
					switch (isDuck) //is ducking?
					{
						case true:
							sprite_index = sprRyuCrouchIdle;
							imgSpd = (1 / 6);
							break;
						case false:
							switch (xAxis) //is running?
							{
								case 0:
									sprite_index = sprRyuIdle;
									imgSpd = (1 / 6);
									break;
								default:
									sprite_index = sprRyuRun;
									imgSpd = (1 / 2);
									break;
							}
							break;
					}
					break;
				default: //attacking
					if (attackAnimTimer > 6)
					{
						image_index = 0;
						switch (isDuck) //is ducking?
						{
							case true:
								if (attackAnimTimer > 11) //lean in?
								{
									sprite_index = sprRyuCrouchLeanIn;
								}
								else
								{
									sprite_index = sprRyuCrouchSlash;
								}
								break;
							case false:
								if (attackAnimTimer > 11) //lean in?
								{
									sprite_index = sprRyuStandLeanIn;
								}
								else
								{
									switch (currentAttack) //which attack are we using?
									{
										case 1: //sword
											sprite_index = sprRyuStandSlash;
											break;
										case 2: //weapon
											sprite_index = sprRyuStandWeapon;
											break;
									}
								}
								break;
						}
					}
					else
					{
						image_index = 1;
					}
					if (instance_exists(objSword)) //sword canceling
					{
						if (objSword.lifeTime == 2)
						{
							sprite_index = sprRyuStandSlash;
							image_index = objSword.lifeTimer;
						}
					}
					break;
			}
			break;
		case false:
			switch (isWallClimb) //is wall climbing?
			{
				case true:
					switch (attackAnimTimer) //is attacking?
					{
						case 0:
							sprite_index = sprRyuWallClimb;
							switch (yAxis) //is moving
							{
								case 0:
									image_index = 0;
									break;
								default:
									imgSpd = (1 / 4);
									break;
							}
							break;
						default:
							if (attackAnimTimer > 11) //lean in?
							{
								sprite_index = sprRyuClimbLeanIn;
							}
							else
							{
								sprite_index = sprRyuClimbWeapon;
								if (xAxis != 0)
								{
									image_index = (xAxis != image_xscale);
								}
							}
							break;
					}
					break;
				case false:
					switch (isHang) //is on a rail?
					{
						case true:
							switch (attackAnimTimer) //is attacking?
							{
								case 0:
									switch (xspeed)
									{
										case 0:
											sprite_index = sprRyuHangIdle;
											break;
										default:
											sprite_index = sprRyuHangMove;
											imgSpd = (1 / 4);
											break;
									}
									break;
								default:
									if (attackAnimTimer > 6)
									{
										sprite_index = sprRyuHangWeapon;
										if (attackAnimTimer > 11)
										{
											image_index = 0;
										}
										else
										{
											image_index = 1;
										}
									}
									else
									{
										sprite_index = sprRyuHangIdle;
										image_index = 0;
									}
									break;
							}
							break;
						case false:
							switch (attackAnimTimer) //is attacking?
							{
								case 0:
									if (yspeed > 0) //fall
									{
										if (instance_exists(objSpinSlash)) //special case for spin slash
										{
											sprite_index = sprRyuSpinSlash;
											imgSpd = (1 / 2);
										}
										else
										{
											sprite_index = sprRyuJumpFall;
											imgSpd = (1 / 6);
										}
									}
									else
									{
										if (instance_exists(objSpinSlash)) //special case for spin slash
										{	
											sprite_index = sprRyuSpinSlash;
											imgSpd = (1 / 2);
										}
										else
										{
											if (!hasAttacked) //have we attacked already?
											{
												sprite_index = sprRyuJumpSomersault;
												imgSpd = (1 / 2);
											}
											else
											{
												sprite_index = sprRyuJumpFall;
												imgSpd = (1 / 6);
											}
										}
									}
									break;
								default:
									if (attackAnimTimer > 6)
									{
										image_index = 0;
										if (attackAnimTimer > 11) //lean in?
										{
											sprite_index = sprRyuAirLeanIn;
										}
										else
										{
											switch (currentAttack) //which attack are we using?
											{
												case 1: //sword
													sprite_index = sprRyuAirSlash;
													break;
												case 2: //weapon
													sprite_index = sprRyuAirWeapon;
													break;
											}
										}
									}
									else
									{
										image_index = 1;
									}
									if (instance_exists(objSword)) //sword canceling
									{
										if (objSword.lifeTime == 2)
										{
											sprite_index = sprRyuAirSlash;
											image_index = objSword.lifeTimer;
										}
									}
									break;
							}
							if (isKnockback) //is knocked back?
							{
								sprite_index = sprRyuJumpSomersault;
								image_index = 0;
							}
							break;
					}
					break;
			}
			break;
	}
	if (instance_exists(objSpinSlash)) //special case for spin slash
	{
		sprite_index = sprRyuSpinSlash;
		imgSpd = (1 / 2);
	}
	
	//ducking mask
	if (isDuck)
	{
		mask_index = sprPlayerPlaceholderDuck;
	}
	else
	{
		mask_index = sprPlayerPlaceholder;
	}
	
	//setting the section
	if (place_meeting(x, y, objSection))
	{
		var _section = instance_place(x, y, objSection);
		if (global.currentSection != _section)
		{
			global.currentSection = _section;
			section_set_bounds();
		}
		
		if (instance_exists(objFallingPillar))
		{
			instance_activate_object(objFallingPillar);
		}
	}
}
else //change later
{
	global.deathRespawn = true;
	global.canControl = false;
	global.playerHealth = healthPoints;
	sprite_index = sprRyuJumpSomersault;
	image_index = 0;
	if (!grounded() && inside_view())
	{
		move_x(xspeed);
	}
	move_y(yspeed);
	yspeed += grav;
	round_velocity();
}