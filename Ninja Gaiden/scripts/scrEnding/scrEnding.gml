//this script contains the ending's script
//put that here

//extra functions (for later reference)
function small_explosions()
{
	var _gen = instance_create_depth((global.viewX + 234), (global.viewY + 68), depth, objExplosionGenerator);
		_gen.image_xscale = 3.00;
		_gen.image_yscale = 5.00;
		_gen.explosionNumber = 6;	
}

function large_explosions()
{
	var _gen = instance_create_depth((global.viewX + 234), (global.viewY + 68), depth, objExplosionGenerator);
		_gen.image_xscale = 3.00;
		_gen.image_yscale = 5.00;
		_gen.explosionNumber = 1;
		_gen.explosionType = 1;
		_gen.explosionInterval = 5;	
}

function kill_explosions()
{
	if (instance_exists(objExplosionGenerator))
	{
		with (objExplosionGenerator)
		{
			instance_destroy(id);
		}
	}
}