/// @description Create more waves
if (image_index == 2 && order < 5 && !hasMadeWave && !instance_place((x + (image_xscale * 8)), y, objSolid))
{
	var _wave = instance_create_depth((x + (image_xscale * 8)), y, depth, objBasaquerFireWave);
		_wave.order = (order + 1);
		_wave.image_xscale = image_xscale;
	hasMadeWave = true;
}
if (image_index == 5)
{
	instance_destroy(id);
}