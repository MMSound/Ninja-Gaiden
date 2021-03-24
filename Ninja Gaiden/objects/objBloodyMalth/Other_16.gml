/// @description Getting hit
event_inherited();

if (phase == 0 || phase == 4)
{
	nextPhase = (phase + 1);
	phase = 69;
	phaseTimer = 0;
	attackCount = 0;
	if (instance_exists(objGenericBullet))
	{
		with (objGenericBullet)
		{
			if (instance_exists(other))
			{
				if ((x - other.x) < 64)
				{
					instance_destroy(id);
				}
			}
		}
	}
	if (instance_exists(myLightning))
	{
		instance_destroy(myLightning);
		myLightning = noone;
	}
}