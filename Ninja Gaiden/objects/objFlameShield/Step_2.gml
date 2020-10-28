/// @description Stick to player
event_inherited();

if (instance_exists(locus))
{
	centerX = locus.x;
	if (locus.object_index == objPlayer)
	{
		centerY = ((locus.y - 12) + (8 * locus.isDuck));
	}
	else
	{
		centerY = locus.y;
	}
	depth = (locus.depth - 5);
	image_xscale = locus.image_xscale;
}
else
{
	instance_destroy();
}