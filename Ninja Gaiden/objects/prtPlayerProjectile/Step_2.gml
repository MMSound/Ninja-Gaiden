/// @description Despawn outside of screen
if (!inside_view())
{
	if (canDespawn)
	{
		instance_destroy();
	}
}