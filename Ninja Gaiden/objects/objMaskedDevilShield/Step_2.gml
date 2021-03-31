/// @description Stick to Masked Devil
if (instance_exists(locus))
{
	centerX = locus.x;
	centerY = (locus.y - (sprite_get_height(locus) / 2));
	depth = (locus.depth - 5);
	image_xscale = locus.image_xscale;
}
else
{
	instance_destroy();
}