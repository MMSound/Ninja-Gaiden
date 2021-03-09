/// @description Boss fight
if (mySickle == noone)
{
	mySickle = instance_create_depth(x, y, depth, objBomberheadSickle);
	mySickle.myParent = id;
}
switch (phase)
{
	case 0: //jump several times
		if (jumpTimer == 30)
		{
			yspeed = -4;
			xspeed = 2;
			if (instance_exists(mySickle))
			{
				with (mySickle)
				{
					if (phase == 0)
					{
						isLocked = false;
						xspeed = 12;
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
				phase = 1; //make sure to make the wall phase 2 so we can retrieve the sickle
				phaseTimer = 0;
			}
		}
		else
		{
			setGround = false;			
		}
		jumpTimer++;
		break;
}
phaseTimer++;