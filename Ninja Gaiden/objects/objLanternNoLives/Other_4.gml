/// @description Destroy if necessary
if (global.currentLives > 0)
{
	instance_destroy(id);
}
else
{
	if (global.lifeLanternAppear)
	{
		itemDrop = LIFE;
	}
	else
	{
		instance_destroy(id);
	}
}