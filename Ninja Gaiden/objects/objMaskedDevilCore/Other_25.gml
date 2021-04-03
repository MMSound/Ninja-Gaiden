/// @description Control the fight
if (myDevil == noone)
{
	myDevil = instance_create_depth(224, 200, 5, objMaskedDevil);
	myDevil.myCore = id;
}
if (!instance_exists(objMaskedDevilShell))
{
	instance_create_depth(x, y, (depth - 1), objMaskedDevilShell);
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

colorIndex += 0.25;
if (colorIndex > 3)
{
	colorIndex = 0;
}

//shell animation
if (!canBeHitManual)
{
	if (shellFrame > 0)
	{
		shellFrame -= 0.25;
	}
}
else
{
	if (shellFrame < 2)
	{
		shellFrame += 0.25;
	}	
}

//adjust the frame
if (instance_exists(objMaskedDevilShell))
{
	with (objMaskedDevilShell)
	{
		image_index = floor(other.shellFrame);
	}
}