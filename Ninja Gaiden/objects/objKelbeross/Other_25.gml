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
			}
		}
		else
		{
			xspeed = (2 * image_xscale);
		}
		
		//shooteng
		if (phaseTimer % 170 == 0 && phaseTimer != 0)
		{
			var _bullet = instance_create_depth((x + (15 * image_xscale)), (y - 18), (depth - 1), objGenericBullet);
				_bullet.sprite_index = sprKelberossBullet;
				_bullet.xspeed = (6 * image_xscale);
				_bullet.image_xscale = image_xscale;
				_bullet.contactDamage = 2;
				_bullet.imgSpd = (1 / 2);
		}
		break;
}

phaseTimer++;