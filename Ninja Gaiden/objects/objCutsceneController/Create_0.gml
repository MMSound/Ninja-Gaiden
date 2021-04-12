/// @description Variables
currentSequence = noone;
drawBlackBars = true;
depth = -10;
myTimeline = noone;
myScript = noone;

myBackgrounds = [];

//these functions are for managing backgrounds
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