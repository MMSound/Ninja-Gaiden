/// @description Check if there's crystals
if (!activated)
{
	tile_layer_set_visible(myLayer, false);
	tile_layer_set_visible(myLayer2, false);
	var _advance = true;
	for (var i = 0; i < instance_number(objGuardianCrystal); i++)
	{
		if (instance_find(objGuardianCrystal, i).visible)
		{
			_advance = false;
		}
	}
	if (_advance)
	{
		activated = true;
		x += 16;
		y -= 48;
		image_xscale = 3.00;
		image_yscale = 14.00;
		tile_layer_set_visible(myLayer, true);
		tile_layer_set_visible(myLayer2, true);
	}
}