/// @description Create pillar if necessary
if (!inside_view(48))
{
	var _pillar = instance_create_depth(x, y, depth, objFallingPillar);
		_pillar.image_xscale = image_xscale;
		_pillar.image_yscale = image_yscale;
	instance_destroy(id);
}