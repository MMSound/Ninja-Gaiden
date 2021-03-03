/// @description Check if we've been destroyed
if (instance_exists(myCrystal))
{
	if (!myCrystal.visible)
	{
		instance_destroy(id);
	}
	tile_layer_set_visible(myLayer, myCrystal.visible);
}
else
{
	instance_destroy(id);
}