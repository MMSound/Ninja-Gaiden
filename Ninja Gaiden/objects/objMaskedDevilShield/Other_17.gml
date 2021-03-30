/// @description Set core to be hit
event_inherited();
if (instance_exists(objMaskedDevilCore))
{
	with (objMaskedDevilCore)
	{
		canBeHitManual = true;
		shieldCount--;
		hitsLeft++;
	}
}