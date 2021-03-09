/// @description Stick to Bomberhead if necessary
if (instance_exists(myParent))
{
	if (isLocked) //probably change these coords later
	{
		x = (myParent.x - (8 * myParent.image_xscale));
		y = (myParent.y - 32);
	}
}