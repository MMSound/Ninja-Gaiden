/// @description Stick to Bomberhead if necessary
if (instance_exists(myParent))
{
	if (isLocked) //probably change these coords later
	{
		x = myParent.x;
		y = (myParent.y - 32);
	}
}