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
			global.currentWeapon = wpnShuriken;
			break;
		case 8:
			global.currentWeapon = wpnWindmillShuriken;
			break;
		case 9:
			global.currentWeapon = wpnFlameWheel;
			break;
		case 10:
			global.currentWeapon = wpnSpinSlash;
			break;
		case 11:
			global.currentWeapon = wpnFlames;
			break;
	}	
	instance_destroy();
}