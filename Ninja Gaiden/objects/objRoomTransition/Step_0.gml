/// @description Fade out and in
switch (phase)
{
	case 0: //fade out
		if (timer % 2 == 0)
		{
			if (global.screenColorIndex < 6)
			{
				global.screenColorIndex++;
			}
			else
			{
				phase = 1;
				timer = 0;
			}
		}
		break;
	case 1: //change room
		if (roomTo == -1)
		{
			room_restart();
		}
		else
		{
			room_goto(roomTo);
		}
		if (global.deathRespawn) //reset all the player stuf
		{
			if (global.currentLives > 0)
			{
				global.currentLives--;
			}
			else //temp
			{
				game_restart();
			}
			global.currentWeapon = 0;
			global.ninpo = 0;
		}
		phase = 2;
		timer = 0;
		break;
	case 2:
		if (timer % 2 == 0)
		{
			if (global.screenColorIndex > 0)
			{
				global.screenColorIndex--;
			}
			else
			{
				instance_destroy();
			}
		}
		break;	
}
timer++;