/// @description Control the fight
if (myDevil == noone)
{
	myDevil = instance_create_depth(224, 200, 5, objMaskedDevil);
	myDevil.myCore = id;
}

//make shield
if (!initialShield)
{
	if (shieldCount < shieldTotal)
	{
		for (var i = 0; i < shieldTotal; i++)
		{
			var _shield = instance_create_depth(myDevil.x, myDevil.y, depth, objMaskedDevilShield);
				_shield.myCore = id;
				_shield.thetaOffset = shieldCount;
			shieldCount++;
		}
	}
	else
	{
		initialShield = true;
	}
}

canBeHitManual = (hitsLeft != 0);

if (canBeHitManual)
{
	sprite_index = sprTopSolid;
}
else
{
	sprite_index = sprX;
}