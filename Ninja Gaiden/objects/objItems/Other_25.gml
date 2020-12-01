/// @description Do the item thing
image_index = floor(image_index);
if (place_meeting_player(x, y))
{
	switch (image_index)
	{
		case 0:
			global.currentLives++;
			break;
		case 1:
			if (instance_exists(objPlayer))
			{
				objPlayer.healthPoints += 6;
			}
			break;
		case 2:
			if (!instance_exists(objTimeFreezeController))
			{
				instance_create_depth(0, 0, depth, objTimeFreezeController);
			}
			break;
		case 3:
			global.gameScore += 500;
			break;
		case 4:
			global.gameScore += 1000;
			break;
		case 5:
			global.ninpo += 5;
			break;
		case 6:
			global.ninpo += 10;
			break;
		case 7:
			set_weapon(WEAPON_SHURIKEN);
			break;
		case 8:
			set_weapon(WEAPON_WINDMILL_SHURIKEN);
			break;
		case 9:
			set_weapon(WEAPON_FLAME_WHEEL);
			break;
		case 10:
			set_weapon(WEAPON_SPIN_SLASH);
			break;
		case 11:
			set_weapon(WEAPON_FLAMES);
			break;
	}
	play_sfx(sfxItemAcquisition);
	instance_destroy(id);
}

//despawn
if (lifeTimer >= lifeTime)
{
	instance_destroy(id);
}
else if (lifeTimer >= (lifeTime - 60))
{
	visible = (lifeTimer % 2 == 0);
}

lifeTimer++;
