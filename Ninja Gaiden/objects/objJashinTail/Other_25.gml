/// @description Controlling
switch (phase)
{
	case 0: //curled up
	case 2: //lashing around
		if (iFrameTimer > 0)
		{
			iFrameTimer--;
		}
		if (phase == 2)
		{
			canBeHit = (iFrameTimer == 0);
			if (floor(image_index) == 3) //projectiles
			{
				if (!hasProjectiled && fireCount % 4 == 0)
				{
					make_wave((x - 32), (global.viewY + 200), -1.00);
					make_wave((x - 32), (global.viewY + 200), 1.00);
					play_sfx(sfxFlameWeapon, false, 30);
					hasProjectiled = true;
				}
				if (!fireCountIncreased)
				{
					fireCount++;
					fireCountIncreased = true;
				}
			}
			else
			{
				hasProjectiled = false;
				fireCountIncreased = false;
			}
		}
		else
		{
			canBeHit = false;
		}
		visible = (iFrameTimer % 2 == 0);
		canHit = true;
		break;
	case 1: //invisible
		visible = false
		canBeHit = false;
		canHit = false;
		break;
}