/// @description Movement
switch (phase)
{
	case 0: //kelbeross cannon :)
		if (instance_exists(objPlayer))
		{
			var _playerDir = sign(objPlayer.x - x);
			if (_playerDir != 0)
			{
				image_xscale = _playerDir;
			}
		}
		
		//shooteng
		if (phaseTimer % 150 == 0 && phaseTimer != 0)
		{
			var _bullet = instance_create_depth((x + (15 * image_xscale)), (y - 18), (depth - 1), objGenericBullet);
				_bullet.sprite_index = sprKelberossBullet;
				_bullet.xspeed = (6 * image_xscale);
				_bullet.image_xscale = image_xscale;
				_bullet.contactDamage = 2;
				_bullet.imgSpd = (1 / 2);
			animTimer = 10;
		}
		break;
	case 1: //jumpeng around
		if (grounded())
		{
			xspeed = 0;
			if (++jumpTimer == jumpTime)
			{
				yspeed = -6;
				jumpTimer = 0;
				if (++jumpCount % 3 == 0) //face the player every third jump
				{
					if (instance_exists(objPlayer))
					{
						var _playerDir = sign(objPlayer.x - x);
						if (_playerDir != 0)
						{
							image_xscale = _playerDir;
						}
					}					
				}
			}
		}
		else
		{
			xspeed = ((2 + (instance_number(objKelbeross) == 1)) * image_xscale);
		}
		
		//shooteng
		var _shootTime = (instance_number(objKelbeross) == 1) ? 65 : 130;
		if (phaseTimer % _shootTime == 0 && phaseTimer != 0)
		{
			var _bullet = instance_create_depth((x + (15 * image_xscale)), (y - 18), (depth - 1), objGenericBullet);
				_bullet.sprite_index = sprKelberossBullet;
				_bullet.xspeed = (6 * image_xscale);
				_bullet.image_xscale = image_xscale;
				_bullet.contactDamage = 2;
				_bullet.imgSpd = (1 / 2);
			animTimer = 10;
		}
		break;
}

phaseTimer++;

//animation
if (grounded())
{
	image_index = (animTimer > 0);
}
else
{
	image_index = 2;
}

if (animTimer > 0)
{
	animTimer--;
}