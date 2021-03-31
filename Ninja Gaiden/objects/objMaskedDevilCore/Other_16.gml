/// @description Getting hit
event_inherited();

for (var i = 0; i < array_length(shieldID); i++)
{
	if (shieldID[i] == noone)
	{
		shieldID[i] = instance_create_depth(myDevil.x, (myDevil.y - (sprite_get_height(myDevil) / 2)), depth, objMaskedDevilShield);
		shieldID[i].myCore = id;
		shieldID[i].thetaOffset = i;
		with (shieldID[i]) //basically the point of this is to make all of the shields have the same theta
		{
			fix_theta();
		}
		i = array_length(shieldID);
	}
}
if (hitsLeft > 0)
{
	hitsLeft--;
}