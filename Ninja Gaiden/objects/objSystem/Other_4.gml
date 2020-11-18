/// @description Move all the collision and objects down 8 pixels
if (instance_exists(prtCollision))
{
	with (prtCollision)
	{
		y += 8;
	}
}
if (instance_exists(prtEntity))
{
	with (prtEntity)
	{
		y += 8;
	}
}

//set timer
global.levelTime = 200;
global.levelTimer = 0;