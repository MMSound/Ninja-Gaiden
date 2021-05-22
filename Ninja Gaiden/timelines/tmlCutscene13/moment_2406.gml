/// @description Ninpo BG fade
var _layerID = layer_get_id("Background_10");
if (layer_exists(_layerID))
{
	layer_background_index(_layerID, 2);
}