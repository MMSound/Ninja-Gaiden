/// @description Movement
switch (phase)
{
	case 0: //move back and forth
		xspeed = (global.bossPhase == 2) ? 0 : (moveSpeed * image_xscale);
		if (bounceCount == 3)
		{
			phase = 1;
			phaseTimer = 0;
			bounceCount = 0;
			xspeed = 0;
		}
		
		with (objMaskedDevilShield) //fix shield stuff
		{
			if (radius > 32)
			{
				radius--;
			}
		}
		break;
	case 1: //expand shield and fire projectiles
		with (objMaskedDevilShield)
		{
			if (radius < 112)
			{
				radius++;
			}
			else
			{
				other.phase = 2;
				other.phaseTimer = 0;
				other.xspeed = 0.5;
			}
		}
		break;
	case 2: //move a bit
		if (phaseTimer == 60)
		{
			phase = 3;
			phaseTimer = 0;
			xspeed = 0;			
		}
		break;
	case 3: //retract shield and fire projectiles
		with (objMaskedDevilShield)
		{
			if (radius > 32)
			{
				radius--;
			}
			else
			{
				other.phase = 0;
				other.phaseTimer = 0;
			}
		}
		break;
}

phaseTimer++;