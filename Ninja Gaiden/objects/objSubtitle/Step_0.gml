/// @description Count down
if (++lifeTimer == lifeTime)
{
	instance_destroy(id);
}