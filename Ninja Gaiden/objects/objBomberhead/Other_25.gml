/// @description Boss fight
if (mySickle == noone)
{
	mySickle = instance_create_depth(x, y, (depth + 5), objBomberheadSickle);
	mySickle.myParent = id;
}
switch (phase)
{
	case 0: //jump several times
		if (jumpTimer == 30)
		{
			yspeed = -4;
			xspeed = screenPos ? -2 : 2;
			if (instance_exists(mySickle))
			{
				with (mySickle)
				{
					if (phase == 0)
					{
						isLocked = false;
						xspeed = (12 * other.image_xscale);
						yspeed = -1;
						phase = 1;
						phaseTimer = 0;
						x += (8 * other.image_xscale);
					}
				}
			}
		}
		if (grounded()) //reset timer
		{
			if (!setGround)
			{
				jumpTimer = 0;
				xspeed = 0;
				jumpCount++;
				setGround = true;
			}
			if (jumpCount == 5)
			{
				phase = 1;
				phaseTimer = 0;
				jumpCount = 0;
			}
		}
		else
		{
			setGround = false;			
		}
		jumpTimer++;
		break;
	case 1: //wait for the sickle
		if (instance_exists(mySickle))
		{
			if (mySickle.isLocked)
			{
				phase = 2;
				phaseTimer = 0;
				yspeed = -8;
			}
		}
		image_xscale = screenPos ? 1.00 : -1.00;
		break;
	case 2: //jump up to wall
		if (yspeed == 1.5)
		{
			phase = 3;
			phaseTimer = 0;
			hasGravity = false;
			yspeed = 0;
			if (instance_exists(mySickle))
			{
				with (mySickle)
				{
					if (phase == 0)
					{
						isLocked = false;
						phase = 3;
						phaseTimer = 0;
						x += (8 * other.image_xscale);
					}
				}
			}
		}
		break;
	case 3: //sorry nothing
		
		break;
	case 4: //move to position
		if (x > (global.viewX + (global.viewW / 2))) //on right side
		{
			if (x > (global.viewX + (global.viewW - 64)))
			{
				x -= 2;
			}
			else
			{
				phase = 0;
				phaseTimer = 0;
				screenPos = (x > (global.viewX + (global.viewW / 2)));
			}
		}
		else
		{
			if (x < (global.viewX + 64))
			{
				x += 2;
			}
			else
			{
				phase = 0;
				phaseTimer = 0;
				screenPos = (x > (global.viewX + (global.viewW / 2)));
			}
		}
		break;
}
phaseTimer++;

//set direction
if (sign(xspeed) != 0)
{
	image_xscale = sign(xspeed);
}