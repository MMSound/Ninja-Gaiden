/// @description Don't move
switch (phase)
{
	case 0: //over-under shots til we get hit
		if (phaseTimer % 40 == 0 && phaseTimer > 40)
		{
			var _height = (++attackCount % 2 == 0) ? 9 : 3;
			var _yOffset = (attackCount % 2 == 0) ? 48 : 16; //make these 24 and 56 when the sprites
			lightning_pillar_create((x + 16), (y - _yOffset), _height);
			animate_to_frame(5);
		}
		else if (((phaseTimer % 40) - 20) == 0 && phaseTimer > 40)
		{
			summon_lightning();
		}
		break;
	case 1: //fire some aimed bullets
		if (phaseTimer % 50 == 0 && phaseTimer > 0)
		{
			if (++attackCount < 8)
			{
				if (instance_exists(objPlayer))
				{
					var _bullet = instance_create_depth((x + 16), (y - 32), depth, objGenericBullet);
	                var _dir = point_direction((x + 16), (y - 32), objPlayer.x, (objPlayer.y - 16));
	                _bullet.xspeed = lengthdir_x(5, _dir);
	                _bullet.yspeed = lengthdir_y(5, _dir);
					_bullet.sprite_index = sprX;
					_bullet.canBeHit = false;
					_bullet.sprite_index = sprMalthLightningBallLarge;
					_bullet.imgSpd = 1;
					play_sfx(sfxMalthZapLarge);
					animate_to_frame(5);
				}
			}
			else
			{
				phase = 2;
				phaseTimer = 0;
				attackCount = 0;
			}
		}
		else if (((phaseTimer % 50) - 20) == 0 && phaseTimer > 0)
		{
			if (attackCount < 7)
			{
				summon_lightning();
			}
		}
		break;
	case 2: //wait 2.5 seconds
		if (phaseTimer == 300)
		{
			phase = 3;
			phaseTimer = 0;
			attackCount = 0;
		}
		else if (phaseTimer == 285)
		{
			image_index = 7;
		}
		else
		{
			image_index = 0;
		}
		break;
	case 3: //lower lightning
		if (myLightning == noone)
		{
			myLightning = instance_create_depth(global.viewX, (y - 24), depth, objBloodyMalthLightningRod);
			play_sfx(sfxMalthZapLarge);
			animate_to_frame(8);
		}
		
		//the ones he fires at you directly
		if (phaseTimer % 55 == 0 && phaseTimer > 40)
		{
			if (++attackCount < 8)
			{
				lightning_pillar_create((x + 16), (y - 40), 5);
				animate_to_frame(5);
			}
			else
			{
				phase = 4;
				phaseTimer = 0;
				attackCount = 0;
				if (instance_exists(myLightning))
				{
					instance_destroy(myLightning);
					myLightning = noone;
				}
			}
		}
		else if (((phaseTimer % 55) - 20) == 0 && phaseTimer > 40)
		{
			if (attackCount < 7)
			{
				summon_lightning();
			}
		}
		break;
	case 4: //higher lightning
		if (myLightning == noone && phaseTimer > 80)
		{
			myLightning = instance_create_depth(global.viewX, (bbox_top - 24), depth, objBloodyMalthLightningRod);
			play_sfx(sfxMalthZapLarge);
			animate_to_frame(8);
		}
		else if (myLightning == noone && phaseTimer > 65)
		{
			image_index = 7;
		}
		
		//the ones he fires at you directly
		if (phaseTimer % 50 == 0)
		{
			lightning_pillar_create((x + 16), (y - 34), 9);
			animate_to_frame(5);
		}
		else if (((phaseTimer % 50) - 20) == 0)
		{
			summon_lightning();
		}
		break;
	case 5:
		if (phaseTimer == 300)
		{
			phase = 0;
			phaseTimer = 0;
			attackCount = 0;
		}
		image_index = 0;
		break;
	case 69: //this is the interim phase where we punch ryu (if necessary)
		if (phaseTimer == 25)
		{
			if (instance_exists(objPlayer))
			{
				if ((objPlayer.x - x) < 36 && (objPlayer.y > (bbox_top + 24)))
				{
					entity_damage(objPlayer, 1);
					with (objPlayer) //this is almost verbatim the player knockback code but with the xspeed changed
					{
						canBeHit = false;
						isHit = true;
						if (!isKnockback)
						{
							play_sfx(sfxPlayerHit);
						}
						isKnockback = true;
						if (!isWallClimb && !isHang)
						{
							yspeed = -2;
							xspeed = 8;
							global.canControl = false;
							canWallClimb = false;
						}					
					}
					animate_to_frame(3);
				}
			}
		}
		else if (phaseTimer == 40) //exit the phase
		{
			phase = nextPhase;
			phaseTimer = 0;
			attackCount = 0;
			nextPhase = 0;
		}
		else if (phaseTimer < 25) //prepare to punch ryu
		{
			if (instance_exists(objPlayer))
			{
				if ((objPlayer.x - x) < 36 && (objPlayer.y > (bbox_top + 24)))
				{
					image_index = 1;
				}
				else
				{
					image_index = 0;
				}
			}
			else
			{
				image_index = 0;
			}
		}
		else
		{
			image_index = 0;
		}
		break;
}

//this is to prevent the player from just hanging behind malth lmao
if (phaseTimer % 70 == 0)
{
	if (instance_exists(objPlayer))
	{
		if (objPlayer.x < x && !objPlayer.isDead)
		{
			instance_create_depth(global.viewX, (global.viewY + 56), depth, objBloodyMalthBigLightning); //get fucked lmao
			animate_to_frame(8);
		}
	}
}
else if (((phaseTimer % 70) - 15) == 0) //stomp
{
	if (instance_exists(objPlayer))
	{
		if (objPlayer.x < x && !objPlayer.isDead)
		{
			image_index = 7;
		}
	}
}

phaseTimer++;

//animation
if (animTimer > 0)
{
	animTimer--;
}
else
{
	if (goToNextFrame)
	{
		image_index++;
		goToNextFrame = false;
	}
}

if (instance_exists(objBloodyMalthLightningSummon)) //lightning summon animation
{
	image_index = 2;
}