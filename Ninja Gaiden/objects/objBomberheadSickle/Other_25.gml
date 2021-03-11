/// @description Control movement
if (!instance_exists(myParent))
{
	instance_destroy(id);
}
else
{
	switch (phase)
	{
		case 0: //locked
			isLocked = true;
			hasGravity = false;
			bounceCount = 0;
			break;
		case 1: //move to player
			hasGravity = false;
			break;
		case 2: //move back to bomberhead
			hasGravity = true;
			if (!place_meeting(x, y, objBomberhead))
			{
				if (x < myParent.x)
				{
					x += 2;
				}
				else if (x > myParent.x)
				{
					x -= 2;
				}
			}
			else
			{
				phase = 0;
			}
			break;
		case 3: //bounce around
			hasGravity = true;
			if (bounceCount < 8)
			{
				if (instance_exists(objPlayer))
				{
					if (x < objPlayer.x)
					{
						x += 1;
					}
					else if (x > objPlayer.x)
					{
						x -= 1;
					}
				}
				if (grounded())
				{
					yspeed = -7;
					bounceCount++;
					play_sfx(sfxBomberheadSickleBounce);
				}
			}
			else
			{
				if (!myParent.hasGravity)
				{
					myParent.hasGravity = true;
				}
				if (!place_meeting(x, y, objBomberhead))
				{
					if (x < myParent.x)
					{
						x += 2;
					}
					else if (x > myParent.x)
					{
						x -= 2;
					}
				}
				else
				{
					phase = 0;
					with (myParent)
					{
						phase = 4;
						phaseTimer = 0;
					}
				}				
			}
			break;
	}
	phaseTimer++;
}

if (global.bossPhase == 2)
{
	instance_destroy(id);
}

visible = !isLocked;