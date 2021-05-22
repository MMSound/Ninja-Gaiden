/// @description Ninpo BG stop fading
var _layerID = layer_get_id("Background_10");
if (layer_exists(_layerID))
{
	layer_background_speed(_layerID, 0);
	layer_background_index(_layerID, 6);
}