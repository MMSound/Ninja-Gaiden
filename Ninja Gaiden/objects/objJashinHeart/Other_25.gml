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
		
		var _shootTime = instance_exists(objJashinTail) ? 120 : 50;
		if (phaseTimer % _shootTime == 0 && instance_exists(objPlayer)) //projectiles
		{
			var _shrimp = instance_create_depth((x - 30), (y - 84), (depth - 1), objGenericBullet);
				_shrimp.doesGravity = true;
				_shrimp.xspeed = round(-clamp(((_shrimp.x - objPlayer.x) / 32), -1, 128));
				_shrimp.yspeed = -4;
				_shrimp.contactDamage = 3;
				_shrimp.sprite_index = sprJashinShrimp;
				_shrimp.imgSpd = 1;
			animTimer = 5;
			play_sfx(sfxJashinShrimp);
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
		
		var _shootTime = instance_exists(objJashinTail) ? 120 : 50;
		if (phaseTimer % _shootTime == 0 && instance_exists(objPlayer)) //projectiles
		{
			var _shrimp = instance_create_depth((x - 30), (y - 84), (depth - 1), objGenericBullet);
				_shrimp.doesGravity = true;
				_shrimp.xspeed = round(-clamp(((_shrimp.x - objPlayer.x) / 32), -1, 128));
				_shrimp.yspeed = -4;
				_shrimp.contactDamage = 3;
				_shrimp.sprite_index = sprJashinShrimp;
				_shrimp.imgSpd = 1;
			animTimer = 5;
			play_sfx(sfxJashinShrimp);
		}
		break;
}
phaseTimer++;