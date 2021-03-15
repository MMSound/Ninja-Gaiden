/// @description Movement
switch (phase)
{
	case 0: //jumping back and forth
		if (jumpTimer == 40 && grounded())
		{
			yspeed = -8;
			xspeed = (x < (global.viewX + (global.viewW / 2))) ? 4.17 : -4.17;
		}
		
		if (grounded())
		{
			if (!setGround)
			{
				jumpTimer = 0;
				xspeed = 0;
				setGround = true;
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