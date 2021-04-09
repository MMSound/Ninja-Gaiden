/// @description Movement
switch (phase)
{
	case 0: //move back and forth
		xspeed = (global.bossPhase == 2) ? 0 : (moveSpeed * image_xscale);
		sprite_index = sprMaskedDevilWalk;
		imgSpd = (1 / 5);
		
		if (bounceCount == 3)
		{
			phase = 1;
			phaseTimer = 0;
			bounceCount = 0;
			xspeed = 0;
			imgSpd = 0;
			image_index = 1;
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
		sprite_index = sprMaskedDevilSlash;
		
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
			}
		}
		if (phaseTimer % 50 == 0) //bullets
		{
			fire_aimed_bullet_spread();
			animTimer = 8;
		}
		break;
	case 2: //move a bit
		image_xscale = (x >= (global.viewX + (global.viewW / 2))) ? -1.00 : 1.00;
		xspeed = (0.5 * image_xscale);
		sprite_index = sprMaskedDevilWalk;
		imgSpd = (1 / 8);
		
		if (phaseTimer == 60)
		{
			phase = 3;
			phaseTimer = 0;
			xspeed = 0;
			imgSpd = 0;
			image_index = 1;
		}
		break;
	case 3: //retract shield and fire projectiles
		sprite_index = sprMaskedDevilSlash;
		
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
		if (phaseTimer % 50 == 0) //bullets
		{
			fire_aimed_bullet_spread();
			imgSpd = (1 / 3);
			animTimer = 8;
		}
		break;
}

phaseTimer++;

if (animTimer > 0) //slash animation
{
	animTimer--;
	if (animTimer > 5)
	{
		image_index = 2;
	}
	else
	{
		image_index = 3;
	}
}
else
{
	if (phase == 1 || phase == 3)
	{
		image_index = 1;
	}
}

if (global.bossPhase == 2)
{
	imgSpd = 0;
}