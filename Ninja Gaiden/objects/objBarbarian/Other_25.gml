/// @description Boss fight
switch (phase)
{
	case 0: //walking back and forth
		xspeed = (1 * image_xscale);
		if (phaseTimer == 300)
		{
			phase = 1;
			phaseTimer = 0;
			imgSpd = 0;
			sprite_index = sprBarbarianSlash;
			image_index = 0;
			xspeed = 0;
		}
		break;
	case 1: //slashing
		image_xscale = instance_exists(objPlayer) ? ((objPlayer.x == x) ? 1.00 : sign(objPlayer.x - x)) : 1.00;
		if (slashCount < 3)
		{
			if (slashTimer < 32)
			{
				if (in_range(slashTimer, 0, 20))
				{
					image_index = 0;
				}
				else if (in_range(slashTimer, 21, 25))
				{
					image_index = 1;
					
					if (slashTimer == 22)
					{
						play_sfx(sfxBarbarianSlash);
					}
					
					//slash projectile
					if (slashCount == 2 && slashTimer == 24)
					{
						if (!slashProj)
						{
							var _slash = instance_create_depth(x, y, (depth - 1), objBarbarianSlashProjectile);
								_slash.image_xscale = image_xscale;
							slashProj = true;
						}
					}
				}
				else if (in_range(slashTimer, 26, 32))
				{
					image_index = 2;
				}
			}
			else
			{
				slashTimer = 0;
				slashCount++;
			}
			slashTimer++;
		}
		else
		{
			phase = 0;
			phaseTimer = 0;
			imgSpd = (1 / 7);
			sprite_index = sprBarbarianWalk;
			slashCount = 0;
			slashTimer = 0;
			slashProj = false;
		}
		break;
}
phaseTimer++;