/// @description Getting hit
event_inherited();

if (hitCounter != 0)
{
	healthPoints++;
	hitCounter--;
}
else //switch sides
{
	if (++switchSidesCounter % 3 == 0)
	{
		if (!instance_exists(objJashinTail))
		{
			switch_sides();
		}
	}
}