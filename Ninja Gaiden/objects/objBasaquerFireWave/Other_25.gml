/// @description Create more waves
if (image_index == 2 && order < orderMax && !hasMadeWave && !instance_place((x + (image_xscale * 8)), y, objSolid))
{
	var _wave = instance_create_depth((x + (image_xscale * 8)), y, depth, objBasaquerFireWave);
		_wave.order = (order + 1);
		_wave.image_xscale = image_xscale;
		_wave.orderMax = orderMax;
	hasMadeWave = true;
}
if (image_index == 5)
{
	instance_destroy(id);
}