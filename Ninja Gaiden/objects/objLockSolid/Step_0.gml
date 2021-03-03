/// @description Check if we're locked
if (instance_exists(myCrystal))
{
	if (myCrystal.visible)
	{
		image_yscale = 1.00;
	}
	else
	{
		image_yscale = yScaleLock;
	}
	tile_layer_set_visible(myLayer, !myCrystal.visible);
}