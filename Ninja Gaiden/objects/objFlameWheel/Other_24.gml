/// @description Custom variables
multiHit = true;

lifeTime = -1;

imgSpd = (1 / 3);

//create flames
for (var i = 0; i < 3; i++)
{
	var _flame = instance_create_depth(x, y, (depth - 5), objFlameShield);
		_flame.image_xscale = image_xscale;
		_flame.locus = id;
		_flame.thetaOffset = (i * (360 / 3));
}