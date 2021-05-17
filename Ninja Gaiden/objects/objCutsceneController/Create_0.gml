/// @description Variables
currentSequence = noone;
drawBlackBars = true;
depth = -10;
myTimeline = noone;
myScript = noone;

myBackgrounds = [];

//these functions are for managing backgrounds

//this one will add the amount of backgrounds you specify automatically (requires their names to be formatted in the Background_(number) format)
function backgrounds_add(_num)
{
	for (var i = 0; i < _num; i++)
	{
		var _layerName = string("Background_" + string(i));
		if (layer_exists(layer_get_id(_layerName)))
		{
			myBackgrounds[i] = _layerName;
		}
	}
}

//this one will set the specified layers to the specified visibility
function backgrounds_set_visible(_visible)
{
	for (var i = 1; i < argument_count; i++)
	{
		var _layerID = layer_get_id(myBackgrounds[argument[i]]);
		if (layer_exists(_layerID))
		{
			layer_set_visible(_layerID, _visible);
		}
	}
}

//syntax for this is xspeed, background, xspeed, background, etc.
function backgrounds_set_xspeed()
{
	for (var i = 1; i < argument_count; i += 2)
	{
		var _layerID = layer_get_id(myBackgrounds[argument[i]]);
		if (layer_exists(_layerID))
		{
			layer_hspeed(_layerID, argument[i - 1]);
		}
	}
}