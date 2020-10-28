/// @description Stick to player
if (instance_exists(objPlayer))
{
	var _duck = (-6 * objPlayer.isDuck);
	x = objPlayer.x;
	y = (objPlayer.y - (16 + _duck));
	image_xscale = objPlayer.image_xscale;
}