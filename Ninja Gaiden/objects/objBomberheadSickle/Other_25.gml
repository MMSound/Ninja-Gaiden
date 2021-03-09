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
			break;
		case 1: //move to player
			hasGravity = false;
			if (phaseTimer % 1 == 0)
			{
				yspeed = (!yspeed * -1);
			}
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
	}
	phaseTimer++;
}