/// @description Control the fight
if (myDevil == noone)
{
	myDevil = instance_create_depth(224, 200, 5, objMaskedDevil);
	myDevil.myCore = id;
}

//make shield
if (!initialShield)
{
	for (var i = 0; i < array_length(shieldID); i++)
	{
		shieldID[i] = instance_create_depth(myDevil.x, (myDevil.y - (sprite_get_height(myDevil) / 2)), depth, objMaskedDevilShield);
		shieldID[i].myCore = id;
		shieldID[i].thetaOffset = i;
		if (i > 0) //basically the point of this is to make all of the shields have the same theta
		{
			with (shieldID[i])
			{
				fix_theta();
			}	
		}
	}
	initialShield = true;
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