/// @description Movement
switch (phase)
{
	case 0: //move back and forth
		xspeed = (global.bossPhase == 2) ? 0 : (moveSpeed * image_xscale);
		break;
}

phaseTimer++;