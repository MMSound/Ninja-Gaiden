/// @description Stick to Masked Devil
if (instance_exists(locus))
{
	centerX = locus.x;
	centerY = locus.y;
	depth = (locus.depth - 5);
	image_xscale = locus.image_xscale;
}
else
{
	instance_destroy();
}