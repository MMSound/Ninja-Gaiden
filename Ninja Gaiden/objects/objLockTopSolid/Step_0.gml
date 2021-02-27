/// @description Check if we're locked
if (instance_exists(myCrystal))
{
	if (myCrystal.visible)
	{
		image_xscale = 1.00;
	}
	else
	{
		image_xscale = xScaleLock;
	}
}