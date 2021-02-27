/// @description Check if we've been destroyed
if (instance_exists(myCrystal))
{
	if (!myCrystal.visible)
	{
		instance_destroy(id);
	}
}
else
{
	instance_destroy(id);
}