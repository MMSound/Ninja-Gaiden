/// @description Control the fight
switch (phase)
{
	case 0: //which chipmunk is getting the best head? personally i think it's theodore
		canBeHitManual = false;
		break;
	case 1: //closed
		canBeHitManual = true;
		canHit = true;
		if (phaseTimer % 5 == 0)
		{
			if (bodyFrame < 2)
			{
				bodyFrame++;
			}
		}
	
		if (hitCounter == 0)
		{
			phase = 2;
			phaseTimer = 0;
		}
		break;
	case 2: //open
		canBeHitManual = true;
		if (phaseTimer % 5 == 0)
		{
			if (bodyFrame > 0)
			{
				bodyFrame--;
			}
		}
		
		if (phaseTimer >= 140)
		{
			phase = 1;
			phaseTimer = 0;
			hitCounter = 2;
		}
		break;
}
phaseTimer++;