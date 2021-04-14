/// @description Adjust x and y position
var _layerID = layer_get_id(tileLayer);
if (layer_exists(_layerID))
{
	layer_x(_layerID, (global.viewX * parallaxX));
	layer_y(_layerID, (global.viewY * parallaxY));
}